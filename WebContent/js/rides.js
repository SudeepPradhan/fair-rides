/**
 * 
 */
 
var Rides = (function(){
	'use strict';
	
	var appPath = "/project";
	
	//output selector
	var output =  $("#output");
	var myModal = $("#myModal");
	//login page retrieve
	function loginSucFunc(data){
		myModal.modal('show');
		$('.modal-title').text("Login Page")
		$('.modal-body').html(data);
  	}
	
	//error retrieve
	function errorFunc(xhr,errCode,responseText){
		console.log(xhr,errCode,responseText);
	}
	
	return { 
		auth: function(){
			// check if cookie has valid session id then bring rides 
			// and ask rides content
			// if not then bring register / sign in
			$.ajax(appPath+"/login",{})
			.success(loginSucFunc)
			.error(errorFunc);
		},
		getSerializedObject: function(selector){
			var data = {};
  			jQuery.each( $(selector).serializeArray(), function( i, field ) {
			       data[field.name]=field.value;
			    });
 			return data;
		}
	};
	
	
})();
