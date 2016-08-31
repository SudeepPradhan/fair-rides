/**
 * 
 */

var Rides = (function() {
	'use strict';

	var appPath = "/project";

	// output selector
	var output = $("#output");
	var myModal = $("#myModal");
	// login page retrieve
	function loginSucFunc(data) {
		myModal.modal('show');
		$('.modal-title').text("Login Page")
		$('.modal-body').html(data);
	}

	function contentSucFunc(res) {
		output.html(res);
	}

	// error retrieve
	function errorFunc(xhr, errCode, responseText) {
		console.log(xhr, errCode, responseText);
	}

	return {
		auth : function() {
			var email = this.getCookie("email");
			if (email) {
				// just normal behaviour
				$.ajax(appPath + "/content", {}).success(contentSucFunc).error(
						errorFunc);

			} else {
				// check if cookie has valid session id then bring rides
				// and ask rides content
				// if not then bring register / sign in
				$.ajax(appPath + "/login", {}).success(loginSucFunc).error(
						errorFunc);
			}
		},
		getSerializedObject : function(selector) {
			var data = {};
			jQuery.each($(selector).serializeArray(), function(i, field) {
				data[field.name] = field.value;
			});
			return data;
		},
		getCookie : function(cname) {
			var name = cname + "=";
			var ca = document.cookie.split(';');
			for (var i = 0; i < ca.length; i++) {
				var c = ca[i];
				while (c.charAt(0) == ' ') {
					c = c.substring(1);
				}
				if (c.indexOf(name) == 0) {
					return c.substring(name.length, c.length);
				}
			}
			return "";
		},
		cleanCookies : function() {
			for (var it in $.cookie()) $.removeCookie(it);
		}
	};

})();
