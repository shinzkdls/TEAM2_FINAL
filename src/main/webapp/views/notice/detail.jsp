<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let cust_detail = {
        init:function (){
            $('#update_btn').click(function (){
                let c = confirm("답변을 등록하겠습니까?");
                if(c == true){
                    $('#detail_form').attr({
                        method: "post",
                        action: "/contact/update"
                    })
                    $('#detail_form').submit()
                }

            });
        }
    }

    $(function (){
        cust_detail.init();
    })
</script>
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
<%--    <h1 class="h3 mb-2 text-gray-800">Recipe All</h1>--%>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Notice Detail</h6>
        </div>
        <div class="card-body">
            <div>
                <table style="text-align: center;" class="table table-bordered">
                    <thead>
                    <tr>
                        <th class="col-sm-2">공지사항 번호</th>
                        <th class="col-sm-2">등록일자</th>
                    </tr>
                    </thead>
                    <tbody>
                            <tr>
                                <td>${obj.noticepin}</td>
                                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${obj.noticedate}"/></td>
                            </tr>
                    </tbody>
                </table>
                <table style="text-align: center;" class="table table-bordered">
                    <thead>
                        <tr>
                            <th class="col-sm-2" style="text-align: left">공지사항 제목 : ${obj.noticetitle}</th>
                        </tr>
                        <tr>
                            <td style="text-align: left">${obj.noticecontent}</td>
                        </tr>
                    </thead>
                </table>
                <div style="display: flex; justify-content: flex-end;">
                    <a href="/notice/all" type="button" class="btn btn-primary" style="margin-right: 10px;">뒤로가기</a>
                    <form action="/notice/deleteImpl" method="post" onsubmit="return confirm('정말로 삭제하시겠습니까?');">
                        <input type="hidden" name="noticepin" value="${obj.noticepin}" />
                        <button type="submit" class="btn btn-primary">삭제</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.container-fluid -->

