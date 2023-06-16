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
                            <th>IMAGE</th>
                            <th>PIN No.</th>
                            <th>TITLE</th>
                            <th>WRITER</th>
                            <th>TYPE</th>
                            <th>LOCATION</th>
                            <th>AMOUNT</th>
                            <th>CLASS DATE</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${classList}">
                        <tr>
                            <td>
                                <img id="class_img" src="/uimg/${obj.thumbnailimg}">
                            </td>
                            <td>${obj.classpin}</td>
                            <td>${obj.classtitle}</td>
                            <td>${obj.custid}</td>
                            <td>${obj.type}</td>
                            <td>${obj.location}</td>
                            <td>${obj.amount}</td>
<%--                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${obj.classdate}"/></td>--%>
                            <td>${obj.classdate}</td>
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

