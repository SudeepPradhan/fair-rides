/**
 * 
 */
$(document).ready(function() {
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
		 console.log(this);
//		 Rides.cleanCookies();
//		 $.ajax("/project/auth",{"type":"GET",data:{"action":"logout"}}).success(function(res){
//			 console.log(res);
//		 });
//		 location.reload();
	 });
	
 	
	

});