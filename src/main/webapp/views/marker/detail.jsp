<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let marker_detail = {
    init:function (){
        $('#register_btn').click(function (){
            marker_detail.send(); //아이템_애드 라는 객체에 센드가 호출
            });
        $('#delete_btn').click(function (){
            var c = confirm("정말 삭제하겠습니까?");
            if(c == true){
                location.href="/marker/deleteimpl?id=${gmarker.id}";
            }
        });
    },
            send:function(){
            $('#register_form').attr({
                method:'post',
                action:'/marker/updateimpl',
                enctype:'multipart/form-data'
            });
            $('#register_form').submit();
        }
    };

    $(function (){
        marker_detail.init();
    })
</script>


<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800"> marker Detail</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">${gmarker.id}</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <form id="register_form" class="form-horizontal well">
                    <input type="hidden" name="id" value="${gmarker.id}"> <%--hidden을 통해서 화면에는 보이지 않지만 name=id를 지정해서 서버에 전송을해준다--%>
                    <input type="hidden" name="img" value="${gmarker.img}">

                    <div class="form-group">
                        <div class="col-sm-10">
                            <img src="/uimg/${gmarker.img}">
                        </div>
                    </div>

                    <label class="control-label col-sm-2" for="target">target:</label>
                    <div class="form-group">
                        <input type="text" class="form-control" id="target" name="target" value="${gmarker.target}" >
                    </div>

                    <label class="control-label col-sm-2" for="title">title:</label>
                    <div class="form-group">
                        <input type="text" class="form-control" id="title" name="title" value="${gmarker.title}" >
                    </div>

                    <label class="control-label col-sm-2" for="lat">lat:</label>
                    <div class="form-group">
                        <input type="text" class="form-control" id="lat" name="lat" value="${gmarker.lat}" >
                    </div>

                    <label class="control-label col-sm-2" for="lng">lng:</label>
                    <div class="form-group">
                        <input type="text" class="form-control" id="lng" name="lng" value="${gmarker.lng}" >
                    </div>

                    <label class="control-label col-sm-2" for="lng">loc:</label>
                    <div class="form-group">
                        <input type="text" class="form-control" id="loc" name="loc" value="${gmarker.loc}" >
                    </div>

                    <label class="control-label col-sm-2" for="sendimg">Sendimg:</label>
                    <div class="form-group">
                        <input type="file" class="form-control" id="sendimg" name="sendimg" placeholder="Input sendimg" >
                    </div>

                    <div>
                        <button type="button" id="register_btn" class="btn btn-primary">Update</button>
                        <button type="button" id="delete_btn" class="btn btn-primary">Delete</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
