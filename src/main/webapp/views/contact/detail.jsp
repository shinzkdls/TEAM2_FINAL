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
                    $('#order_form').submit()
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
                        <th class="col-sm-2">CONTACT PIN No.</th>
                        <th class="col-sm-2">CUST PIN No.</th>
                        <th class="col-sm-2">EMAIL</th>
                        <th class="col-sm-2">TITLE</th>
                        <th class="col-sm-2">CONTENT</th>
                        <th class="col-sm-2">DATE</th>

                    </tr>
                    </thead>
                    <tbody>
                            <tr>
                                <td>${obj.contactpin}</td>
                                <td>${obj.custpin}</td>
                                <td>${obj.email}</td>
                                <td>${obj.contacttitle}</td>
                                <td>${obj.contactcontent}</td>
                                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${obj.contactdate}"/></td>
                            </tr>
                    </tbody>
                </table>
                <table style="text-align: center;" class="table table-bordered">
                    <thead>
                    <tr>
                        <th>Answer</th>
                        <th>Answer</th>
                        <th>Answer</th>
                    </tr>
                    </thead>
                    <tbody>
                            <tr>
                                <form id="detail_form">
                                    <input id="contactpin" name="contactpin" type="hidden" value="${obj.contactpin}">
                                    <td><input id="adminpin" name="adminpin" type="readonly" value="${loginadm.adminPin}"></td>
                                    <td><input id="answercontact" name="answercontact" style="text-align: center;"  value="${obj.answercontent}"></td>
                                </form>
                            </tr>
                    </tbody>
                </table>
                <div style="display: flex; justify-content: flex-end;">
                    <a href="/contact/all" type="button" class="btn btn-primary" style="margin-right: 10px;">back to list</a>
                    <button type="button" id="update_btn" class="btn btn-primary">Update</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.container-fluid -->

