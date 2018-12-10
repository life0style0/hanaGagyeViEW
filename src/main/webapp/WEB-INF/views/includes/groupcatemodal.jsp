<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<!-- 카테고리별 그룹 MODAL창 CSS 수정 필요 -->
<!-- <!-- <style>
.modal-body{
  overflow-x:auto;
}

</style> --> -->

<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>


<div class="modal fade" id="CategoryModal" role="dialog">
<div class="modal-dialog modal-lg">
<div class="modal-content">
    <!-- 모달 헤더  -->
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal"
        aria-hidden="true">X</button>
      <h4 class="modal-title" id="classModalLabel">카테고리별 소모임 리스트</h4>
    </div>
    <!-- 모달 바디  -->
    <div class="modal-body">
      <table id="customers">
        <thead>
          <tr>
            <th width="8%;">번호</th>
            <th width="20%;">소모임 제목</th>
            <th>방장 이름</th>
            <th>소모임 개설일</th>
            <th>소모임 설명</th>
            <th>최대인원</th>
            <th>카테고리1</th>
            <th>카테고리2</th>
            <th>카테고리3</th>
          </tr>
        </thead>
        <!-- items : 반복 데이터가 있는 아이템 : Collection명 / var: 현재 아이템 변수명-->
        <c:forEach items="${list}" var="groups">
          <tr>

            <td style="text-align: center;"><c:out value="${groups.group_id}" /></td>
            <td><a href='/salmon/group/get?group_id=<c:out value="${groups.group_id}" />'><c:out
                  value="${groups.group_title}" /></a></td>
            <td><c:out value="${groups.user_id}" /></td>
            <td><c:out value="${groups.group_regdate}" /></td>
            <td><c:out value="${groups.group_description}" /></td>
            <td><c:out value="${groups.group_people_max}" /></td>
            <td style="text-align: center;"><c:out value="${groups.ctgry_1}" /></td>
            <td style="text-align: center;"><c:out value="${groups.ctgry_2}" /></td>
            <td style="text-align: center;"><c:out value="${groups.ctgry_3}" /></td>
          </tr>
        </c:forEach>
      </table>
    </div>
    <div class="modal-footer">
      <button type="button" class="btn btn-primary" data-dismiss="modal">
        Close
      </button>
    </div>
    </div>
    </div>
  </div>
