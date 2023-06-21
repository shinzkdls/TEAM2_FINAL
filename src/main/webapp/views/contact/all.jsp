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
                        <th>CONTACT PIN No.</th>
                        <th>CUST PIN No.</th>
                        <th>EMAIL</th>
                        <th>TITLE</th>
                        <th>CONTENT</th>
                        <th>DATE</th>
                        <th>Admin PIN No.</th>
                        <th>Admin ID</th>
                        <th>Answer</th>
                        <th>Answer DATE</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${contactList}">
                        <tr>

                                <td>${obj.contactpin}</td>
                                <td>${obj.custpin}</td>
                                <td>${obj.email}</td>
                                <td>${obj.contacttitle}</td>
                                <td>${obj.contactcontent}</td>
                                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${obj.contactdate}"/></td>
                                <td>${obj.adminpin}</td>
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

