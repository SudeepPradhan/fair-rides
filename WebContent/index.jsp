<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to FairRides</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="css/bootstrap.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
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
				<a class="navbar-brand" href="#">Fair Ride</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#about">How it work?</a></li>
					<li><a href="#contact">Support</a></li>
					<li><a href="javascript:;" id="weatherForm">Weather
							Service</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="true">Options <span class="glyphicon glyphicon-cog"></span> <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Update Profile <span
									class="glyphicon glyphicon-user"></span></a></li>
							<li><a href="auth?action=logout">Logout <span
									class="glyphicon glyphicon-remove-circle"></span></a></li>
						</ul></li>

				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>

	<div class="container">

		<div class="jumbotron">

			<div class="alert homealert alert-success">
				<strong>Success!</strong>
			</div>
			<div id="output"></div>




			<footer class="footer">
				<p>&copy; 2016 WAP2016AugGroup7, Inc.</p>
			</footer>

		</div>
		<!-- /container -->




		<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Actions</h4>
					</div>
					<div class="modal-body"></div>
					<div class="modal-footer hide">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div>
				</div>
			</div>
		</div>


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