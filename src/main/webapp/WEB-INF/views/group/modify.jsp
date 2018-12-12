<%@ page language="java" contentType="text/html; charset=utf-8" %>
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
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
	<!--  로그아웃 팝업 -->
	<%@ include file="/WEB-INF/views/includes/logout.jsp"%>
	<!--  로그아웃 팝업 끝-->
	<div class="be-fixed-filter"></div>
	
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