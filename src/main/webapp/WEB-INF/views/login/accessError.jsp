<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<script src='//static.codepen.io/assets/editor/live/console_runner-1df7d3399bdc1f40995a35209755dcfd8c7547da127f6469fd81e5fba982f6af.js'></script>
<script src='//static.codepen.io/assets/editor/live/css_reload-5619dc0905a68b2e6298901de54f73cefe4e079f65a75406858d92924b4938bf.js'></script>
<meta charset='UTF-8'>
<meta name="robots" content="noindex">
<link rel="shortcut icon" type="image/x-icon" href="//static.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
<link rel="mask-icon" type="" href="//static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
<link rel="canonical" href="https://codepen.io/ltrademark/pen/Ywqgoq" />


<style class="cp-pen-styles">
body,
html {
  background: #298478;
  position: relative;
  margin: 0;
  width: 100%;
  height: 100%;
}
#mainC {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
  color: #fff;
  font-family: sans-serif;
  max-width: 95%;
  -webkit-user-select: none;
  -moz-user-select: none;
  -o-user-select: none;
  -ms-user-select: none;
      user-select: none;
}
#mainC .message {
  font-size: 13px;
  text-align: center;
}
#mainC .message h1 {
  margin: 0;
  padding: 0;
  font-size: 11em;
  -webkit-transform: skewY(-5deg);
          transform: skewY(-5deg);
  transition: 0.4s ease-in-out all;
}
#mainC .message h1:hover {
  text-shadow: 20px 20px 0 rgba(175, 211, 61, 0.1);
}
@media (max-width: 600px) {
  #mainC .message h1 {
    font-size: 50vw;
  }
}
#mainC .message h3 {
  color: #afd33d;
  font-size: 0.9em;
  font-weight: lighter;
  line-height: 1;
}
@media (max-width: 600px) {
  #mainC .message h3 {
    font-size: 5vw;
  }
}
#mainC .footer {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  width: 100%;
}
#mainC .footer a {
  position: relative;
  flex: 1;
  color: rgba(255, 255, 255, 0.6);
  text-decoration: none;
  border-radius: 3px;
  border: 1px solid rgba(255, 255, 255, 0.6);
  margin: 0 20px;
  text-align: center;
  padding: 10px 0;
  overflow: hidden;
  transition: all 0.2s ease-in-out;
  z-index: 3;
}
@media (max-width: 600px) {
  #mainC .footer a {
    flex: 5 100%;
    width: 100%;
  }
}
#mainC .footer a:hover {
  border: 1px solid #ffffff;
  color: #121212;
}
#mainC .footer a:hover span {
  width: 310px;
  height: 310px;
}
#mainC .footer a span {
  content: '';
  position: absolute;
  background: #afd33d;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
  width: 0;
  height: 0;
  border-radius: 50%;
  transition: all 0.5s ease;
  z-index: -1;
}
@media (max-width: 600px) {
  #mainC .footer a span {
    transition: all 0.2s ease-in;
  }
}
#mainC .footer a span:active {
  background: #c0dc67;
}
#mainC .footer .legal {
  text-align: center;
  flex: 3;
  color: rgba(204, 204, 204, 0.5);
}
@media (max-width: 600px) {
  #mainC .footer .legal {
    font-size: 4vw;
    flex: 5 100%;
    padding: 5px 10px;
  }
}
</style></head>
<body>

  <div id="mainC">
  <div class="message">
    <h1>접근할 수 없는 페이지</h1>
    <h3>권한이 제한되어 접근할 수 없는 페이지 입니다</h3>
  </div>
  <div class="footer">
    <a title="home" target="_blank" id="logoutform-submit-a">로그아웃 <span></span></a>
    <p class="legal">
    <c:out value="${msg}"/>
    <c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"/><br>
    </p>
    		<form method="post" id="logoutform" action="/salmon/customLogout" class="popup-input-search">
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            </form>
            
  </div>
</div>
<%-- 
    <c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"></c:out><br>
	<c:out value="${msg}"></c:out><br>
 --%>
 <script src="/salmon/resources/template/script/jquery-2.1.4.min.js"></script>
  <script src="/salmon/resources/template/script/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function(){ 
	 $('#logoutform-submit-a').on('click',function(){
		// alert('logout');
		 $('#logoutform').submit();
	 })
	 
	})
</script>
</body>

</html>