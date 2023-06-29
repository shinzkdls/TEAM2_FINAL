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
                <table style="text-align: center;" class="table table-bordered" id="dataTable">
                    <thead>
                    <tr>
                        <th style="text-align: center;">문의번호</th>
                        <th style="text-align: center; width: 120px;">EMAIL</th>
                        <th style="text-align: center;">제목</th>
                        <th style="text-align: center;">등록일자</th>
                        <th style="text-align: center;">답변여부</th>
                        <th style="text-align: center;">답변내용</th>
                        <th style="text-align: center;">답변일자</th>
                        <th style="text-align: center;">자세히</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${contactList}">
                        <tr>

                            <td style="text-align: center; vertical-align: middle;">${obj.contactpin}</td>
                            <td style="text-align: center; vertical-align: middle;">${obj.email}</td>
                            <td style="text-align: center; vertical-align: middle;">${obj.contacttitle}</td>
                            <td style="text-align: center; vertical-align: middle;"><fmt:formatDate pattern="yyyy-MM-dd" value="${obj.contactdate}"/></td>
                            <td style="text-align: center; vertical-align: middle;">
                                <c:choose>
                                    <c:when test="${obj.answerdate == null}">
                                        N
                                    </c:when>
                                    <c:otherwise>
                                        Y
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td style="text-align: center; vertical-align: middle;">${obj.answercontent}</td>
                            <td style="text-align: center; vertical-align: middle;"><fmt:formatDate pattern="yyyy-MM-dd" value="${obj.answerdate}"/></td>
                            <td style="text-align: center; vertical-align: middle;">
                                <a type="button" class="btn btn-primary" style="width: 75px;"
                                   href="/contact/detail?contactpin=${obj.contactpin}">자세히</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- /.container-fluid -->

