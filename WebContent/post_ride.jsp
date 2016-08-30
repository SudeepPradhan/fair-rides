<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

<form class="form-horizontal" action="./askride" method="post" id="contact_form">
	<fieldset>
	<!-- Text input-->

	<div class="form-group">
		<label class="col-sm-2 control-label">From</label>
		<div class="col-sm-10">
			<div class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-home"></i></span> <input
					name="fromDestination" placeholder="Source"
					class="form-control" type="text">
			</div>
		</div>
	</div>

	<!-- Text input-->

	<div class="form-group">
		<label class="col-sm-2 control-label">To</label>
		<div class="col-sm-10">
			<div class="input-group">
				<span class="input-group-addon">
					<i class="glyphicon glyphicon-home"></i>
				</span> 
				<input name="toDestination"	placeholder="Destination" class="form-control" type="text">
			</div>
		</div>
	</div>

	<!-- Date picker -->

	<div class="form-group">
		<label class="col-sm-2 control-label">DateTime</label>
		
					<div class="col-sm-10">
		<div class="input-group date form_datetime col-sm-8"
			data-date="1979-09-16T05:25:07Z"
			data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
			
			<span class="input-group-addon">
				<i class="glyphicon glyphicon-th"></i>
			</span>
			
			<input class="form-control" type="text" readonly>
		</div>
		
		<input type="hidden" id="dtp_input1" value="" /><br />
		
		</div>
	</div>
	
	<!-- Text input-->

	<div class="form-group">
		<label class="col-sm-2 control-label">Seats</label>
		<div class="col-sm-4">
			<div class="input-group">
				<span class="input-group-addon">
					<i class="glyphicon glyphicon-user"></i>
				</span> 
				<input name="seats"	placeholder="Passengers" class="form-control" type="text">
			</div>
		</div>
	</div>
	
	<!-- Radio button-->
	
	<div class="form-group">
	    <label class="col-md-2 control-label">Non-Smoking</label>
	    <div class="col-sm-10">
	        <div class="input-group">
	                <input type="checkbox" name="nonSmoking" /> 
	        </div>
	    </div>
	</div>

	<!-- Text area -->

	<div class="form-group">
		<label class="col-sm-2 control-label">Notes</label>
		<div class="col-sm-10">
			<div class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-pencil"></i></span>
				<textarea class="form-control" name="notes" rows="6"></textarea>
			</div>
		</div>
	</div>

	<!-- Button -->
	<div class="form-group">
		<label class="col-sm-2 control-label"></label>
		<div class="col-sm-10">
			<button type="submit" class="btn btn-warning">
				Submit <span class="glyphicon glyphicon-send"></span>
			</button>
		</div>
	</div>

	</fieldset>
</form>


<script type="text/javascript" src="js/bootstrap-datetimepicker.js"
	charset="UTF-8"></script>

<script type="text/javascript">
	$('.form_datetime').datetimepicker({
		//language:  'fr',
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		forceParse : 0,
		showMeridian : 1
	});
</script>


