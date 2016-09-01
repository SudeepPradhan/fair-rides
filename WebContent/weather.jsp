<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Weather Services</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="css/bootstrap.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script>
if($.cookie('email') == undefined && $.cookie('email') == null){ 
		location.href = './';
	}
</script>
</head>
<body>
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="./">Fair Ride</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="./">Home</a></li>
					<li><a href="">How it work?</a></li>
					<li><a href="">Support</a></li>
					<li class="active"><a href="weather" title="Weather Service">Weather
							Service</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="true">Options <span
							class="glyphicon glyphicon-cog"></span> <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="">Update Profile <span
									class="glyphicon glyphicon-user"></span></a></li>
							<li><a href="#" id="logoutBtn">Logout <span
									class="glyphicon glyphicon-remove-circle"></span></a></li>
						</ul></li>
					<!-- auth?action=logout -->
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>

	<div class="container">

		<div class="jumbotron">

			<%@ include file="notification.jsp"%>

			<div class="well weatherJumbotron">
				<h2>Weather Service</h2>

				<div class="col-lg-6">
					<div class="input-group">
						<input type="text" class="form-control input-lg"
							id="searchDestination" placeholder="Mt Pleasant or 52641..." />
						<span class="input-group-btn">
							<button class="btn btn-info btn-lg" id="btnDestination"
								type="button">
								<span class="glyphicon glyphicon-search"></span> Search
							</button>
						</span>
					</div>
				</div>
			</div>

			<script async defer
				src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAR08bXpU9I5iqszlQ4f7rLoGTLhvkycvg&callback=initialize"
				type="text/javascript">
				
			</script>
			<script>
				var map;
				var geoJSON;
				var request;
				var google;
				var geocoder;
				var gettingData = false;
				var address;
				var openWeatherMapKey = "521a1b7b3f1b8d18fa44380c06bcc261"
				function initialize(addr) {
					var infowindow = new google.maps.InfoWindow();
					var mapOptions = {
						zoom : 2
					};
					var uaddr = $.cookie('city')+','+$.cookie('state');
					var uzipcode = $.cookie('zipcode');
					address = addr || uaddr || uzipcode || "fairfield,ia";
					var geocoder = new google.maps.Geocoder();
					geocoder.geocode({
						'address' : address
					}, function(results, status) {
						if (status == google.maps.GeocoderStatus.OK) {
							map.setCenter(results[0].geometry.location);
							map.fitBounds(results[0].geometry.viewport);
							map.setZoom(8);
						}
					});

					map = new google.maps.Map(document
							.getElementById('map-canvas'), mapOptions);
					// Add interaction listeners to make weather requests
					google.maps.event.addListener(map, 'idle',
							checkIfDataRequested);
					// Sets up and populates the info window with details
					map.data.addListener('click', function(event) {
						infowindow.setContent("<img src="
								+ event.feature.getProperty("icon") + ">"
								+ "<br /><strong>"
								+ event.feature.getProperty("city")
								+ "</strong>" + "<br />"
								+ event.feature.getProperty("temperature")
								+ "&deg;C" + "<br />"
								+ event.feature.getProperty("weather"));
						infowindow.setOptions({
							position : {
								lat : event.latLng.lat(),
								lng : event.latLng.lng()
							},
							pixelOffset : {
								width : 0,
								height : -15
							}
						});
						infowindow.open(map);
					});
				}
				var checkIfDataRequested = function() {
					// Stop extra requests being sent
					while (gettingData === true) {
						request.abort();
						gettingData = false;
					}
					getCoords();
				};
				// Get the coordinates from the Map bounds
				var getCoords = function() {
					var bounds = map.getBounds();
					var NE = bounds.getNorthEast();
					var SW = bounds.getSouthWest();
					getWeather(NE.lat(), NE.lng(), SW.lat(), SW.lng());
				};
				// Make the weather request
				var getWeather = function(northLat, eastLng, southLat, westLng) {
					gettingData = true;
					var requestString = "http://api.openweathermap.org/data/2.5/box/city?bbox="
							+ westLng
							+ ","
							+ northLat
							+ "," //left top
							+ eastLng
							+ ","
							+ southLat
							+ "," //right bottom
							+ map.getZoom()
							+ "&cluster=yes&format=json"
							+ "&APPID=" + openWeatherMapKey;
					request = new XMLHttpRequest();
					request.onload = proccessResults;
					request.open("get", requestString, true);
					request.send();
				};
				// Take the JSON results and proccess them
				var proccessResults = function() {
					var results = JSON.parse(this.responseText);
					if (results.list.length > 0) {
						resetData();
						for (var i = 0; i < results.list.length; i++) {
							geoJSON.features
									.push(jsonToGeoJson(results.list[i]));
						}
						drawIcons(geoJSON);
					}
				};
				/* var infowindow = new google.maps.InfoWindow(); */
				// For each result that comes back, convert the data to geoJSON
				var jsonToGeoJson = function(weatherItem) {
					var feature = {
						type : "Feature",
						properties : {
							city : weatherItem.name,
							weather : weatherItem.weather[0].main,
							temperature : weatherItem.main.temp,
							min : weatherItem.main.temp_min,
							max : weatherItem.main.temp_max,
							humidity : weatherItem.main.humidity,
							pressure : weatherItem.main.pressure,
							windSpeed : weatherItem.wind.speed,
							windDegrees : weatherItem.wind.deg,
							windGust : weatherItem.wind.gust,
							icon : "http://openweathermap.org/img/w/"
									+ weatherItem.weather[0].icon + ".png",
							coordinates : [ weatherItem.coord.lon,
									weatherItem.coord.lat ]
						},
						geometry : {
							type : "Point",
							coordinates : [ weatherItem.coord.lon,
									weatherItem.coord.lat ]
						}
					};
					// Set the custom marker icon
					map.data.setStyle(function(feature) {
						return {
							icon : {
								url : feature.getProperty('icon'),
								anchor : new google.maps.Point(25, 25)
							}
						};
					});
					// returns object
					return feature;
				};
				// Add the markers to the map
				var drawIcons = function(weather) {
					map.data.addGeoJson(geoJSON);
					// Set the flag to finished
					gettingData = false;
				};
				// Clear data layer and geoJSON
				var resetData = function() {
					geoJSON = {
						type : "FeatureCollection",
						features : []
					};
					map.data.forEach(function(feature) {
						map.data.remove(feature);
					});
				};
				//google.maps.event.addDomListener(window, 'load', initialize);
 				
				$("#btnDestination").click(function() {
					var address = $("#searchDestination").val();
					initialize(address);
				});
				
				
				
			</script>






			<div>

				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#cw"
						aria-controls="cw" role="tab" data-toggle="tab">Current
							Weather</a></li>
					<li role="presentation"><a href="#days5" aria-controls="days5"
						role="tab" data-toggle="tab">5 Days forecast</a></li>
					<li role="presentation"><a href="#hours3"
						aria-controls="hours3" role="tab" data-toggle="tab">3 Hours
							forecast</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="cw">
						<h3>Current Weather</h3>

						<div id="map-canvas"></div>

					</div>
					<div role="tabpanel" class="tab-pane" id="days5">
						<h3>5 Days forecast</h3>

						<div id="forecast5days"></div>

					</div>
					<div role="tabpanel" class="tab-pane" id="hours3">
						<h3>3 Hours forecast</h3>

						<div id="forecast3hours"></div>

					</div>
				</div>

			</div>





			<footer class="footer">
				<p>&copy; 2016 WAP2016AugGroup7, Inc.</p>
			</footer>
		</div>
		<!-- /jumbotron -->

	</div>
	<!-- /container -->
	<script type="text/javascript" src="js/rides.js"></script>
	<script type="text/javascript" src="js/script1.js"></script>
	<script>
		//load jQuery
		$(document).ready(function() {

			//testing module pattern
			Rides.auth();

		});
	</script>
</body>
</html>