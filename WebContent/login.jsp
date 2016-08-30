<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<form id="login" class="form-horizontal">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="email" id="inputEmail3" placeholder="Email" required/>
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" name="password" id="inputPassword3" placeholder="Password" required/>
    </div>
  </div>
   
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="button" id="loginSubmit" class="btn btn-info">Sign in</button>
    </div>
  </div>
  <div class="form-group pull-right">
    <div class="col-sm-offset-2 col-sm-10">
      Or <a id="registerForm" class="btn btn-info" >Register</a>
    </div>
  </div>
</form>
  

