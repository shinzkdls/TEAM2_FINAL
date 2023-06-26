<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #class_img{
        width:100px;
        height: 100px;
    }
</style>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
<%--    <h1 class="h3 mb-2 text-gray-800">Class All</h1>--%>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">View All Classes</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th style="text-align: center;">이미지</th>
                            <th style="text-align: center;">클래스 번호</th>
                            <th style="text-align: center;">제목</th>
                            <th style="text-align: center;">작성자</th>
                            <th style="text-align: center;">종류</th>
                            <th style="text-align: center;">위치</th>
                            <th style="text-align: center;">가격</th>
                            <th style="text-align: center;">클래스 날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${classList}">
                        <tr>
                            <td style="text-align: center;">
                                <img id="class_img" src="/uimg/${obj.thumbnailimg}">
                            </td>
                            <td style="text-align: center;">${obj.classpin}</td>
                            <td style="text-align: center;">${obj.classtitle}</td>
                            <td style="text-align: center;">${obj.custid}</td>
                            <td style="text-align: center;">${obj.type}</td>
                            <td style="text-align: center;">${obj.location}</td>
                            <td style="text-align: center;">${obj.amount}</td>
                            <td style="text-align: center;">${obj.classdate}</td>
                        </tr>
                        <!-- Modal -->
<%--                        <div id="target${obj.custid}" class="modal fade" role="dialog">--%>
<%--                            <div class="modal-dialog">--%>
<%--                                <!-- Modal content-->--%>
<%--                                <div class="modal-content">--%>
<%--                                    <div class="modal-header">--%>
<%--                                        <h4 class="modal-title">Detail Image</h4>--%>
<%--                                    </div>--%>
<%--                                    <div class="modal-body">--%>
<%--                                        <p>${obj.title}</p>--%>
<%--                                        <img src="/uimg/${obj.thumbnailimg}"><br/>--%>
<%--                                    </div>--%>
<%--                                    <div class="modal-footer">--%>
<%--                                        <a href="/class/detail?id=${obj.custid}" class="btn btn-info" role="button">Detail</a>--%>
<%--                                        <a href="#" class="btn btn-info" data-dismiss="modal" role="button">Close</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                        <!-- Modal END-->
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- /.container-fluid -->

