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
                            <th>PIN No.</th>
                            <th>ID</th>
                            <th>NAME</th>
                            <th>GENDER</th>
                            <th>PHONE No.</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${custList}">
                        <tr>
                            <td>${obj.custpin}</td>
                            <td>${obj.custid}</td>
                            <td>${obj.custname}</td>
                            <td>${obj.gender}</td>
                            <td>${obj.phone}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- /.container-fluid -->