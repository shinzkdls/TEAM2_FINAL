<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #recipe_img{
        width:100px;
        height: 100px;
    }
</style>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
<%--    <h1 class="h3 mb-2 text-gray-800">Recipe All</h1>--%>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">View All Notices</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>PIN No.</th>
                            <th>TITLE</th>
                            <th>CONTENT</th>
                            <th>DATE</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${noticeList}">
                        <tr>
                            <td>${obj.noticepin}</td>
                            <td>${obj.noticetitle}</td>
                            <td>${obj.noticecontent}</td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${obj.noticedate}"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- /.container-fluid -->

