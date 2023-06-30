<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #recived {
        max-width: 500px;
        margin: 0 auto;
        background-color: #f4f4f4;
        padding: 20px;
        border-radius: 20px;
        overflow: auto;
        width: 70%;
        height: 130px;
    }

    #sent {
        max-width: 500px;
        margin: 0 auto;
        background-color: #f4f4f4;
        padding: 20px;
        border-radius: 20px;
        overflow: auto;
        width: 70%;
        height: 130px;
    }
     #body {
         background-image: url('http://www.pngmart.com/files/1/Clouds-PNG-Pic.png'), url('https://myphuket-holiday.com/wp-content/uploads/revslider/homepage/cloud.png'), url('http://pngimg.com/uploads/cloud/cloud_PNG7.png'), url('https://myphuket-holiday.com/wp-content/uploads/revslider/homepage/cloud.png'), linear-gradient(to bottom, #0984e3, #81ecec);
         background-size: 100%, 40%, 50%, 20%, cover;
         background-repeat: no-repeat;
         background-position: -300px 10%, -200px 70%, 200px 40%, 400px 80%, 100%;
         animation: animater 20s 4s ease-out infinite alternate;
         padding: 10px 0;
         min-height: 85vh;
     }

    @keyframes animater {
        to {
            background-position: 200px 10%, 500px 70%, 600px 40%, 800px 80%, 100%;
            background-size: 100%, 40%, 50%, 20%, cover;
        }
    }
      .chat {
        display: flex;
        align-items: flex-start;
        padding: 0px 20px 20px 20px;
    }

      .chat .icon,img {
        position: relative;
        overflow: hidden;
        width: 50px;
        height: 50px;
        border-radius: 50%;
        background-color: #eee;
    }

      .chat .icon i {
        position: absolute;
        top: 10px;
        left: 50%;
        font-size: 2.5rem;
        color: #aaa;
        transform: translateX(-50%);
    }

      .chat .textbox {
        position: relative;
        display: inline-block;
        max-width: calc(100% - 70px);
        padding: 10px;
        margin-top: 7px;
        font-size: 13px;
        border-radius: 10px;
          color: black;
    }

      .chat .textbox::before {
        position: absolute;
        display: block;
        top: 0;
        font-size: 1.5rem;
    }

      .received .textbox {
        margin-left: 20px;
        background-color: #ddd;
    }

      .received .textbox::before {
        left: -15px;
        content: "◀";
        color: #ddd;
    }

      .sent {
        flex-direction: row-reverse;
    }

      .sent .textbox {
        margin-right: 20px;
        background-color: #F9EB54;
    }
      .sent .textbox::before {
        right: -15px;
        content: "▶";
        color: #F9EB54;
    }
    .form-container {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: center;
        margin-top: 20px;
        height:60px;
        position: sticky;
    }
    .test {
        position: relative;
    }

    /* Style the input field */
    .form-container input[type=text] {
        width: 70%;
        padding: 12px;
        border: none;
        border-radius: 25px;
        outline: none;
        font-size: 16px;
        background-color: #f1f1f1;
        margin-right: 10px;
    }

    /* Style the submit button */
    .form-container button {
        width: 20%;
        background-color: #4CAF50;
        color: white;
        padding: 12px;
        border: none;
        border-radius: 25px;
        cursor: pointer;
        font-size: 16px;
    }

    /* Add a hover effect to the button */
    .form-container button:hover {
        opacity: 0.8;
    }
    .time {
        font-size: 12px;
        color: #777;
    }
    #header {
        display: flex;
        align-items: center;
        height: 40px;
        padding: 5px 0 0 15px;
        background-color: #A8C0D9;
    }


</style>

<script>
    let websocket = {
        id:null,
        stompClient:null,
        init:function(){
            this.id = $('#adm_id').text();
            websocket.connect();
            $("#totext").keypress(function(event) { // enter 시에도 실행
                if (event.which === 13) {
                    event.preventDefault();
                    scrollToBottom();
                    if($("#target").val()==""){ //all, to 구분. 버튼 클릭 시 all 안됨..
                        $("#sendall").click();
                    }else {
                        $("#sendto").click();
                    }
                }
            });
            $("#sendall").click(function() {
                var question = $('#totext').val(); // 질문 내용 가져오기
                var senderMessage = 'to. 전체 : '+ question; // 질문 내용
                var senderTime = new Date().toLocaleTimeString(); // 현재 시간
                var isSender = true; // 사용자가 보낸 메시지 여부
                var chatMessageHtml = createChatMessage(senderMessage, senderTime, isSender);
                scrollToBottom();
                $('#body').append(chatMessageHtml);
                websocket.sendAll();
            });
            $("#sendto").click(function() {
                var question = $('#totext').val(); // 질문 내용 가져오기
                var senderMessage = 'to. '+$('#target').val()+' : ' + question; // 질문 내용
                var senderTime = new Date().toLocaleTimeString(); // 현재 시간
                var isSender = true; // 사용자가 보낸 메시지 여부
                var chatMessageHtml = createChatMessage(senderMessage, senderTime, isSender);
                scrollToBottom();
                $('#body').append(chatMessageHtml);
                websocket.sendTo();
            });
        },
        connect:function(){
            var sid = this.id;
            var socket = new SockJS('http://127.0.0.1:8088/ws');
            this.stompClient = Stomp.over(socket);

            this.stompClient.connect({}, function(frame) {
                console.log('Connected: ' + frame);
                this.subscribe('/send/to/'+sid, function(msg) {
                    var answer = 'from. '+JSON.parse(msg.body).sendid+' : ' +JSON.parse(msg.body).content1; // 첫 번째 대답 가져오기
                    var time2 = new Date().toLocaleTimeString(); // 현재 시간

                    var receiverMessage = answer; // 답변 내용
                    var receiverTime = time2; // 답변 시간
                    var isSender = false; // 사용자가 보낸 메시지 여부

                    var chatMessageHtml = createChatMessage(receiverMessage, receiverTime, isSender);
                    scrollToBottom();
                    $('#body').append(chatMessageHtml);
                });
            });
        },
        sendAll:function(){
            var msg = JSON.stringify({
                'sendid' : this.id,
                'content1' : $("#totext").val()
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

    // 채팅 메시지 생성 함수
    function createChatMessage(message, time, isSender) {
        let containerClass = isSender ? "sent" : "received";
        let profile = isSender ? '<img src="/uimg/kbstar_profileimg.jpg">':(${logincust!=null})? '<img src="/uimg/${logincust.custid}_profileimg.jpg">':'<div class="icon"><i class="fa fa-user"></i></div>';
        let messageHtml = '<div class="chat '+containerClass+'">'+profile+'<div class="textbox">'+message+'<span class="time"><br>'+time+'</span></div></div>';

        return messageHtml;
    }
    // 화면 하단이동 함수
    function scrollToBottom(){
        $('#body').animate({
            scrollTop: $('body')[0].scrollHeight
        }, 1000);
    };
</script>
<!-- Begin Page Content -->
<div class="container-fluid">
    <h1 id="adm_id" style="display: none;">${loginadm.adminId}</h1>
    <div id="body" >
    </div>
    <div class="test card shadow mb-4">
        <div class="form-container">
            <input type="text" id="target" style="width: 200px" placeholder="id 입력. 전체 발송시 미입력">
            <input id="totext" type="text" placeholder="Type your message...">
            <button id="sendto" type="button">개별 발송</button>
            <button id="sendall" type="button">전체 발송</button>
        </div>
    </div>

    <!-- /.container-fluid -->
</div>