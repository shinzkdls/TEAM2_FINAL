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
                            <th style="text-align: center; width: 150px;">공지사항 번호</th>
                            <th style="text-align: center;">제목</th>
                            <th style="text-align: center;">내용</th>
                            <th style="text-align: center; width: 150px;">등록일자</th>
                            <th style="text-align: center; width: 100px;">자세히</th>
                            <th style="text-align: center; width: 100px;">삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${noticeList}">
                        <tr>
                            <td style="text-align: center; vertical-align: middle;">${obj.noticepin}</td>
                            <td style="text-align: center; vertical-align: middle; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 200px;">${obj.noticetitle}</td>
                            <td style="text-align: center; vertical-align: middle; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 300px;"> ${obj.noticecontent}</td>
                            <td style="text-align: center; vertical-align: middle;"><fmt:formatDate pattern="yyyy-MM-dd" value="${obj.noticedate}"/></td>
                            <td style="text-align: center; vertical-align: middle;">
                                <a href="/notice/detail?noticepin=${obj.noticepin}">
                                    <button class="btn btn-primary">자세히</button>
                                </a>
                            </td>
                            <td style="text-align: center; vertical-align: middle;">
                                <form action="/notice/deleteImpl" method="post" onsubmit="return confirm('정말로 삭제하시겠습니까?');">
                                    <input type="hidden" name="noticepin" value="${obj.noticepin}" />
                                    <button type="submit" class="btn btn-primary">삭제</button>
                                </form>
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

