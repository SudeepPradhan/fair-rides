<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div>

	<!-- Nav tabs -->
	<ul class="nav nav-tabs" role="tablist">
		<li role="presentation" class="active"><a href="#posts"
			aria-controls="posts" role="tab" data-toggle="tab">Posts Ride</a></li>
		<li role="presentation"><a href="#askforride"
			aria-controls="askforride" role="tab" data-toggle="tab">Ask For
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

				<c:forEach var="post" items="${posts}">
					<div class="post_item" data-post-id="${post.postid}" data-post-type="1">
						<h3>
							<span class="pull-left">${post.post}</span> <span
								class="pull-right author"> by - ${post.user.fullname} </span>
						</h3>

						<div class="comments"></div>
						<c:forEach var="comment" items="${post.comments}">
							<div class="comments">
								<q><span>${comment.comment}</span></q> <span class="author">
									by - ${comment.user.fullname}</span>
							</div>
						</c:forEach>
						<div class="socials" data-post-id="${post.postid}">
							<a class="likebtn pull-left"> <span class="likeCount">${post.likes.size()}</span></a>
							<textarea rows="1" cols="60" class="commentbox"
								placeholder="Write a comment"></textarea>
						</div>


					</div>
				</c:forEach>
			</div>


		</div>
		<div role="tabpanel" class="tab-pane" id="askforride">

			<h2>
				Ride Needed <a id="askrideForm"
					class="pull-right btn btn-mini btn-info"> ask <span
					class="glyphicon glyphicon-question-sign"></span></a>
			</h2>

			<div class="posts">


				<c:forEach var="ask" items="${asks}">
					<fmt:formatDate value="${ask.datecreated}" var="datecreated"
						type="date" pattern="MM/dd/yyyy hh:mm a" />

					<div class="ask_item" data-post-id="${ask.postid}" data-post-type="2">
						<h3>
							<span class="pull-left">${ask.post}</span> <span
								class="pull-right author"> by - ${ask.user.fullname} at -
								${datecreated} </span>
						</h3>
						<div class="comments"></div>
						<c:forEach var="comment" items="${ask.comments}">
							<div class="comments">
								<q><span>${comment.comment}</span></q> <span class="author">
									by - ${comment.user.fullname}</span>
							</div>
						</c:forEach>
						<div class="socials" data-post-id="${ask.postid}">
							<a class="likebtn pull-left"> <span class="likeCount">${ask.likes.size()}</span>
							</a>

							<textarea rows="1" cols="60" class="commentbox"
								placeholder="Write a comment"></textarea>
						</div>

					</div>
				</c:forEach>

			</div>
		</div>

	</div>

</div>