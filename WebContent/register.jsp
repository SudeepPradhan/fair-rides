<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
	
<form class="form-horizontal" id="register" onsubmit="return validate()" method="post">
		<div class="form-group">
			<label for="inputFullName" class="col-sm-2 control-label">Full Name</label>
			<div class="col-sm-8">
			<input type="text" class="form-control" name="fullname" placeholder="Full name"  />
			</div>
		</div>
  
  		<div class="form-group">
	  		<label for="Gender" class="col-sm-2 control-label">Gender</label>
		  	<div class="radio col-sm-8">
		  		<label><input type="radio" name="gender" id="optionsRadios1" value="0" checked>Male</label>
		  		<label><input type="radio" name="gender" id="optionsRadios2" value="1">Female</label>  
			</div>
		</div>

		<div class="form-group">
			<label for="inputState" class="col-sm-2 control-label">State</label>
			<div class="col-sm-8">
			<input type="text" class="form-control" name="state" placeholder="state" />
			</div>
		</div>
  
		<div class="form-group">
			<label for="inputCity" class="col-sm-2 control-label">City</label>
			<div class="col-sm-8">
			<input type="text" class="form-control" name="city" placeholder="city"/>
			</div>
		</div>
  
		<div class="form-group">
			<label for="inputStreet" class="col-sm-2 control-label">Street</label>
			<div class="col-sm-8">
			<input type="text" class="form-control" name="street" placeholder="street"/>
			</div>
		</div>
  
		<div class="form-group">
			<label for="inputZipCode" class="col-sm-2 control-label">Zip Code</label>
			<div class="col-sm-8">
			<input type="text" class="form-control" id="zip" name="zipcode" placeholder="zip code"/>
			</div>
		</div>
  
		<div class="form-group">
			<label for="inputBirthYear" class="col-sm-2 control-label">Birth Year</label>
			<div class="col-sm-8">
			<input name="birthyear" type="number" class="form-control" class="bootstrap-datepicker" 
			id="birthyear" placeholder="birth year"/>
			</div>
		</div> 
  
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
			<div class="col-sm-8"> 
			<input name="email" type="text" class="form-control" placeholder="Enter email">
			</div>
		</div>
  
		<div class="form-group">
		  <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
		  <div class="col-sm-8">
		    <input name="password" type="password" class="form-control" id="Password" placeholder="Password">
		  </div>
		</div>

		<div class="form-group">
		  <div class="col-sm-offset-2 col-sm-8">
		    <button id="registerSubmit" type="button" class="btn btn-default">Register</button>
		  </div>
		</div>  
</form>

<script type="text/javascript" src="js/jquery.validate.js"></script>
<script src="js/register.js"></script>
<script>$("#submit-button").validate();</script>


	

 
	