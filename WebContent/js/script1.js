/**
 * 
 */
$(document).ready(function() {
	
	var APPID = "521a1b7b3f1b8d18fa44380c06bcc261";
	var mode  = "json";
	var myModal = $("#myModal");
	var output  = $("#output");
	 
	
	// bring form to the front
	$(document).delegate("#registerForm", "click", function() {
		$.ajax("/project/register", {}).success(function(data) {
			$(".modal-title").text("Register Page");
			$(".modal-body").html(data);
		});
	});

	$(document).delegate("#loginForm", "click", function() {
		myModal.modal("show");
		$.ajax("/project/login", {}).success(function(data) {
			$(".modal-title").text("Login Page");
			$(".modal-body").html(data);
		});
	});

	

	function responseDisplay(res,msg){
		if(res != null){
			var response = JSON.parse(res);
			if(response.email != null){
				myModal.modal("hide");
				$(".alert-success").fadeIn("slow").html(msg);
				setTimeout(function(){
					$(".alert-success").fadeOut("slow");
				},5000);
				$.ajax("/project/content", {}).done(function(out){output.html(out);});
			}else{
				$(".alert-danger").removeClass("hide").fadeIn("slow").html(response.message);
				setTimeout(function(){
					$(".alert-danger").addClass("hide").fadeOut("slow");
				},5000);
			}
		}
	}
	
	$(document).delegate("#loginSubmit", "click", function() {
 		var data = Rides.getSerializedObject("#login");
 		if(data.email == "" || data.password == ""){
 			$(".alert-danger").removeClass("hide").fadeIn("slow").html("Please provide email and password");
			setTimeout(function(){
				$(".alert-danger").addClass("hide").fadeOut("slow");
			},5000);
 		}else{ 
		$.ajax("/project/login", {
			"type" : "post",
			"data" : data
		}).success(function(res){
			responseDisplay(res,'Successfully logged in.');
			var response = JSON.parse(res);
			if(response.email != null){
				$(".navbar-nav").removeClass("hide");
			}
		});
 		}
	});
	
	
	$(document).delegate("#registerSubmit", "click", function() {
 		var data = Rides.getSerializedObject("#register");
		$.ajax("/project/register", {
			"type" : "post",
			"data" : data
		}).done(function(res){
			
			responseDisplay(res,'Successfully registered and logged in.');
			
		});
	});
	
	
	 
	
	
	$(document).delegate("#postrideForm", "click", function() { 
		myModal.modal("show");
		$.ajax("/project/postride", {}).success(function(res) {
 			$(".modal-title").text("Post Ride");
			$(".modal-body").html(res);
		});
	});
	
	$(document).delegate("#askrideForm", "click", function() {  
		myModal.modal("show");
		$.ajax("/project/askride", {}).success(function(data) {
			$(".modal-title").text("Ask Ride");
			$(".modal-body").html(data);
		});
	});
	
	 $("#logoutBtn").click(function(){
		 Rides.cleanCookies();
		 $.ajax("/project/auth",{"type":"GET",data:{"action":"logout"}}).success(function(res){
			 console.log(res);
		 });
		 location.href = location.href;
	 });
	
 	///openweathermap 5days forecast
 	 $.ajax("http://api.openweathermap.org/data/2.5/forecast",{
		 "type":"GET","data":{"q":"fairfield,ia","cnt":"5","mode":mode,"APPID":APPID}})
		 .success(function(res){
 			 var forecast5days = $("#forecast5days");
			 $.each(res.list,function(index,obj){
				 	forecast5days.append("<div class=\"pull-left\">"+obj.dt_txt+
				 			"<p>Weather:"+obj.weather[0].description+"</p>"+
				 			"<p>Humidity:"+obj.main.humidity+"</p>"
				 			+"</div>");
				 	
 				 	
			 	 
			 });
			 
		 })
		 .error(function(a,b,c){
			console.log(a,b,c); 
		 });
 	 
 	 
 	///openweathermap 3hours forecast
 	 $.ajax("http://api.openweathermap.org/data/2.5/forecast",{
		 "type":"GET","data":{"q":"fairfield,ia","mode":mode,"APPID":APPID}})
		 .success(function(res){
 			 var forecast3hours = $("#forecast3hours");
			 $.each(res.list,function(index,obj){
				 forecast3hours.append("<div class=\"pull-left\">"+obj.dt_txt+
				 			"<p>Weather:"+obj.weather[0].description+"</p>"+
				 			"<p>Humidity:"+obj.main.humidity+"</p>"
				 			+"</div>");
			 });			 
		 })
		 .error(function(a,b,c){
			console.log(a,b,c); 
		 });
	

 	$(document).delegate("#postSubmit", "click", function() {  
  		var data = Rides.getSerializedObject("#offer");
		$.ajax("/project/postride", {
			"type" : "post",
			"data" : data
		}).success(function(res){
 			if(res != null){
 				var data = JSON.parse(res);
 				$(".latestdata")
 	 			.attr("data-lo",data.postid);
 				myModal.modal("hide");
				$(".alert-success").fadeIn("slow").html("Successfully posted offer.");
				setTimeout(function(){
					$(".alert-success").fadeOut("slow");
				},5000);
				$.ajax("/project/content", {}).success(function(out){output.html(out);});
 			}
		});
 	 });
 	
 	
 	$(document).delegate("#requestSubmit", "click", function() {  
  		var data = Rides.getSerializedObject("#request");
		$.ajax("/project/askride", {
			"type" : "post",
			"data" : data
		}).success(function(res){
 			if(res != null){
 				var data = JSON.parse(res);
 				$(".latestdata")
 	 			.attr("data-la",data.postid);
 				myModal.modal("hide");
				$(".alert-success").fadeIn("slow").html("Successfully posted request.");
				setTimeout(function(){
					$(".alert-success").fadeOut("slow");
				},5000);
				$.ajax("/project/content", {}).success(function(out){output.html(out);
				});
 				 
			}
		});
 	 });
 	
 	
 	$(document).delegate(".commentbox", "keypress", function(e) {  
 		 if(e.which == 13) { //if pressed enter it will save; 			 
 			 var elem = $(this).parent().prev();
 			 var comment = $(this).val();$(this).val("").focus();
 			 var postid = $(this).parent().attr("data-post-id");
  			$.ajax("/project/comment", {
 				"type" : "post",
 				"data" : {"comment":comment,"postid":postid}
 			}).success(function(res){
 	 			if(res != null){
 	 				var data = JSON.parse(res);
  					$(".alert-success").fadeIn("slow").html("Successfully added comment.");
  					setTimeout(function(){
						$(".alert-success").fadeOut("slow");
					},5000);
  					elem.prepend('<div class="comments"><q><span>'+comment+'</span></q><span class="author"> by - '+ $.cookie('fullname')+'</span></div>');
  					$(".latestdata")
  		 			.attr("data-lc",data.lc);
 				}
 			});
 	         
 	    }
 	 });
 	
 	/**
 	 * To make like
 	 */
 	$(document).delegate(".likebtn", "click", function(e) {  
 			 var postid = $(this).parent().attr("data-post-id");
 			 var self = this;
 			 var elemCount = $(this).find(".likeCount");
 			$.ajax("/project/like", {
				"type" : "post",
				"data" : {"postid":postid}
			}).success(function(res){
	 			if(res != null){
	 				var data = JSON.parse(res);
 					$(".alert-success").fadeIn("slow").html("Successfully added like.");
 					setTimeout(function(){
						$(".alert-success").fadeOut("slow");
					},5000);
 					var nc = parseInt(elemCount.text())+1;
 		  			 $(self).replaceWith('<span class="like pull-left"> <span class="likeCount">'+nc+'</span></span>');
 		  			 $(self).prop('disabled', true);
 		  			$(".latestdata")
 		 			.attr("data-ll",data.ll);
 				}
			});
	         
	 });
 	 
 	//check if user logged in then make 1 sec call to server if they changed anyting
 	if($.cookie('email') !== undefined && $.cookie('email') != null){ 
 		//auto post notification
 		setInterval(checkoplc,2000);
 	}
 	function checkoplc(){
 		var lo = $(".latestdata").attr("data-lo"); //latest offer id
 		var la = $(".latestdata").attr("data-la"); //latest ask id
 		var lc = $(".latestdata").attr("data-lc"); //latest like id
 		var ll = $(".latestdata").attr("data-ll");; //latest comment id
 		var count = 0;
 		$.ajax("/project/notification",{"type":"post","data":{
 			"lo":lo, "la":la, "ll": ll, "lc": lc
 		}}).success(function(res){
 			var data = JSON.parse(res);
// 			console.log(data);
// 			console.log(lo,la,lc,ll);
 			if(lo > 0 && lo != data.lo){count++;}
 			if(la > 0 && la != data.la){count++;}
 			if(lc > 0 && lc != data.lc){count++;}
 			if(ll > 0 && ll != data.ll){count++;}
 			
 			if(count>0){ 
 				$(".stream-conainer").removeClass("hide").html("("+count+") new notification");
 				$(document).prop("title","("+count+") FairRides")
 			}
 			$(".latestdata")
 			.attr("data-lo",data.lo)
 			.attr("data-la",data.la)
 			.attr("data-lc",data.lc)
 			.attr("data-ll",data.ll);
 		})
 		 
 	}
 	
 	$(".stream-conainer").click(function(){
 		count=0;
 		$(this).addClass("hide");							//hide notf bar
 		$(document).prop("title","FairRides");	//change title to old one
 		$.ajax("/project/content", {}).success(function(out){output.html(out);});
 	});
 	var page=0;
 	$(window).scroll(function() {
 	    if($(window).scrollTop() == $(document).height() - $(window).height()) {
 	           page++;
 	           $(".progress-bar").ajaxStart(function(){
 	        	 $(this).removeClass("hide");  
 	           }).ajaxError(function(){
 	        	   $(this).addClass("hide");
 	           })
 	          $.ajax("/project/content", {"type":"GET","data":{
 	        	  "page":page
 	          }}).done(function(out){
 	        	  if(out.length>0){ 
 	        	  $.each(out,function(i,obj){
 	        		  var ot = '<div class="post_item" data-post-id="'+obj.postid+'" >'
 	        				   + '<h3><span class="pull-left">'+obj.post+'</span><span class="pull-right author">'
 	        				   + ' created - '+ obj.datecreated  
 	        				   + ' updated - '+ obj.dateupdated			
 	        				   + ' by - '+ obj.user.fullname +'</span></h3><div class="comments"></div>'
 	        				  
 	        				  ;
 	        		  $.each(obj.comments,function(j,cm){
 	        			 ot +=  '<div class="comments"><q><span>'+cm.comment+'</span></q><span class="author">by - '+cm.user.fullname+'</span>';
       				     ot +=  '</div>';
 	        		  });
 	        		 
 	        		    ot += '<div class="socials" data-post-id="'+obj.postid+'">';
						ot += '<a class="likebtn pull-left"><span class="likeCount">'+obj.likes.length+'</span></a>';
						ot += '<textarea rows="1" cols="60" class="commentbox" placeholder="Write a comment"></textarea></div>';
 	        		  
 	        		  ot +=  '</div>';
 	        		  output.append(ot);
 	        	  });
 	        	  }
 	        	  //output.append(out);
 	        	 
 	        });
 	          
 	    }
 	});
 	
 	 
 	 
});