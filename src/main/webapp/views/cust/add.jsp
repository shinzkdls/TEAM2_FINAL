<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let cust_add = {
    init:function (){
        $('#register_btn').click(function (){
           cust_add.send();
            });
        },
            send:function(){
            $('#register_form').attr({
                method:'post',
                action:'/cust/addimpl'
            });
            $('#register_form').submit();
        }
    };

    $(function (){
        cust_add.init();
    })
</script>


<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800"> Cust add</h1>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <form id="register_form" class="form-horizontal well">
                    <div class="form-group">
                        <input type="text" class="form-control" id="id" name="id" placeholder="Make Cust ID" >
                    </div>
                    <div class="col-sm-10">
                        <span id="check_id" class="bg-danger"></span>
                    </div>

                    <div class="form-group">
                        <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter password" >
                    </div>

                    <div class="form-group">
                        <input type="name" class="form-control" id="name" name="name" placeholder="name" >
                    </div>

                    <div>
                        <button type="button" id="register_btn" class="btn btn-primary">Regsiter</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
