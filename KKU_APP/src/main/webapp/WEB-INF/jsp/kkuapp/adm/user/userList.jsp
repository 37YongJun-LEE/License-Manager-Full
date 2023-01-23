<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%> 

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/admin" %>

<t:searchable_board_list search_urls="/admin/userList.do" search_range_name="가입일"  search_condition_name="검색구분" search_keyword_placeholder="검색어 입력">
   <jsp:attribute name="head_area">
   </jsp:attribute>

    <jsp:attribute name="meta_area">
       <ol class="loca">
         <li><img src="/_img/adm/comn/loca_home.png" alt="홈페이지 메인으로"/></li>
         <li>회원 관리</li>
         <li>회원 관리</li>
      </ol>
      <h2>회원 관리</h2>
   </jsp:attribute>
   
   <jsp:attribute name="search_options">
   <option value="ALL" selected="">전체</option>
   <option value="StdNum" <c:if test="">selected="selected"</c:if>>학번별</option>
   <option value="name"   <c:if test="">selected="selected"</c:if> >이름별</option>
   <option value="depart"   <c:if test="">selected="selected"</c:if>>단과대/소속</option>
   <option value="major"   <c:if test="">selected="selected"</c:if>>학과/부서별</option>
   </jsp:attribute>

   <jsp:attribute name="body_area">
      <table class="table01" summary="회원 목록" >
         <caption>관리자 목록</caption>
         <colgroup>
            <col width="4%">
            <col width="6%">
            <col width="auto">
            <col width="10%">
            <col width="15%">
            <col width="15%">
            <col width="8%">
            <col width="10%">
            <col width="5%">
         </colgroup>
         
         <thead>
            <tr>
               <th scope="col">
                  <input class="checkbox" type="checkbox" value="" id="ck1" onclick="allCheck();">
                  <label for="ck1" class="font_0 chk_all"></label>
               </th>
               <th>NO</th>
                  <th >아이디</th>
                  <th>학번</th>
                  <th>학과 </th>
                  <th>전공</th>
                  <th>유저타입</th>
                  <th>가입일</th>
                  <th>관리</th>
            </tr>
         </thead>
         <tbody>
         <c:forEach var="result" items="${usrList}">
               <tr>
                  <td>
                  <input class="checkbox" type="checkbox" value="${result.usrIdx}" name="usrIdxArr" id="${result.usrIdx}" >
                  <label for="${result.usrIdx}" class="font_0 chk_all"></label>
                  </td>
            
                  <td>${result.usrIdx}</td>
                  <td>${result.usrEmail}</td>
                  <td>${result.usrStdnum}</td>
                  <td>${result.usrDepartment}</td>
                  <td>${result.usrMajor}</td>
                  <td>${result.usrRank}</td>
                  <td>${result.signupDate}</td>
                  <td>
                     <p class="btn">
                        <a href="/admin/userModify.do?usrEmail=${result.usrEmail}&dest=userList"  class="line" >수정</a><br>
                     </p>
                  </td>
               </tr>
            </c:forEach>
         </tbody>
      
      </table>
      <p class="pn" >
            <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
         </p>
      <c:if test="${adminSessionVo.cmntIdx == -1 }">
         <p class="btn_area max_width">
            <a href="javascript:void(0)" onclick="selectDelete(); return false" class="btn_del">삭제</a>
         </p>
      </c:if> 
   </jsp:attribute>

   <jsp:attribute name="script_area">
      <script>
         function allCheck(){
            if($("input:checkbox[id='ck1']").prop("checked")){
                 $("input:checkbox[name='usrIdxArr']").prop("checked",true);
             }else{
                 $("input:checkbox[name='usrIdxArr']").prop("checked",false);
             } 
         }
          
       function selectDelete(){
         if(confirm('정말 삭제하시겠습니까?')){
            $("input:checkbox[name='usrIdxArr']").each(function() {
               if($(this).is(':checked')){
                  $.ajax({ 
                     type : "POST",
                     url : "/kpcceo/admin/userDelete.do",
                     data : {
                        usrIdx : $(this).val(),
                     },
                     success : function() {}
                  });
               }
   
            });
            alert("정상적으로 삭제되었습니다.");
            location.reload();
         }   
      }
       </script>
   </jsp:attribute>
</t:searchable_board_list>