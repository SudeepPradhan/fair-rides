/**
 * 
 */

var Rides = (function(){
	'use strict';
	
	var appPath = "/project";
	
	//output selector
	var output =  $("#output");
	
	//login page retrieve
	function loginSucFunc(data){
		console.log(data);
		output.html(data);
  	}
	
	//error retrieve
	function errorFunc(xhr,errCode,responseText){
		console.log(xhr,errCode,responseText);
	}
	
	return {
		init: function(){
			loginSucFunc();
			errorFunc();
		},
		auth: function(){
			// check if cookie has valid session id then bring rides 
			// and ask rides content
			// if not then bring register / sign in
			$.ajax(appPath+"/login",{})
			.success(loginSucFunc)
			.error(errorFunc);
		}
	};
	
	
})();
