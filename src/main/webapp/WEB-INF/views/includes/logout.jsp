<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags" %>
<div class="large-popup login">
    <div class="large-popup-fixed"></div>
    <div class="container large-popup-container">
      <div class="row">
        <div class="col-md-8 col-md-push-2 col-lg-6 col-lg-push-3  large-popup-content">
          <div class="row">
            <div class="col-md-12">
              <i class="fa fa-times close-button"></i>
              <h5 class="large-popup-title">로그아웃</h5>
            </div>

            <form method="post" action="/salmon/customLogout" class="popup-input-search">
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
              <button class="be-popup-sign-button">로그아웃</button>
            </form>

          </div>
        </div>
      </div>
    </div>
  </div>