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
            <h6 class="m-0 font-weight-bold text-primary">View All Recipes</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th style="text-align: center; width: 150px;">이미지</th>
                            <th style="text-align: center; width: 100px;">레시피 번호</th>
                            <th style="text-align: center;">제목</th>
                            <th style="text-align: center; width: 100px; width:75px;">작성자</th>
                            <th style="text-align: center; width: 100px; width:75px;">종류</th>
                            <th style="text-align: center; width: 150px;">등록일자</th>
                            <th style="text-align: center; width: 100px;">삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${recipeList}">
                        <tr>
                            <td style="text-align: center; vertical-align: middle;">
                                <img id="recipe_img" src="/uimg/${obj.thumbnailimg}">
                            </td>
                            <td style="text-align: center; vertical-align: middle;">${obj.recipepin}</td>
                            <td style="text-align: center; vertical-align: middle;">${obj.recipetitle}</td>
                            <td style="text-align: center; vertical-align: middle; width:75px;">${obj.custid}</td>
                            <td style="text-align: center; vertical-align: middle; width:75px;">${obj.type}</td>
                            <td style="text-align: center; vertical-align: middle;"><fmt:formatDate pattern="yyyy-MM-dd" value="${obj.recipedate}"/></td>
                            <td style="text-align: center; vertical-align: middle;">
                                <form action="/recipe/deleteImpl" method="post" onsubmit="return confirm('정말로 삭제하시겠습니까?');">
                                    <input type="hidden" name="recipepin" value="${obj.recipepin}" />
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

