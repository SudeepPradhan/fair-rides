/**
 * 
 */
$(document).ready(function() {
	
	var APPID = "521a1b7b3f1b8d18fa44380c06bcc261";
	var mode  = "json";
	var myModal = $("#myModal");
	var output  = $("#output");
	// bring form to the front
	$(document).delegate("#registerForm", "click", function() {
		$.ajax("/project/register", {}).success(function(data) {
			$(".modal-title").text("Register Page");
			$(".modal-body").html(data);
		});
	});

	$(document).delegate("#loginForm", "click", function() {
		myModal.modal("show");
		$.ajax("/project/login", {}).success(function(data) {
			$(".modal-title").text("Login Page");
			$(".modal-body").html(data);
		});
	});

	$(document).delegate("#loginSubmit", "click", function() {
 		var data = Rides.getSerializedObject("#login");
		$.ajax("/project/login", {
			"type" : "post",
			"data" : data
		}).success(function(res){
			if(res != null){
				var response = JSON.parse(res);
				if(response.email != null){
					myModal.modal("hide");
					$(".alert-success").show("slow").html("Successfully logged in.");
					$.ajax("/project/content", {}).success(function(out){output.html(out);});
				}
			}
		});
	});

	$(document).delegate("#registerSubmit", "click", function() {
		var data = Rides.getSerializedObject("#register");
		$.ajax("/project/register", {
			"type" : "post",
			"data" : data
		}).success(function(res){
			if(res != null){
				var response = JSON.parse(res);
				if(response.message != null){
					$(".alert-success").show("slow").html(response.message);
				}
				if(response.email != null){
					myModal.modal("hide");
					$(".alert-success").show("slow").html("Successfully registered and logged in.");
					$.ajax("/project/content", {}).success(function(out){output.html(out);});
				}
			}
		});

	});
	
	
	$(document).delegate("#postrideForm", "click", function() { 
		myModal.modal("show");
		$.ajax("/project/postride", {}).success(function(res) {
 			$(".modal-title").text("Post Ride");
			$(".modal-body").html(res);
		});
	});
	
	$(document).delegate("#askrideForm", "click", function() {  
		myModal.modal("show");
		$.ajax("/project/askride", {}).success(function(data) {
			$(".modal-title").text("Ask Ride");
			$(".modal-body").html(data);
		});
	});
	
	 $("#logoutBtn").click(function(){
		 Rides.cleanCookies();
		 $.ajax("/project/auth",{"type":"GET",data:{"action":"logout"}}).success(function(res){
			 console.log(res);
		 });
		 location.href = location.href;
	 });
	
 	///openweathermap 5days forecast
 	 $.ajax("http://api.openweathermap.org/data/2.5/forecast",{
		 "type":"GET","data":{"q":"fairfield,ia","cnt":"5","mode":mode,"APPID":APPID}})
		 .success(function(res){
 			 console.log(res);
 			 var forecast5days = $("#forecast5days");
			 $.each(res.list,function(index,obj){
				 	forecast5days.append("<div class=\"pull-left\">"+obj.dt_txt+
				 			"<p>Weather:"+obj.weather[0].description+"</p>"+
				 			"<p>Humidity:"+obj.main.humidity+"</p>"
				 			+"</div>");
				 	
 				 	
			 	 
			 });
			 
		 })
		 .error(function(a,b,c){
			console.log(a,b,c); 
		 });
 	 
 	 
 	///openweathermap 3hours forecast
 	 $.ajax("http://api.openweathermap.org/data/2.5/forecast",{
		 "type":"GET","data":{"q":"fairfield,ia","mode":mode,"APPID":APPID}})
		 .success(function(res){
			 console.log(res);
			 var forecast3hours = $("#forecast3hours");
			 $.each(res.list,function(index,obj){
				 forecast3hours.append("<div class=\"pull-left\">"+obj.dt_txt+
				 			"<p>Weather:"+obj.weather[0].description+"</p>"+
				 			"<p>Humidity:"+obj.main.humidity+"</p>"
				 			+"</div>");
			 });			 
		 })
		 .error(function(a,b,c){
			console.log(a,b,c); 
		 });
	

 	$(document).delegate("#postSubmit", "click", function() {  
  		var data = Rides.getSerializedObject("#offer");
		$.ajax("/project/postride", {
			"type" : "post",
			"data" : data
		}).success(function(res){
 			if(res != null){
 				myModal.modal("hide");
				$(".alert-success").show("slow").html("Successfully posted offer.");
				$.ajax("/project/content", {}).success(function(out){output.html(out);});
 			}
		});
 	 });
 	
 	
 	$(document).delegate("#requestSubmit", "click", function() {  
  		var data = Rides.getSerializedObject("#request");
		$.ajax("/project/askride", {
			"type" : "post",
			"data" : data
		}).success(function(res){
 			if(res != null){
 				myModal.modal("hide");
				$(".alert-success").show("slow").html("Successfully posted request.");
				$.ajax("/project/content", {}).success(function(out){output.html(out);
				 
				});
 				 
			}
		});
 	 });
 	
 	
 	$(document).delegate(".commentbox", "keypress", function(e) {  
 		 if(e.which == 13) { //if pressed enter it will save;
 			 var comment = $(this).val();
 			 var postid = $(this).parent().attr("data-post-id");
 			$.ajax("/project/comment", {
 				"type" : "post",
 				"data" : {"comment":comment,"postid":postid}
 			}).success(function(res){
 	 			if(res != null){
  					$(".alert-success").show("slow").html("Successfully added comment.");
  					location.href = location.href;
 	 				 
 				}
 			});
 	         
 	    }
 	 });
 	
 	$(document).delegate(".likebtn", "click", function(e) {  
 			 var postid = $(this).parent().attr("data-post-id");
 			 console.log(postid);
			$.ajax("/project/like", {
				"type" : "post",
				"data" : {"postid":postid}
			}).success(function(res){
	 			if(res != null){
 					$(".alert-success").show("slow").html("Successfully added like.");
 					location.href = location.href;
	 				 
				}
			});
	         
	 });
 	 
 	 
});