<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let notice_add = {
    init:function (){
        $('#register_btn').click(function (){
            notice_add.send(); //아이템_애드 라는 객체에 센드가 호출
            });
        },
            send:function(){
            $('#register_form').attr({
                method:'post',
                action:'/notice/addImpl',
                // enctype:'multipart/form-data'
            });
            $('#register_form').submit();
        }
    };
    $(function (){
        notice_add.init();
    })
</script>


<div class="container-fluid">
    <!-- Page Heading -->
<%--    <h1 class="h3 mb-2 text-gray-800">Notice add</h1>--%>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Register New Notice</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <form id="register_form" class="form-horizontal well">
                    <input type="hidden" id="adminpin" name="adminpin" value="${loginadm.adminPin}"/>
                    <label class="control-label col-sm-2" for="noticetitle">Title:</label>
                    <div class="form-group">
                        <input type="text" class="form-control" id="noticetitle" name="noticetitle" placeholder="Input Title">
                    </div>

                    <label class="control-label col-sm-2" for="noticecontent">Content:</label>
                    <div class="form-group">
                        <input type="text" class="form-control" id="noticecontent" name="noticecontent" placeholder="Input Content">
                    </div>

                    <div>
                        <button type="button" id="register_btn" class="btn btn-primary">Regsiter</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
