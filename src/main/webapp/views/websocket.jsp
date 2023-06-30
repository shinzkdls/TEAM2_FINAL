<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #recived {
        max-width: 500px;
        margin: 0 auto;
        background-color: #f4f4f4;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: left;
    }

    #sent {
        max-width: 500px;
        margin: 0 auto;
        background-color: #f4f4f4;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: right;
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
                var question = $('#alltext').val(); // 질문 내용 가져오기
                var senderMessage = question; // 질문 내용
                $("#sent").prepend(
                    "<h4>"+ "전체 메세지 : " + senderMessage + "</h4>");
                websocket.sendAll();
            });
            $("#sendto").click(function() {
                var question = $('#totext').val(); // 질문 내용 가져오기
                var senderMessage = question; // 질문 내용

                $("#sent").prepend(
                    "<h4>"+senderMessage+"</h4>");
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
                <h1 id="adm_id" style="display: none;">${loginadm.adminId}</h1>

                <h5>받은 메세지</h5>
                <div id="recived"></div>

                <h5>보낸 메세
                    ''지</h5>
                <div id="sent"></div>
                <label class="control-label" for="alltext" style="margin-top:50px;">전체 메세지</label>
                <div class="form-group" style="display: flex">
                    <input type="text" class="form-control" id="alltext" style="width: 70%">
                    <button class="btn btn-outline-primary" id="sendall">발송</button>
                </div>
                <label class="control-label" for="alltext">개별 답변</label>
                <div class="form-group" style="display: flex; flex-direction: column;">
                    <label for="target" class="inp" style="margin: 0; padding: 0;">
                        <input type="text"  id="target" placeholder="받는사람 ID를 입력하세요." style="width:30%; margin: 0; padding: 0;">
                        <span class="label"></span>
                        <svg width="120px" height="26px" viewBox="0 0 120 26">
                            <path d="M0,25 C21,25 46,25 74,25 C102,25 118,25 120,25"></path>
                        </svg>
                        <span class="border"></span>
                    </label><br>
                    <div style="display: flex";>
                        <input type="text" class="form-control" id="totext" style="width: 70%">
                        <button class="btn btn-outline-primary" id="sendto">발송</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.container-fluid -->
</div>