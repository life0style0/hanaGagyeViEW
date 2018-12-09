<%@ page language="java" contentType="text/html; charset=utf-8" %>
<div class="modal fade report-modal blog-list" id="report-article-modal" tabindex="-1" role="dialog" aria-labelledby="report-modal-label"
  aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
        <div class="blog-post">
          <div class="row">
           
            <div class="col-xs-12 col-sm-12 h-404">
            <h3> 신고하기 </h3>
			<div>신고 사유를 적어주세요</div>
              <div class="post-desc">
                  	<input type="text" name="report_reason" id="report_reason" required="required">
                  	<input type="hidden" name="article_id" id="reoport-article-id-modal">
	              	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	                <input class="login" type="button" id="article-report-modal-btn" value="신고하기">
                <div class="info-block">
                    <span id="report-exit-btn">
                    <button data-dismiss="modal" aria-label="Close">
                    <i class="fa fa-times"></i> 종료</button>
                    </span>
                </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>