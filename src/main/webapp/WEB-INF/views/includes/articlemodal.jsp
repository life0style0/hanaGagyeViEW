<%@ page language="java" contentType="text/html; charset=utf-8" %>
<div class="modal fade article-modal blog-list" id="article-modal" tabindex="-1" role="dialog" aria-labelledby="article-modal-label"
  aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
        <div class="blog-post">
          <div class="row">
            <div class="col-xs-12 col-sm-6 h-404">
              <div class="post-preview">
                <div class="article-carousel owl-carousel owl-theme">
                </div>
              </div>
            </div>
            <div class="col-xs-12 col-sm-6 h-404">
              <div class="post-desc">
                <div class="post-category" id="article-ctgry-name">카테고리이름 ex) 음식, 영화</div>
                <div class="post-label"><span id="article-money">285400원, </span><span id="article-title">메모 or 제목</span></div>
                <div class="post-text" id="article-content">
                  Lorem ipsum dolor sit, amet consectetur adipisicing elit. Iure quaerat tempore tenetur repudiandae pariatur velit perspiciatis inventore, dicta ea reiciendis impedit voluptatibus cumque assumenda quod autem quia et quisquam doloremque?
                </div>
                <div class="author-post">
                  <img src="" alt="" class="ava-author" id="article-writer-photo">
                  <span>by </span><a href="blog-detail-2.html" id="article-writer-nickname">Hoang Nguyen</a>,
                  <span id="article-regdate">작성일</span>
                  <span id="article-pay-type">, 지출 타입</span><span id="article-ctgry">(지출 or 수입)</span>
                  <span id="article-scope">, 공개 범위</span>
                </div>
                <div class="info-block">
                  <span id="article-likes-num"><i class="fa fa-thumbs-o-up"></i> 360</span>
                  <span id="article-scraps-num"><i class="fa fa-eye"></i> 789</span>
                  <span id="article-comments-num"><i class="fa fa-comment-o"></i> 20</span>
                  <span id="article-share-btn"><a><i class="fa fa-share-alt"></i> 공유</a></span>
                  <span id="article-share-cancel-btn"><a><i class="fa fa-ban"></i> 공유 취소</a></span>
                  <div class="article-right-btns">
                    <span id="article-edit-btn"><a><i class="fa fa-edit"></i> 수정</a></span>
                    <span id="article-exit-btn"><button data-dismiss="modal" aria-label="Close"><i class="fa fa-times"></i> 종료</button></span>
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