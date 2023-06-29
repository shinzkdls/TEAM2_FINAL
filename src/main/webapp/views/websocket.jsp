<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>


    #recived {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid green;
        border-radius: 25px;
    }
    #sent {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid green;
        border-radius: 25px;
    }


    .inp {
        position: relative;
        margin: auto;
        width: 100%;
        max-width: 280px;
    }

    .inp .label {
        position: absolute;
        top: 16px;
        left: 0;
        font-size: 16px;
        color: #9098A9;
        font-weight: 500;
        transform-origin: 0 0;
        transition: all .2s ease;
    }

    .inp svg {
        position: absolute;
        left: 0;
        bottom: 0;
        height: 26px;
        fill: none;
    }

    .inp svg path {
        stroke: #C8CCD4;
        stroke-width: 2;
        transition: all .2s ease;
    }

    .inp .border {
        position: absolute;
        bottom: 0;
        left: 120px;
        height: 2px;
        right: 0;
        background: #C8CCD4;
    }

    .inp input {
        -webkit-appearance: none;
        width: 100%;
        border: 0;
        font-family: inherit;
        padding: 12px 0;
        height: 48px;
        font-size: 16px;
        font-weight: 500;
        background: none;
        border-radius: 0;
        color: #223254;
        transition: all .15s ease;
    }

    .inp input:not(:placeholder-shown) + span {
        color: #5A667F;
        transform: translateY(-26px) scale(.75);
    }

    .inp input:focus {
        background: none;
        outline: none;
    }

    .inp input:focus + span {
        color: #0077FF;
        transform: translateY(-26px) scale(.75);
        transition-delay: .1s;
    }

    .inp input:focus + span + svg path {
        stroke: #0077FF;
        animation: elasticInput .4s ease forwards;
    }

    .inp input:focus + span + .border {
        background: #0077FF;
    }

    @keyframes elasticInput {
        50% {
            d: path("M2,2 C21,17 46,25 74,25 C102,25 118,25 120,25");
        }
    }


</style>

<script>
    let websocket = {
        id:null,
        stompClient:null,
        init:function(){
            this.id = $('#adm_id').text();
            websocket.connect();
            $("#sendall").click(function() {
                $("#sent").prepend(
                    "<h1>전체발송함</h1>");
                websocket.sendAll();
            });
            $("#sendto").click(function() {
                $("#sent").prepend(
                    "<h1>개별발송함</h1>");
                websocket.sendTo();
            });
        },
        connect:function(){
            var sid = this.id;
            var socket = new SockJS('http://127.0.0.1:8088/ws');
            this.stompClient = Stomp.over(socket);

            this.stompClient.connect({}, function(frame) {
                console.log('Connected: ' + frame);
                this.subscribe('/send', function(msg) {
                    $("#recived").prepend(
                        "<h4>" + JSON.parse(msg.body).sendid +":"+
                        JSON.parse(msg.body).content1
                        + "</h4>");
                });
                this.subscribe('/send/to/'+sid, function(msg) {
                    $("#recived").prepend(
                        "<h4>" + JSON.parse(msg.body).sendid +":"+
                        JSON.parse(msg.body).content1
                        + "</h4>");
                });
            });
        },
        sendAll:function(){
            var msg = JSON.stringify({
                'sendid' : this.id,
                'content1' : $("#alltext").val()
            });
            this.stompClient.send("/receiveall", {}, msg);
        },
        sendTo:function(){
            var msg = JSON.stringify({
                'sendid' : this.id,
                'receiveid' : $('#target').val(),
                'content1' : $('#totext').val()
            });
            this.stompClient.send('/receiveto', {}, msg);
        }
    };
    $(function(){
        websocket.init();
    })

</script>
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">chatting</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <h1 id="adm_id">${loginadm.adminId}</h1>

                <h3>recived</h3>
                <div id="recived"></div>

                <h3>sent</h3>
                <div id="sent"></div>
                <label class="control-label" for="alltext">공지 사항</label>
                <div class="form-group" style="display: flex">
                    <input type="text" class="form-control" id="alltext"><button class="btn btn-outline-primary" id="sendall">발송</button>
                </div>
                <label class="control-label" for="alltext">개별 답변</label>
                <div class="form-group" style="display: flex">
                    <label for="target" class="inp">
                        <input type="text"  id="target" placeholder="&nbsp;">
                        <span class="label">Label</span>
                        <svg width="120px" height="26px" viewBox="0 0 120 26">
                            <path d="M0,25 C21,25 46,25 74,25 C102,25 118,25 120,25"></path>
                        </svg>
                        <span class="border"></span>
                    </label>
                    <input type="text" class="form-control"  id="totext">
                    <button class="btn btn-outline-primary" id="sendto">발송</button>
                </div>








            </div>
        </div>
    </div>
    <!-- /.container-fluid -->
</div>