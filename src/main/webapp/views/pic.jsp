<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<script>
    let pic = {
        myVideoStream:null,
        init:function(){
            this.myVideoStream = document.querySelector('#myVideo');
            $('#cfr_btn').click(function(){
            });
        },
        getVideo:function(){
            navigator.getMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
            navigator.getMedia(
                {video: true, audio: false},
                function(stream) {
                    pic.myVideoStream.srcObject = stream
                    pic.myVideoStream.play();
                },
                function(error) {
                    alert('webcam not working');
                });
        },
        takeSnapshot:function(){
            var myCanvasElement = document.querySelector('#myCanvas');
            var myCTX = myCanvasElement.getContext('2d');
            myCTX.drawImage(this.myVideoStream, 0, 0, myCanvasElement.width, myCanvasElement.height);
        },
        send:function(){
            const canvas = document.querySelector('#myCanvas');
            const imgBase64 = canvas.toDataURL('image/jpeg', 'image/octet-stream');
            const decodImg = atob(imgBase64.split(',')[1]);
            let array = [];
            for (let i = 0; i < decodImg .length; i++) {
                array.push(decodImg .charCodeAt(i));
            }
            const file = new Blob([new Uint8Array(array)], {type: 'image/jpeg'});
            const fileName = new Date().getMilliseconds() +'_profileimg.jpg';
            let formData = new FormData();
            formData.append('file', file, fileName);
            $.ajax({
                type: 'post',
                url: '/saveimg/',
                enctype: 'multipart/form-data',
                cache: false,
                data: formData,
                processData: false,
                contentType: false,
                success: function (data) {
                    $('#imgname').val(data);
                }
            });
        },
        takeAuto:function(interval){
            this.getVideo();
            myStoredInterval = setInterval(function(){
                pic.takeSnapshot();
                pic.send();
            }, interval);
        }
    };
    $(function(){
        pic.init();
    });
</script>

    <div class="container-fluid">
        <!-- Page Heading -->
<%--        <h1 class="h3 mb-2 text-gray-800">Tables</h1>--%>
<%--        <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.--%>
<%--            For more information about DataTables, please visit the <a target="_blank"--%>
<%--                                                                       href="https://datatables.net">official DataTables documentation</a>.</p>--%>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Take My Picture</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">

                    <div class="col-sm-8 text-left">
                        <h1>Pic</h1>
                        <hr>
                        <video id="myVideo" width="300" height="300" style="border: 1px solid #ddd;"></video>
                        <canvas id="myCanvas" width="300" height="300" style="border: 1px solid #ddd;"></canvas><br>
                        <input type=button class="btn btn-primary" value="Camera On" onclick="pic.getVideo();">&nbsp;
                        <input type=button class="btn btn-primary" value="Take Pic" onclick="pic.takeSnapshot();">&nbsp;
                        <input type=button class="btn btn-primary" value="Save Pic" onclick="pic.send();">&nbsp;
                        <input type=button class="btn btn-primary" value="Auto Pic(3sec)" onclick="pic.takeAuto(3000);"><br/><br/>
                        <form id="cfr_form" action="/mycfr" method="/get">
                            Image Name:<input type="text" class="form-control" style="width: 300px" name="imgname" id="imgname"><br>
                            <button type="submit" id="cfr_btn">CFR</button>
                        </form>
                        <h2>${result.emotion}</h2>
                        <h2>${result.gender}</h2>
                        <h2>${result.pose}</h2>
                        <h2>${result.age}</h2>
                    </div>

                </div>
            </div>
        </div>
    </div>
