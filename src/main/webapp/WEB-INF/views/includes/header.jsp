<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="/salmon/resources/sjh/css/main-sjh.css">
<header class="bgcolor-sjh">
  <div class="container-fluid custom-container">
    <div class="row no_row row-header">
      <div class="brand-be">
        <a href="/salmon">
          <img class="logo-c active be_logo" src="/salmon/resources/template/img/logo.png" alt="logo" style="width:200px;height:48px">
        </a>
      </div>
      <div class="header-menu-block">
        <button class="cmn-toggle-switch cmn-toggle-switch__htx"><span></span></button>
        <ul class="header-menu" id="one">
          <li>
          <a href="/salmon/sns/feeds?userid=<sec:authentication property="principal.username"/>">
          	<span id="loginUserId"><sec:authentication property="principal.username" /></span>님
          </a>
          </li>
          <li><a href="/salmon/sns/showall">함께ViEW</a></li>
          <li><a href="/salmon/main/mypage">내정보</a></li>
          <li><a href="/salmon/accountbook/calendar">가계ViEW</a></li>
          <li><a href="/salmon/group/list">소모임</a></li>
          <li><a href="/salmon/suggestion">역제안</a></li>
          <li style="padding: unset;">
	          <form action="/salmon/sns/search" class="input-search" method="get" style="margin-bottom:unset">
		        <input type="text" required="required" name="search-value" placeholder="Enter keyword">
		        <i class="fa fa-search"></i>
	          	<input type="submit" value="">
	          </form>
          </li>
        </ul>
        
      </div>
      <div class="login-header-block">

        <div class="login_block">
          <a class="btn-login btn color-white-sjh size-2 hover-2" href=""><i class="fa fa-user"></i>
            LOGOUT</a>
        </div>
      </div>
    </div>
  </div>
</header>