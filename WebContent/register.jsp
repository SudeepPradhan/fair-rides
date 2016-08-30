<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en">
<head>
  <title>Register Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="Register.js"></script>
</head>
<body>

    <h2>Register Page</h2>
    <form class="form-horizontal">
     <div class="form-group">
    <label for="inputFullName" class="col-sm-2 control-label">Full Name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputFullName" placeholder="full name" />
    </div>
  </div>
  <label for="Gender" class="col-sm-2 control-label">Gender</label>
  <div class="radio">
  <label>
    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
    Male
  </label>

  <label>
    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
    Female
  </label>
  
</div>

   <div class="form-group">
    <label for="inputState" class="col-sm-2 control-label">State</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputState" placeholder="state" />
    </div>
  </div>
   <div class="form-group">
    <label for="inputCity" class="col-sm-2 control-label">City</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputCity" placeholder="city"/>
    </div>
  </div>
   <div class="form-group">
    <label for="inputStreet" class="col-sm-2 control-label">Street</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputStreet" placeholder="street"/>
    </div>
  </div>
   <div class="form-group">
    <label for="inputZipCode" class="col-sm-2 control-label">Zip Code</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputZipCode" placeholder="zip code"/>
    </div>
  </div>
  <div class="form-group">
    <label for="inputBirthYear" class="col-sm-2 control-label">Birth Year</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" class="bootstrap-datepicker" id="BirthYear" placeholder="birth year"/>
    </div>
  </div>
   <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10"> 
      <input type="email" class="form-control" id="Email" placeholder="Email">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="Password" placeholder="Password">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputConfirmPassword" class="col-sm-2 control-label">Confirm Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="ConfirmPassword" placeholder="Confirm Password">
    </div>
  </div>
 
 
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">Register</button>
    </div>
  </div>
</form>
<script>$("#Register Page").validate()</script>
</body>
</html>
   
   

