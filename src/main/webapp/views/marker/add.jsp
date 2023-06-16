<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let Marker_add = {
    init:function (){
        $('#register_btn').click(function (){
            Marker_add.send(); //아이템_애드 라는 객체에 센드가 호출
            });
        },
            send:function(){
            $('#register_form').attr({
                method:'post',
                action:'/marker/addimpl',
                enctype:'multipart/form-data'
            });
            $('#register_form').submit();
        }
    };

    $(function (){
        Marker_add.init();
    })
</script>


<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800"> Marker add</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <form id="register_form" class="form-horizontal well">
                    <label class="control-label col-sm-2" for="target">target:</label>
                    <div class="form-group">
                        <input type="name" class="form-control" id="target" name="target" placeholder="Input target" >
                    </div>

                    <label class="control-label col-sm-2" for="title">title:</label>
                    <div class="form-group">
                        <input type="text" class="form-control" id="title" name="title" placeholder="Input title" >
                    </div>

                    <label class="control-label col-sm-2" for="lat">lat:</label>
                    <div class="form-group">
                        <input type="text" class="form-control" id="lat" name="lat" placeholder="Input lat" >
                    </div>

                    <label class="control-label col-sm-2" for="lng">lng:</label>
                    <div class="form-group">
                        <input type="text" class="form-control" id="lng" name="lng" placeholder="Input lng" >
                    </div>

                    <label class="control-label col-sm-2" for="loc">loc:</label>
                    <div class="form-group">
                        <input type="text" class="form-control" id="loc" name="loc" placeholder="Input loc" >
                    </div>

                    <label class="control-label col-sm-2" for="sendimg">IMG:</label>
                    <div class="form-group">
                        <input type="file" class="form-control" id="sendimg" name="sendimg" placeholder="Input sendimg" >
                    </div>

                    <div class="form-group">
                        <button type="button" id="register_btn" class="btn btn-primary">Regsiter</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
