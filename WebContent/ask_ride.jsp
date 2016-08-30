<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>Ride ask page</h2>

    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    
	<link href="css/bootstrap.css" type="text/css" rel="stylesheet" />


	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>



<div class="container">
    <form class="well form-horizontal" action=" " method="post"  id="contact_form">
		<fieldset>

			<!-- Form Name -->
			
			<legend>Set destinations</legend>            
            
			<!-- Text input-->
			      
			<div class="form-group">
			  <label class="col-md-4 control-label">From</label>  
			    <div class="col-md-4 inputGroupContainer">
				    <div class="input-group">
				        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
				  		<input name="fromDestination" placeholder="From Destination" class="form-control" type="text">
				    </div>
			 	</div>
			</div>
			
			<!-- Text input-->
			 
			<div class="form-group">
			  <label class="col-md-4 control-label">To</label>  
			    <div class="col-md-4 inputGroupContainer">
				    <div class="input-group">
				        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
				  		<input name="toDestination" placeholder="To Destination" class="form-control"  type="text">
				    </div>
			  </div>
			</div>
			
			<!-- Text area -->
			  
			<div class="form-group">
			  <label class="col-md-4 control-label">Notes</label>
			    <div class="col-md-4 inputGroupContainer">
				    <div class="input-group">
				        <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
				        <textarea class="form-control" name="comment" placeholder="Project Description" rows="10c"></textarea>
				  	</div>
			  	</div>
			</div>
			
			<!-- Date picker -->

			<div class="form-group">
                <label for="dtp_input1" class="col-md-4 control-label">DateTime</label>
                <div class="input-group date form_datetime col-md-4" data-date="1979-09-16T05:25:07Z" 
                data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
                    <input class="form-control" size="10" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
				<input type="hidden" id="dtp_input1" value="" /><br/>
            </div>
			
			<!-- Button -->
			<div class="form-group">
  				<label class="col-md-4 control-label"></label>
  				<div class="col-md-4">
    				<button type="submit" class="btn btn-warning" >Send <span class="glyphicon glyphicon-send"></span></button>
  				</div>
			</div>

		</fieldset>
	</form>
</div>


<script type="text/javascript" src="js/jquery-3.1.0.min" charset="UTF-8"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.js" charset="UTF-8"></script>

<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });
</script>


