<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
<%--    <h1 class="h3 mb-2 text-gray-800">Recipe All</h1>--%>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">View All Contacts</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table  style="text-align: center;" class="table table-bordered" id="dataTable" >
                    <thead>
                    <tr>
                        <th style="text-align: center;">문의번호</th>
<%--                        <th style="text-align: center;">고객번호</th>--%>
                        <th style="text-align: center; width: 120px;">EMAIL</th>
                        <th style="text-align: center;">제목</th>
                        <th style="text-align: center;">내용</th>
                        <th style="text-align: center;">등록일자</th>
<%--                        <th style="text-align: center;">관리자 번호</th>--%>
                        <th style="text-align: center;">관리자 ID</th>
                        <th style="text-align: center;">답변내용</th>
                        <th style="text-align: center;">답변일자</th>
                        <th style="text-align: center;">수정</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${contactList}">
                        <tr>

                                <td>${obj.contactpin}</td>
<%--                                <td>${obj.custpin}</td>--%>
                                <td>${obj.email}</td>
                                <td>${obj.contacttitle}</td>
                                <td>${obj.contactcontent}</td>
                                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${obj.contactdate}"/></td>
<%--                                <td>${obj.adminpin}</td>--%>
                                <td>${obj.adminid}</td>
                                <td>${obj.answercontent}</td>
                                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${obj.answerdate}"/></td>
                                <td><a type="button" class="btn btn-primary" href="/contact/detail?contactpin=${obj.contactpin}">답변수정</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- /.container-fluid -->

