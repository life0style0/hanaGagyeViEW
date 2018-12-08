<%@ page language="java" contentType="text/html; charset=utf-8" %>
<!-- ========================= * 소모임 게시물 리스트 조회하기 * ================================= -->

<!DOCTYPE html>
<html>
	<head>
		<title>HANA 가계ViEW</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<link rel="shortcut icon" href="img/favicon.png">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="style/bootstrap.min.css">
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="style/icon.css">
		<link rel="stylesheet" href="style/loader.css">
		<link rel="stylesheet" href="style/idangerous.swiper.css">
		<link rel="stylesheet" href="style/stylesheet.css">
		<!--[if lt IE 10]>
			<link rel="stylesheet" type="text/css" href="style/ie-9.css" />
		<![endif]-->		
		<!--[if lt IE 9]>
		    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
	    
	</head>
	<body>

	<!-- THE LOADER -->

<div class="be-loader">
    	<div class="spinner">
			<img src="img/logo-loader.png"  alt="">
			<p class="circle">
			  <span class="ouro">
			    <span class="left"><span class="anim"></span></span>
			    <span class="right"><span class="anim"></span></span>
			  </span>
			</p>
		</div>
    </div>
  <!-- THE HEADER -->
  <!-- THE HEADER -->
  <%@ include file="/WEB-INF/views/includes/header.jsp"%>

  <!-- MAIN CONTENT -->
  	<!-- MAIN CONTENT -->
	<div id="content-block">
		<div class="container be-detail-container">
			<h2 class="content-title">Our Blog</h2>
			<div class="blog-wrapper blog-list blog-fullwith">

				<div class="row">
					<div class="col-xs-12 col-md-10 col-md-offset-1">
						<div class="blog-post be-large-post type-2">
							<div class="info-block clearfix">
								<div class="be-large-post-align">
									<span><i class="fa fa-thumbs-o-up"></i> 253</span>
									<span><i class="fa fa-eye"></i> 753</span>
									<span><i class="fa fa-comment-o"></i> 50</span>
									<span class="be-text-tags">
										<a href="blog-detail-2.html" class="be-post-tag">Interactiob design</a>, 
										<a href="blog-detail-2.html" class="be-post-tag">UI/UX</a>,  
										<a href="blog-detail-2.html" class="be-post-tag">Web Design</a>
									</span>										
								</div>
							</div>
							<div class="be-large-post-align blog-content">
								<div class="be-text-tags clearfix custom-a-b">
									<div class="post-date">
										<i class="fa fa-clock-o"></i> April 23, 2015
									</div>
									<div class="author-post">
										<img src="img/a1.png" alt="" class="ava-author">
										<span>by <a href="blog-detail-2.html">Hoang Nguyen</a></span>
									</div>
								</div>				
								<h3 class="be-post-title">
									Monkey in da Space
								</h3>
								<div class="post-text">
									<p>
										Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque nec felis efficitur, lobortis erat et, placerat elit. Proin at ligula lorem. In viverra neque auctor metus consectetur varius. Cras sollicitudin arcu eu tincidunt tristique. Donec accumsan hendrerit nunc sit amet interdum. Donec rhoncus a lacus quis imperdiet.Nam tempus vitae sem pellentesque aliquam.
									</p>
								</div>
							</div>
							<div class="embed-responsive embed-responsive-16by9">
								<iframe src="https://player.vimeo.com/video/63528500"></iframe>
							</div>
							<div class="blog-content be-large-post-align">
								<div class="post-text ">						
									<p>Phasellus feugiat pulvinar sagittis. Vivamus sit amet purus quis magna laoreet suscipit in sit amet nisl. Etiam tempus tortor in interdum consectetur. Etiam gravida tellus leo. Mauris pulvinar ut leo in varius. Mauris iaculis bibendum tempus. Proin eget dolor lobortis, facilisis nisi sit amet, varius quam. Nam eu facilisis lorem. In hac habitasse platea dictumst. Aenean enim massa, viverra in diam ac, gravida egestas risus.</p>

									<p>Morbi quis ante erat. Nulla sodales, diam at accumsan mattis, dolor eros accumsan nisi, non porttitor ipsum nunc sit amet dolor.Duis vehicula odio sed consectetur tincidunt. Vestibulum vitae elementum ipsum. Nam porttitor quam vitae ex sollicitudin, bibendum fermentum nulla aliquet. Proin gravida ac risus eu scelerisque. Cras placerat vehicula arcu sed luctus.</p>
									<img class="img-leftblog" src="img/blog_img_3.jpg" alt="">
									<p>Sed laoreet tincidunt purus, tempus viverra sapien fringilla sit amet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec in sem lectus. Sed ut augue suscipit, vehicula ante sit amet</p>

									<p>Sed laoreet tincidunt purus, tempus viverra sapien fringilla sit amet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec in sem lectus. Sed ut augue suscipit, vehicula ante sit amet</p>

									<p>Sed laoreet tincidunt purus, tempus viverra sapien fringilla sit amet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec in sem lectus. Sed ut augue suscipit, vehicula ante sit amet</p>

									<p>Quisque eget cursus nulla, sit amet sodales odio. Phasellus faucibus efficitur est a posuere. Donec tristique nisl eu ornare fringilla. Vivamus lacinia accumsan odio, in semper nunc.  Donec tristique nisl eu ornare fringilla. Vivamus lacinia accumsan odio, in semper nunc</p>

									<p>Aliquam et sem quis risus ornare ullamcorper eu non elit. In egestas porttitor hendrerit. Fusce lacinia iaculis nibh, quis consectetur neque volutpat nec.</p>

									<img class="img-fullblog" src="img/blog_img_4.jpg" alt="">

									<p>Duis vehicula odio sed consectetur tincidunt. Vestibulum vitae elementum ipsum. Nam porttitor quam vitae ex sollicitudin, bibendum fermentum nulla aliquet. Proin gravida ac risus eu scelerisque. Cras placerat vehicula arcu sed luctus. Vivamus ullamcorper convallis tortor in faucibus. tempus. Eget pharetra ex interdum.</p>	
								</div>
							</div>
							<div class="be-large-post-align">
								<div class="row">
									<div class="col-xs-12 col-sm-6">
										<div class="be-bottom">
											<h4 class="be-bottom-title">Tags</h4>
											<div class="tags_block clearfix">
												<ul>
													<li><a href="blog-detail-2.html">photoshop</a></li>
													<li><a href="blog-detail-2.html">national geographic</a></li>
													<li><a href="blog-detail-2.html">nature</a></li>
													<li><a href="blog-detail-2.html">responsive web design</a></li>
													<li><a href="blog-detail-2.html">animals</a></li>
												</ul>
											</div>									
										</div>
									</div>
									<div class="col-xs-12 col-sm-6">
										<div class="be-bottom right">
											<h4 class="be-bottom-title">Share</h4>
											<ul class="soc_buttons light">
												<li><a href=""><i class="fa fa-facebook"></i></a></li>
												<li><a href=""><i class="fa fa-twitter"></i></a></li>
												<li><a href=""><i class="fa fa-google-plus"></i></a></li>
												<li><a href=""><i class="fa fa-pinterest-p"></i></a></li>
												<li><a href=""><i class="fa fa-instagram"></i></a></li>
												<li><a href=""><i class="fa fa-linkedin"></i></a></li>
											</ul>
										</div>
									</div>
								</div>							
							</div>
						</div>

						<h3 class="letf-menu-article">Related Posts</h3>
						<div class="row">
							<div class="col-xs-12 col-sm-6">
								<div class="be-post style-2 nav-post">
									<div class="be-post-date">
										<a href="blog-detail-2.html">Previous post</a>
									</div>
									<a href="blog-detail-2.html" class="be-post-title">
										Polygonal bear. Its all about poly.</a>     	
									<a href="blog-detail-2.html" class="be-img-block">
										<img src="img/be_post_3.jpg" alt="omg">
									</a>
								</div>							
							</div>
							<div class="col-xs-12 col-sm-6">
								<div class="be-post style-2 nav-post nav-next">
									<div class="be-post-date">
										<a href="blog-detail-2.html">Next post</a>
									</div>
									<a href="blog-detail-2.html" class="be-post-title">
										Wonderfiull house. The fairy tail in pictures
									</a>     	
									<a href="blog-detail-2.html" class="be-img-block">
										<img src="img/be_post_5.jpg" alt="omg">
									</a>
								</div>							
							</div>														
						</div>
						<div class="be-comment-block">
							<h1 class="comments-title">Comments (3)</h1>
							<div class="be-comment">
								<div class="be-img-comment">	
									<a href="blog-detail-2.html">
										<img src="img/c1.png" alt="" class="be-ava-comment">
									</a>
								</div>
								<div class="be-comment-content">
									
										<span class="be-comment-name">
											<a href="blog-detail-2.html">Ravi Sah</a>
											</span>
										<span class="be-comment-time">
											<i class="fa fa-clock-o"></i>
											May 27, 2015 at 3:14am
										</span>

									<p class="be-comment-text">
										Pellentesque gravida tristique ultrices. 
										Sed blandit varius mauris, vel volutpat urna hendrerit id. 
										Curabitur rutrum dolor gravida turpis tristique efficitur.
									</p>
								</div>
							</div>
							<div class="be-comment">
								<div class="be-img-comment">	
									<a href="blog-detail-2.html">
										<img src="img/c4.png" alt="" class="be-ava-comment">
									</a>
								</div>
								<div class="be-comment-content">
									<span class="be-comment-name">
										<a href="blog-detail-2.html">Phoenix, the Creative Studio</a>
									</span>
									<span class="be-comment-time">
										<i class="fa fa-clock-o"></i>
										May 27, 2015 at 3:14am
									</span>
									<p class="be-comment-text">
										Nunc ornare sed dolor sed mattis. In scelerisque dui a arcu mattis, at maximus eros commodo. Cras magna nunc, cursus lobortis luctus at, sollicitudin vel neque. Duis eleifend lorem non ant. Proin ut ornare lectus, vel eleifend est. Fusce hendrerit dui in turpis tristique blandit.
									</p>
								</div>
							</div>
							<div class="be-comment">
								<div class="be-img-comment">	
									<a href="blog-detail-2.html">
										<img src="img/c5.png" alt="" class="be-ava-comment">
									</a>
								</div>
								<div class="be-comment-content">
									<span class="be-comment-name">
										<a href="blog-detail-2.html">Cüneyt ŞEN</a>
									</span>
									<span class="be-comment-time">
										<i class="fa fa-clock-o"></i>
										May 27, 2015 at 3:14am
									</span>
									<p class="be-comment-text">
										Cras magna nunc, cursus lobortis luctus at, sollicitudin vel neque. Duis eleifend lorem non ant
									</p>
								</div>
							</div>
							<form class="form-block">
								<div class="row">
									<div class="col-xs-12 col-sm-6">
										<div class="form-group fl_icon">
											<div class="icon"><i class="fa fa-user"></i></div>
											<input class="form-input" type="text" placeholder="Your name">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6 fl_icon">
										<div class="form-group fl_icon">
											<div class="icon"><i class="fa fa-envelope-o"></i></div>
											<input class="form-input" type="text" placeholder="Your email">
										</div>
									</div>
									<div class="col-xs-12">									
										<div class="form-group">
											<textarea class="form-input" required="" placeholder="Your text"></textarea>
										</div>
									</div>
									<a class="btn color-1 size-2 hover-1 pull-right">submit</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- THE FOOTER -->
	<footer>
		<div class="footer_slider">
			<div class="swiper-container" data-autoplay="0" data-loop="1" data-speed="500" data-center="0" data-slides-per-view="responsive" data-xs-slides="4" data-sm-slides="8" data-md-slides="14" data-lg-slides="19" data-add-slides="19">
	            <div class="swiper-wrapper">
	            	<div class="swiper-slide active" data-val="0">

						<a href="gallery.html">				<img class="img-responsive img-full" src="img/f1.jpg" alt="">
	            	 </a></div>
	            	<div class="swiper-slide" data-val="1">
						<a href="gallery.html">

	            		 	 <img class="img-responsive img-full" src="img/f2.jpg" alt="">
	            	 </a></div>
	            	<div class="swiper-slide" data-val="2">
						<a href="gallery.html">

	            		 	 <img class="img-responsive img-full" src="img/f3.jpg" alt="">
	            	 </a></div>
	            	<div class="swiper-slide" data-val="3">
						<a href="gallery.html">

	            		 	 <img class="img-responsive img-full" src="img/f4.jpg" alt="">
	            	 </a></div>
	            	<div class="swiper-slide" data-val="4">
						<a href="gallery.html">

	            		 	 <img class="img-responsive img-full" src="img/f5.jpg" alt="">
	            	 </a></div>
	            	<div class="swiper-slide" data-val="5">
						<a href="gallery.html">

	            		 	 <img class="img-responsive img-full" src="img/f6.jpg" alt="">
	            	 </a></div>
	            	<div class="swiper-slide" data-val="6">
						<a href="gallery.html">

	            		 	 <img class="img-responsive img-full" src="img/f7.jpg" alt="">
	            	 </a></div>
	            	<div class="swiper-slide" data-val="7">
						<a href="gallery.html">

	            		 	 <img class="img-responsive img-full" src="img/f8.jpg" alt="">
	            	 </a></div>
	            	<div class="swiper-slide" data-val="8">
						<a href="gallery.html">

	            		 	 <img class="img-responsive img-full" src="img/f9.jpg" alt="">
	            	 </a></div>
	            	<div class="swiper-slide" data-val="9">
						<a href="gallery.html">

	            		 	 <img class="img-responsive img-full" src="img/f10.jpg" alt="">
	            	 </a></div>
	            	<div class="swiper-slide" data-val="10">
						<a href="gallery.html">

	            		 	 <img class="img-responsive img-full" src="img/f11.jpg" alt="">
	            	 </a></div>
	            	<div class="swiper-slide" data-val="11">
						<a href="gallery.html">

	            		 	 <img class="img-responsive img-full" src="img/f12.jpg" alt="">
	            	 </a></div>
	            	<div class="swiper-slide" data-val="12">
						<a href="gallery.html">

	            		 	 <img class="img-responsive img-full" src="img/f13.jpg" alt="">
	            	 </a></div>
	            	<div class="swiper-slide" data-val="13">
						<a href="gallery.html">

	            		 	 <img class="img-responsive img-full" src="img/f14.jpg" alt="">
	            	 </a></div>
	            	<div class="swiper-slide" data-val="14">
						<a href="gallery.html">

	            		 	 <img class="img-responsive img-full" src="img/f15.jpg" alt="">
	            	 </a></div>
	            	<div class="swiper-slide" data-val="15">
						<a href="gallery.html">

	            		 	 <img class="img-responsive img-full" src="img/f16.jpg" alt="">
	            	 </a></div>
	            	<div class="swiper-slide" data-val="16">
						<a href="gallery.html">

	            		 	 <img class="img-responsive img-full" src="img/f17.jpg" alt="">
	            	 </a></div>
	            	<div class="swiper-slide" data-val="17">
						<a href="gallery.html">

	            		 	 <img class="img-responsive img-full" src="img/f18.jpg" alt="">
	            	 </a></div>
	            	<div class="swiper-slide" data-val="18">
						<a href="gallery.html">

	            		 	 <img class="img-responsive img-full" src="img/f19.jpg" alt="">
	            	 </a></div>
	            	<div class="swiper-slide" data-val="19">
						<a href="gallery.html">

	            		 	 <img class="img-responsive img-full" src="img/f1.jpg" alt="">
	            	 </a></div>
	            	<div class="swiper-slide" data-val="20">
						<a href="gallery.html">

	            		 	 <img class="img-responsive img-full" src="img/f2.jpg" alt="">
	            	 </a></div>
	            	<div class="swiper-slide" data-val="21">
						<a href="gallery.html">

	            		 	 <img class="img-responsive img-full" src="img/f3.jpg" alt="">
	            	 </a></div>
	            	<div class="swiper-slide" data-val="22">
						<a href="gallery.html">

	            		 	 <img class="img-responsive img-full" src="img/f4.jpg" alt="">
	            	 </a></div>
	            	<div class="swiper-slide" data-val="23">
						<a href="gallery.html">

	            		 	 <img class="img-responsive img-full" src="img/f5.jpg" alt="">
	            	 </a></div>
	            </div>
	            <div class="pagination hidden"></div>
	        </div>
        </div>	
		<div class="footer-main">
			<div class="container-fluid custom-container">
				<div class="row">	
					<div class="col-md-3 col-xl-4">
						<div class="footer-block">
							<h1 class="footer-title">About Us</h1>
							<p>Vestibulum tincidunt, augue fermentum accumsan viverra, eros dui rutrum libero, nec imperdiet felis sem in augue luctus <a href="blog-detail-2.html">diam a porta</a> iaculis. Vivamus sit amet fermentum nisl. Duis id <a href="blog-detail-2.html">massa id purus</a> tristique varius a sit amet est. Fusce dolor libero, efficitur et lobortis at, faucibus nec nunc.</p>
							<ul class="soc_buttons">
								<li><a href=""><i class="fa fa-facebook"></i></a></li>
								<li><a href=""><i class="fa fa-twitter"></i></a></li>
								<li><a href=""><i class="fa fa-google-plus"></i></a></li>
								<li><a href=""><i class="fa fa-pinterest-p"></i></a></li>
								<li><a href=""><i class="fa fa-instagram"></i></a></li>
								<li><a href=""><i class="fa fa-linkedin"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 col-xl-2">
						<div class="footer-block">
							<h1 class="footer-title">Some Links</h1>
							<div class="row footer-list-footer">
								<div class="col-md-6">
								<ul class="link-list">
									<li><a href="about-us.html">About Us</a></li>
									<li><a href="contact-us.html">Help</a></li>
									<li><a href="contact-us.html">Contacts</a></li>
									<li><a href="activity.html">Job</a></li>
									<li><a href="activity.html">Projets</a></li>
								</ul></div>
								<div class="col-md-6">
								<ul class="link-list">
									<li><a href="activity.html">New Works</a></li>
									<li><a href="author.html">Popular Authors</a></li>
									<li><a href="author.html">New Authors</a></li>
									<li><a href="people.html">Career</a></li>
									<li><a href="faq">FAQ</a></li>
								</ul>
								</div>
							</div>
						</div>
					</div>				
					<div class="col-md-3 galerry">
						<div class="footer-block">					
							<h1 class="footer-title">Recent Works</h1>
							<a href="blog-detail-2.html"><img src="img/g1.jpg" alt=""></a>
							<a href="blog-detail-2.html"><img src="img/g2.jpg" alt=""></a>
							<a href="blog-detail-2.html"><img src="img/g3.jpg" alt=""></a>
							<a href="blog-detail-2.html"><img src="img/g4.jpg" alt=""></a>
							<a href="blog-detail-2.html"><img src="img/g5.jpg" alt=""></a>
							<a href="blog-detail-2.html"><img src="img/g6.jpg" alt=""></a>
							<a href="blog-detail-2.html"><img src="img/g7.jpg" alt=""></a>
							<a href="blog-detail-2.html"><img src="img/g8.jpg" alt=""></a>
							<a href="blog-detail-2.html"><img src="img/g9.jpg" alt=""></a>
							<a href="blog-detail-2.html"><img src="img/g10.jpg" alt=""></a>
							<a href="blog-detail-2.html"><img src="img/g11.jpg" alt=""></a>
							<a href="blog-detail-2.html"><img src="img/g12.jpg" alt=""></a>
						</div>
					</div>
					<div class="col-md-3">
						<div class="footer-block">
							<h1 class="footer-title">Subscribe On Our News</h1>
							<form action="./" class="subscribe-form">
								<input type="text" placeholder="Yout Name" required>
								<div class="submit-block">
									<i class="fa fa-envelope-o"></i>
									<input type="submit" value="">
								</div>
							</form>
							<div class="soc-activity">
								<div class="soc_ico_triangle">
									<i class="fa fa-twitter"></i>
								</div>
								<div class="message-soc">
									<div class="date">16h ago</div>
									<a href="blog-detail-2.html" class="account">@faq</a> vestibulum accumsan est <a href="blog-detail-2.html" class="heshtag">blog-detail-2.htmlmalesuada</a> sem auctor, eu aliquet nisi ornare leo sit amet varius egestas.
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-bottom">
			<div class="container-fluid custom-container">
				<div class="col-md-12 footer-end clearfix">
					<div class="left">
						<span class="copy">© 2015. All rights reserved. <span class="white"><a href="blog-detail-2.html"> NRGNetwork</a></span></span>
						<span class="created">Created with LOVE by <span class="white"><a href="blog-detail-2.html"> NRGThemes</a></span></span>
					</div>
					<div class="right">
						<a class="btn color-7 size-2 hover-9">About Us</a>
						<a class="btn color-7 size-2 hover-9">Help</a>
						<a class="btn color-7 size-2 hover-9">Privacy Policy</a>
					</div>
				</div>			
			</div>
		</div>		
	</footer>

	<div class="be-fixed-filter"></div>
	
	<div class="large-popup login">
		<div class="large-popup-fixed"></div>
		<div class="container large-popup-container">
			<div class="row">
				<div class="col-md-8 col-md-push-2 col-lg-6 col-lg-push-3  large-popup-content">
					<div class="row">
						<div class="col-md-12">
							<i class="fa fa-times close-button"></i>
							<h5 class="large-popup-title">Log in</h5>
						</div>
						<form action="./" class="popup-input-search">
						<div class="col-md-6">
							<input class="input-signtype" type="email" required="" placeholder="Your email">
						</div>
						<div class="col-md-6">
							<input class="input-signtype" type="password" required="" placeholder="Password">
						</div>
						<div class="col-xs-6">
							<div class="be-checkbox">
							<label class="check-box">
								    <input class="checkbox-input" type="checkbox" value="" /> <span class="check-box-sign"></span>
								</label>
								<span class="large-popup-text">
									Stay signed in
								</span>
							</div>
							
							<a href="blog-detail-2.html" class="link-large-popup">Forgot password?</a>
						</div>
						<div class="col-xs-6 for-signin">
							<input type="submit" class="be-popup-sign-button" value="SIGN IN">
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="large-popup register">
		<div class="large-popup-fixed"></div>
		<div class="container large-popup-container">
			<div class="row">
				<div class="col-md-10 col-md-push-1 col-lg-8 col-lg-push-2 large-popup-content">
					<div class="row">
						<div class="col-md-12">
							<i class="fa fa-times close-button"></i>
							<h5 class="large-popup-title">Register</h5>
						</div>
						<form action="./" class="popup-input-search">
						<div class="col-md-6">
							<input class="input-signtype" type="text" required="" placeholder="First Name">
						</div>
						<div class="col-md-6">
							<input class="input-signtype" type="text" required="" placeholder="Last Name">
						</div>
						<div class="col-md-6">
							<div class="be-custom-select-block">
							<select class="be-custom-select">
								<option value="" disabled selected>
									Country
								</option>
								<option value="">USA</option>
								<option value="">Canada</option>
								<option value="">England</option>
							</select>
							</div>
						</div>
						<div class="col-md-6">
							<input class="input-signtype" type="text" required="" placeholder="Email">
						</div>
						<div class="col-md-6">
							<input class="input-signtype" type="text" required="" placeholder="Password">
						</div>
						<div class="col-md-6">
							<input class="input-signtype" type="text" required="" placeholder="Repeat Password">
						</div>
						<div class="col-md-12 be-date-block">
							<span class="large-popup-text">
								Date of birth
							</span>
							<div class="be-custom-select-block mounth">
								<select class="be-custom-select">
									<option value="" disabled selected>
										Mounth
									</option>
									<option value="">January</option>	
									<option value="">February</option>	
									<option value="">March</option>	
									<option value="">April</option>	
									<option value="">May</option>	
									<option value="">June</option>	
									<option value="">July</option>	
									<option value="">August</option>	
									<option value="">September</option>	
									<option value="">October</option>	
									<option value="">November</option>	
									<option value="">December</option>
								</select>
							</div>
							<div class="be-custom-select-block">
								<select class="be-custom-select">
									<option value="" disabled selected>
										Day
									</option>
									<option value="">1</option>
									<option value="">2</option>
									<option value="">3</option>
									<option value="">4</option>
									<option value="">5</option>
									<option value="">6</option>
									<option value="">7</option>
									<option value="">8</option>
									<option value="">9</option>
									<option value="">10</option>
									<option value="">11</option>
									<option value="">12</option>
									<option value="">13</option>
									<option value="">14</option>
									<option value="">15</option>
									<option value="">16</option>
									<option value="">17</option>
									<option value="">18</option>
									<option value="">19</option>
									<option value="">20</option>
									<option value="">21</option>
									<option value="">22</option>
									<option value="">23</option>
									<option value="">24</option>
									<option value="">25</option>
									<option value="">26</option>
									<option value="">27</option>
									<option value="">28</option>
									<option value="">29</option>
									<option value="">30</option>
								</select>
							</div>
							<div class="be-custom-select-block">
								<select class="be-custom-select">
									<option value="" disabled selected>
										Year
									</option>
									<option value="">1996</option>
									<option value="">1997</option>
									<option value="">1998</option>
								</select>
							</div>
						</div>
						<div class="col-md-6">
							<div class="be-checkbox">
								<label class="check-box">
								    <input class="checkbox-input" type="checkbox" required="" value=""/> <span class="check-box-sign"></span>
								</label>
								<span class="large-popup-text">
									I have read and agree to the <a class="be-popup-terms" href="blog-detail-2.html">Terms of Use</a> and <a class="be-popup-terms" href="blog-detail-2.html">Privacy Policy</a>.
								</span>
							</div>
							<div class="be-checkbox">
								<label class="check-box">
								    <input class="checkbox-input" type="checkbox" value=""/> <span class="check-box-sign"></span>
								</label>
								<span class="large-popup-text">
									Send me notifications
								</span>
							</div>
						</div>
						<div class="col-md-6 for-signin">
							<input type="submit" class="be-popup-sign-button" value="SIGN IN">
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="theme-config">
	    <div class="main-color">
	        <div class="title">Main Color:</div>
	        <div class="colours-wrapper">
	            <div class="entry color1 m-color active" data-colour="style/stylesheet.css"></div>   
	            <div class="entry color3 m-color"  data-colour="style/style-green.css"></div>
	            <div class="entry color6 m-color"  data-colour="style/style-orange.css"></div>
	            <div class="entry color8 m-color"  data-colour="style/style-red.css"></div>  
	            <div class="title">Second Color:</div>  
	            <div class="entry s-color  active color10"  data-colour="style/stylesheet.css"></div>
	            <div class="entry s-color color11"  data-colour="style/style-oranges.css"></div> 
	            <div class="entry s-color color12"  data-colour="style/style-greens.css"></div>
	            <div class="entry s-color color13"  data-colour="style/style-reds.css"></div>
	                       
	        </div>
	    </div>
	   <div class="open"><img src="img/icon-134.png" alt=""></div>
	</div>

	<!-- SCRIPTS	 -->
	<script src="script/jquery-2.1.4.min.js"></script>
	<script src="script/bootstrap.min.js"></script>
	<script src="script/idangerous.swiper.min.js"></script>
	<script src="script/isotope.pkgd.min.js"></script>
	<script src="script/jquery.viewportchecker.min.js"></script>		
	<script src="script/global.js"></script>	
	</body>
</html>