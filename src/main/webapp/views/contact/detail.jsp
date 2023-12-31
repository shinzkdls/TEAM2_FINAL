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
            <h6 class="m-0 font-weight-bold text-primary">Contact Detail</h6>
        </div>
        <div class="card-body">
            <div>
                <table style="text-align: center;" class="table table-bordered">
                    <thead>
                    <tr>
                        <th class="col-sm-2">문의번호</th>
                        <th class="col-sm-2">회원번호</th>
                        <th class="col-sm-2">EMAIL</th>
                        <th class="col-sm-2">문의일자</th>
                    </tr>
                    </thead>
                    <tbody>
                            <tr>
                                <td>${obj.contactpin}</td>
                                <td>${obj.custpin}</td>
                                <td>${obj.email}</td>
                                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${obj.contactdate}"/></td>
                            </tr>

                    </tbody>
                </table>
                <table style="text-align: center;" class="table table-bordered">
                    <thead>
                        <tr>
                            <th class="col-sm-2" style="text-align: left">문의제목 : ${obj.contacttitle}</th>
                        </tr>
                        <tr>
                            <td style="text-align: left">${obj.contactcontent}</td>
                        </tr>
                    </thead>
                </table>
                <div id="container">
                    <form id="detail_form" class="form-horizontal well">
                        <input id="contactpin" name="contactpin" type="hidden" value="${obj.contactpin}">
                        <input id="adminpin" name="adminpin" type="hidden" value="${loginadm.adminPin}" >
                        <label class="control-label col-sm-2" for="answercontent">Answer</label>
                        <div class="form-group">
                            <input type="text" class="form-control" id="answercontent" name="answercontent" value="${obj.answercontent}"
                            placeholder="${obj.answercontent}">
                        </div>
                    </form>
                </div>
                <div style="display: flex; justify-content: flex-end;">
                    <a href="/contact/all" type="button" class="btn btn-primary" style="margin-right: 10px;">뒤로가기</a>
                    <c:choose>
                        <c:when test="${obj.answercontent != null}">
                            <button type="button" id="update_btn" class="btn btn-primary">변경</button>
                        </c:when>
                        <c:otherwise>
                            <button type="button" id="update_btn" class="btn btn-primary">등록</button>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.container-fluid -->

