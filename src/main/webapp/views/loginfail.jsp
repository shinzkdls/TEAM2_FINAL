<%--jsp 작성을 위해 아래 3줄은 기입.--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--JSTL : 통화 날짜를 표현하게 해주는 문법--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- Begin Page Content -->
<div class="container-fluid">

  <!-- Page Heading -->
  <h1 class="h3 mb-2 text-gray-800">Login</h1>

  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">로그인 실패</h6>
    </div>
    <%-- 실제 만들어지는 영역 --%>
    <div class="card-body">
      <div id="container">
        <h3>로그인에 실패 했습니다. 다시 거래하시기 바랍니다.</h3>
        <h3><a href="/login">다시 로그인하기</a></h3>
        <h3><a href="/register">회원가입 바로가기</a></h3>
      </div>

    </div>
    <%--   card-body 끝 --%>
  </div>
</div>
<!-- /.container-fluid -->

<!-- End of Main Content -->

