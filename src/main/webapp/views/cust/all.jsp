<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
<%--    <h1 class="h3 mb-2 text-gray-800">Customer</h1>--%>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">View All Customers</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable">
                    <thead>
                        <tr>
                            <th style="text-align: center; width: 150px;">회원번호</th>
                            <th style="text-align: center; width: 150px;">ID</th>
                            <th style="text-align: center; width: 150px;">이름</th>
                            <th style="text-align: center; width: 150px;">성별</th>
                            <th style="text-align: center; width: 150px;">연락처</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${custList}">
                        <tr>
                            <td style="text-align: center;">${obj.custpin}</td>
                            <td style="text-align: center;">${obj.custid}</td>
                            <td style="text-align: center;">${obj.custname}</td>
                            <td style="text-align: center;">${obj.gender}</td>
                            <td style="text-align: center;">${obj.phone}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- /.container-fluid -->