<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to FairRides</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="css/bootstrap.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</head>
<body>
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Fair Ride</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#about">How it work?</a></li>
					<li><a href="#contact">Support</a></li>
					<li><a href="javascript:;" id="weatherForm">Weather Service</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="#"> <span
							class="glyphicon glyphicon-user"></span> Profile <span
							class="sr-only">(current)</span></a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>

	<div class="container">
		<div id="output"></div>

		<div class="jumbotron">

			<div>

				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#posts"
						aria-controls="home" role="tab" data-toggle="tab">Posts Ride</a></li>
					<li role="presentation"><a href="#askforride"
						aria-controls="profile" role="tab" data-toggle="tab">Ask For
							Ride</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="posts">

						<h2>
							Latest Offer (Ride) <a id="postrideForm"
								class="pull-right btn btn-mini btn-info"> post <span
								class="glyphicon glyphicon-plus-sign"></span></a>
						</h2>

						<div class="posts">
							<div class="post_item">
								<h3>
									<span class="pull-left">From : Fairfield :: To : Des
										Moines</span> <span class="pull-right btn btn-mini  btn-default">view
										map</span>
								</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Dolore suscipit rem facilis illum placeat sit molestias
									voluptates iste eos sapiente. Odio molestiae veritatis
									accusamus repellendus provident iure iusto ex eveniet?</p>

								<div class="socials">
									<a class="likebtn pull-left"></a>
									<textarea rows="1" cols="60" class="commentbox"
										placeholder="Write a comment"></textarea>
								</div>
							</div>

							<div class="post_item">
								<h3>
									<span class="pull-left">From : Fairfield :: To : Des
										Moines</span> <span class="pull-right btn btn-mini  btn-default">view
										map</span>
								</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Dolore suscipit rem facilis illum placeat sit molestias
									voluptates iste eos sapiente. Odio molestiae veritatis
									accusamus repellendus provident iure iusto ex eveniet?</p>

								<div class="socials">
									<a class="likebtn pull-left"></a>
									<textarea rows="1" cols="60" class="commentbox"
										placeholder="Write a comment"></textarea>
								</div>
							</div>


							<div class="post_item">
								<h3>
									<span class="pull-left">From : Fairfield :: To : Des
										Moines</span> <span class="pull-right btn btn-mini  btn-default">view
										map</span>
								</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Dolore suscipit rem facilis illum placeat sit molestias
									voluptates iste eos sapiente. Odio molestiae veritatis
									accusamus repellendus provident iure iusto ex eveniet?</p>

								<div class="socials">
									<a class="likebtn pull-left"></a>
									<textarea rows="1" cols="60" class="commentbox"
										placeholder="Write a comment"></textarea>
								</div>
							</div>


							<div class="post_item">
								<h3>
									<span class="pull-left">From : Fairfield :: To : Des
										Moines</span> <span class="pull-right btn btn-mini  btn-default">view
										map</span>
								</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Dolore suscipit rem facilis illum placeat sit molestias
									voluptates iste eos sapiente. Odio molestiae veritatis
									accusamus repellendus provident iure iusto ex eveniet?</p>

								<div class="socials">
									<a class="likebtn pull-left"></a>
									<textarea rows="1" cols="60" class="commentbox"
										placeholder="Write a comment"></textarea>
								</div>
							</div>


							<div class="post_item">
								<h3>
									<span class="pull-left">From : Fairfield :: To : Des
										Moines</span> <span class="pull-right btn btn-mini  btn-default">view
										map</span>
								</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Dolore suscipit rem facilis illum placeat sit molestias
									voluptates iste eos sapiente. Odio molestiae veritatis
									accusamus repellendus provident iure iusto ex eveniet?</p>

								<div class="socials">
									<a class="likebtn pull-left"></a>
									<textarea rows="1" cols="60" class="commentbox"
										placeholder="Write a comment"></textarea>
								</div>
							</div>



							<div class="post_item">
								<h3>
									<span class="pull-left">From : Fairfield :: To : Des
										Moines</span> <span class="pull-right btn btn-mini  btn-default">view
										map</span>
								</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Dolore suscipit rem facilis illum placeat sit molestias
									voluptates iste eos sapiente. Odio molestiae veritatis
									accusamus repellendus provident iure iusto ex eveniet?</p>

								<div class="socials">
									<a class="likebtn pull-left"></a>
									<textarea rows="1" cols="60" class="commentbox"
										placeholder="Write a comment"></textarea>
								</div>
							</div>


							<div class="post_item">
								<h3>
									<span class="pull-left">From : Fairfield :: To : Des
										Moines</span> <span class="pull-right btn btn-mini  btn-default">view
										map</span>
								</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Dolore suscipit rem facilis illum placeat sit molestias
									voluptates iste eos sapiente. Odio molestiae veritatis
									accusamus repellendus provident iure iusto ex eveniet?</p>

								<div class="socials">
									<a class="likebtn pull-left"></a>
									<textarea rows="1" cols="60" class="commentbox"
										placeholder="Write a comment"></textarea>
								</div>
							</div>


							<div class="post_item">
								<h3>
									<span class="pull-left">From : Fairfield :: To : Des
										Moines</span> <span class="pull-right btn btn-mini  btn-default">view
										map</span>
								</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Dolore suscipit rem facilis illum placeat sit molestias
									voluptates iste eos sapiente. Odio molestiae veritatis
									accusamus repellendus provident iure iusto ex eveniet?</p>

								<div class="socials">
									<a class="likebtn pull-left"></a>
									<textarea rows="1" cols="60" class="commentbox"
										placeholder="Write a comment"></textarea>
								</div>
							</div>


							<div class="post_item">
								<h3>
									<span class="pull-left">From : Fairfield :: To : Des
										Moines</span> <span class="pull-right btn btn-mini  btn-default">view
										map</span>
								</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Dolore suscipit rem facilis illum placeat sit molestias
									voluptates iste eos sapiente. Odio molestiae veritatis
									accusamus repellendus provident iure iusto ex eveniet?</p>

								<div class="socials">
									<a class="likebtn pull-left"></a>
									<textarea rows="1" cols="60" class="commentbox"
										placeholder="Write a comment"></textarea>
								</div>
							</div>


						</div>


					</div>
					<div role="tabpanel" class="tab-pane" id="askforride">						
						
						<h2>
							Ride Needed <a id="askrideForm"
								class="pull-right btn btn-mini btn-info"> ask <span
								class="glyphicon glyphicon-question-sign"></span></a>
						</h2>

						<div class="posts">
							<div class="post_item">
								<h3>
									<span class="pull-left">From : Mt Pleasent :: To : Iowa City</span> 
									<span class="pull-right ondate"> on <strong>12th September, 2016</span>
								</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Dolore suscipit rem facilis illum placeat sit molestias
									voluptates iste eos sapiente. Odio molestiae veritatis
									accusamus repellendus provident iure iusto ex eveniet?</p>

								<div class="socials">
									<a class="likebtn pull-left"></a>
									<textarea rows="1" cols="60" class="commentbox"
										placeholder="Write a comment"></textarea>
								</div>
							</div>
							
							<div class="post_item">
								<h3>
									<span class="pull-left">From : Mt Pleasent :: To : Iowa City</span> 
									<span class="pull-right ondate"> on <strong>12th September, 2016</span>
								</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Dolore suscipit rem facilis illum placeat sit molestias
									voluptates iste eos sapiente. Odio molestiae veritatis
									accusamus repellendus provident iure iusto ex eveniet?</p>

								<div class="socials">
									<a class="likebtn pull-left"></a>
									<textarea rows="1" cols="60" class="commentbox"
										placeholder="Write a comment"></textarea>
								</div>
							</div>
							
							<div class="post_item">
								<h3>
									<span class="pull-left">From : Mt Pleasent :: To : Iowa City</span> 
									<span class="pull-right ondate"> on <strong>12th September, 2016</span>
								</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Dolore suscipit rem facilis illum placeat sit molestias
									voluptates iste eos sapiente. Odio molestiae veritatis
									accusamus repellendus provident iure iusto ex eveniet?</p>

								<div class="socials">
									<a class="likebtn pull-left"></a>
									<textarea rows="1" cols="60" class="commentbox"
										placeholder="Write a comment"></textarea>
								</div>
							</div>
							
							
							<div class="post_item">
								<h3>
									<span class="pull-left">From : Mt Pleasent :: To : Iowa City</span> 
									<span class="pull-right ondate"> on <strong>12th September, 2016</span>
								</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Dolore suscipit rem facilis illum placeat sit molestias
									voluptates iste eos sapiente. Odio molestiae veritatis
									accusamus repellendus provident iure iusto ex eveniet?</p>

								<div class="socials">
									<a class="likebtn pull-left"></a>
									<textarea rows="1" cols="60" class="commentbox"
										placeholder="Write a comment"></textarea>
								</div>
							</div>
							
							
							<div class="post_item">
								<h3>
									<span class="pull-left">From : Mt Pleasent :: To : Iowa City</span> 
									<span class="pull-right ondate"> on <strong>12th September, 2016</span>
								</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Dolore suscipit rem facilis illum placeat sit molestias
									voluptates iste eos sapiente. Odio molestiae veritatis
									accusamus repellendus provident iure iusto ex eveniet?</p>

								<div class="socials">
									<a class="likebtn pull-left"></a>
									<textarea rows="1" cols="60" class="commentbox"
										placeholder="Write a comment"></textarea>
								</div>
							</div>
							
							
							<div class="post_item">
								<h3>
									<span class="pull-left">From : Mt Pleasent :: To : Iowa City</span> 
									<span class="pull-right ondate"> on <strong>12th September, 2016</span>
								</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Dolore suscipit rem facilis illum placeat sit molestias
									voluptates iste eos sapiente. Odio molestiae veritatis
									accusamus repellendus provident iure iusto ex eveniet?</p>

								<div class="socials">
									<a class="likebtn pull-left"></a>
									<textarea rows="1" cols="60" class="commentbox"
										placeholder="Write a comment"></textarea>
								</div>
							</div>
							
							<div class="post_item">
								<h3>
									<span class="pull-left">From : Mt Pleasent :: To : Iowa City</span> 
									<span class="pull-right ondate"> on <strong>12th September, 2016</span>
								</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Dolore suscipit rem facilis illum placeat sit molestias
									voluptates iste eos sapiente. Odio molestiae veritatis
									accusamus repellendus provident iure iusto ex eveniet?</p>

								<div class="socials">
									<a class="likebtn pull-left"></a>
									<textarea rows="1" cols="60" class="commentbox"
										placeholder="Write a comment"></textarea>
								</div>
							</div>
							
							
							<div class="post_item">
								<h3>
									<span class="pull-left">From : Mt Pleasent :: To : Iowa City</span> 
									<span class="pull-right ondate"> on <strong>12th September, 2016</span>
								</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Dolore suscipit rem facilis illum placeat sit molestias
									voluptates iste eos sapiente. Odio molestiae veritatis
									accusamus repellendus provident iure iusto ex eveniet?</p>

								<div class="socials">
									<a class="likebtn pull-left"></a>
									<textarea rows="1" cols="60" class="commentbox"
										placeholder="Write a comment"></textarea>
								</div>
							</div>
							
							<div class="post_item">
								<h3>
									<span class="pull-left">From : Mt Pleasent :: To : Iowa City</span> 
									<span class="pull-right ondate"> on <strong>12th September, 2016</span>
								</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Dolore suscipit rem facilis illum placeat sit molestias
									voluptates iste eos sapiente. Odio molestiae veritatis
									accusamus repellendus provident iure iusto ex eveniet?</p>

								<div class="socials">
									<a class="likebtn pull-left"></a>
									<textarea rows="1" cols="60" class="commentbox"
										placeholder="Write a comment"></textarea>
								</div>
							</div>
							
							
							<div class="post_item">
								<h3>
									<span class="pull-left">From : Mt Pleasent :: To : Iowa City</span> 
									<span class="pull-right ondate"> on <strong>12th September, 2016</span>
								</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Dolore suscipit rem facilis illum placeat sit molestias
									voluptates iste eos sapiente. Odio molestiae veritatis
									accusamus repellendus provident iure iusto ex eveniet?</p>

								<div class="socials">
									<a class="likebtn pull-left"></a>
									<textarea rows="1" cols="60" class="commentbox"
										placeholder="Write a comment"></textarea>
								</div>
							</div>
							
							
						
					</div>
				</div>

			</div>

		</div>

		<footer class="footer">
			<p>&copy; 2016 WAP2016AugGroup7, Inc.</p>
		</footer>

	</div>
	<!-- /container -->




	<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Actions</h4>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer hide">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript" src="js/rides.js"></script>
	<script type="text/javascript" src="js/script1.js"></script>

	<script>
		//load jQuery
		$(document).ready(function() {

			//testing module pattern
			Rides.auth();

		});
	</script>
</body>
</html>