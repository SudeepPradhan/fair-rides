

$(function() {
	

	//$("form[name='registration']").validate({
		$("#registration-form").validate({
	
		// Specify validation rules
		rules : {
			zip : {
				required : true,
				regx : /^[0-9]{5}$/
			},
			birthyear:{
				required : true,
				regx : /^[0-9]{4}$/,
				
			},
			password:{
				required:true,
				regx:/^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])[0-9a-zA-Z]{6,}$/
			},
			
			email:{
				required:true,
				regx:/^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/
			},
			birthyear:{
				required:true,
				checkAge:birthyear
			}
				
		},
		messages : {
			zip : {
			    required:"Please provide the zip",
				regx:"Zip must be numbers of exactly length 5"
				
			},
			birthyear:{
				required:"Please provide the birthyear",
				regx:"Please provide valid Year",
					checkAge:"User can not have their age below 18"
				
			},
			/*birthyear:"User can not have their age below 18",*/
			password:{
				required:"Please provide the password",
				regx:"Password must be atleast 6 letters having atlest one capital letter, one small letter and one number",
			},
			
			
			email:{
				required:"Please provide the email",
				regx:"Enter the valid email"
			}
		},
		submitHandler : function(form) {
			form.submit();
		}
	});

});

$.validator.addMethod("regx", function(value, element, regexpr) {
	return regexpr.test(value);
});

$.validator.addMethod("checkAge", function (value, element) {
    if (this.optional(element)) {
        return true;
    }

    var birthyear = value;
   
    if (new Date().getFullYear() - birthyear <= 18) {
        return false;
    }
    return true;
});


$.validator.addMethod("regx", function(value, element, regexpr) {
	return regexpr.test(value);
});
