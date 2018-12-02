   <%-- <%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%> --%>
   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!-- 예약취소 모달 -->
        <div class="modal fade" id="resign-Modal" role="dialog">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="modal-title"> 회원 탈퇴 </h4>
              </div>
              <div class="modal-body">
                <p class="row">
                	<p> 닉네임 : <c:out value="${user.user_nickname}"/> </p>
					<p> 아이디 : <sec:authentication property="principal.username"/></p>
                  <span id="modal-resign-user-id"> </span> 님
                </p>
                <p> 정말 탈퇴 하시겠습니까? </p>
              </div>
              <div class="modal-footer">
              	<form role="form" id="resignForm" method="post" action="/salmon/main/mypage/resign">	
					<input type="button" id="resignSubmitBtn" value="탈퇴하기">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				</form>
				<!-- 	
                <form id="cancellationForm" action="/reservationmall/individual/cancellationRes.mall" method="post">
                  <input type="hidden" id="cancellation_res_id" name="cancellation_res_id" value=""/>
                  <button type="button" id="cancellationBtn" class="btn btn-danger" data-dismiss="modal" >취소하기</button>
                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </form>
                 -->
              </div>
            </div>
          </div>
        </div>
        <!-- 예약취소 모달 -->