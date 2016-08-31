<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<form class="form-horizontal" action="./askride" method="post" id="contact_form">
	<fieldset>
		<!-- Text area -->
	
		<div class="form-group">
			<label class="col-sm-1 control-label">Post</label>
			<div class="col-sm-10">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-pencil"></i></span>
					<textarea class="form-control" name="post" rows="6" required></textarea>
				</div>
			</div>
		</div>
	
		<!-- Button -->
		<div class="form-group pull-right">
			<label class="col-sm-2 control-label"></label>
			<div class="col-sm-10">
				<button type="submit" class="btn btn-warning">
					Submit <span class="glyphicon glyphicon-send"></span>
				</button>
			</div>
		</div>

	</fieldset>
</form>


