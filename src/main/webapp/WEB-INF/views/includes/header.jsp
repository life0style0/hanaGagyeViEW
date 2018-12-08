<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="/salmon/resources/sjh/css/main-sjh.css">
<header class="bgcolor-sjh">
  <div class="container-fluid custom-container">
    <div class="row no_row row-header">
      <div class="brand-be">
        <a href="/salmon">
          <img class="logo-c active be_logo" src="/salmon/resources/template/img/logo.png" alt="logo" style="width:200px;height:48px">
          <img class="logo-c be_logo" src="/salmon/resources/template/img/logo-green.png" alt="logo2">
          <img class="logo-c be_logo" src="/salmon/resources/template/img/logo-orang.png" alt="logo3">
          <img class="logo-c be_logo" src="/salmon/resources/template/img/logo-red.png" alt="logo4">
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
          <li><a href="/salmon/main/mypage">MYPAGE</a></li>
          <li><a href="/salmon/accountbook/calendar">AccountBook</a></li>
          <li><a href="/salmon/group/list">소모임</a></li>
          <li><a href="/salmon/suggestion">Suggestion</a></li>
        </ul>
      </div>
      <div class="login-header-block">

        <div class="login_block">
          <a class="btn-login btn color-1 size-2 hover-2" href=""><i class="fa fa-user"></i>
            LOGOUT</a>
        </div>
      </div>
    </div>
  </div>
</header>