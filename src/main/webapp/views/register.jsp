<%--jsp 작성을 위해 아래 3줄은 기입.--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--JSTL : 통화 날짜를 표현하게 해주는 문법--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script>
    <%-- 회원가입 기능 --%>
    // resgister.jsp // 회원가입 기능 자바스크립트
    let register_form = {
        init:function (){ // 화면에 이벤트 처리
            // 입력 전까진 버튼 비활성화
            $('#register_btn').addClass('disabled'); // 입력 안하면 버튼 비활성화 하기.
            $('#register_btn').click(function (){
                register_form.send();
            });
            $('#name').keyup(function (){
                var id =  $('#id').val();
                var pwd = $('#pwd').val();
                var lev = $('#lev').val();
                if(id != '' && pwd != '' && lev !=''){
                    $('#register_btn').removeClass('disabled'); // 칸이 다 채워져 있으면 버튼 활성화해
                }
            });
            // ** input에서 keyup 동작되면, 함수가 실행된다.
            $('#id').keyup( function (){

                var txt_id = $('#id').val(); // 고객이 입력한 input 값을 집어넣는다.
                if(txt_id.length <= 3){ // id길이 3개 이하면
                    return; // 함수 그만둬.
                }
                $.ajax({ // ajax로 전송해달라고 요청
                    url : '/checkid',
                    data : {'id':txt_id}, // id값은 id라는 이름으로 전송.
                    success:function (data){
                        //id값 사용여부
                        if(data == 0){
                            $('#check_id').text('사용 가능한 아이디 입니다!');
                        }
                        else{
                            $('#check_id').text('이미 존재하는 아이디');
                        }
                    },
                    error:function (){
                        alert("error");
                    }
                })
            });
        },
        send:function () { // 보내기
            var id =  $('#id').val();
            var pwd = $('#pwd').val();
            var lev = $('#lev').val();
            if( id.length <= 3 ){ // 3자리 이하면 그만진행(가입 안되게)
                $('#check_id').text("id는 4자리 이상이어야 합니다.");
                $('#id').focus();

                return;
            }
            if( pwd == '' ){ // 공백이면 그만진행(가입 안되게)
                $('#pwd').focus();
                return;
            }
            if( lev == '' ){ // 공백이면 그만진행
                $('#lev').focus();
                return;
            }

            $('#register_form').attr({
                'action':'/registerimpl', // maincontroller 로 보낸다.
                'method':'post'
            });
            $('#register_form').submit(); // 가입한 id, pwd, name 모두 전송.
        }
    };
    // 회원가입 기능(스크립트)를 상단에 기입했으므로, 스크립트 끝나기 전 아래 함수 적어줘야 함.
    $(function (){
        register_form.init();
    });
</script>



<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Legister</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Legister</h6>
        </div>
        <%-- 실제 만들어지는 영역 --%>
        <div class="card-body">
            <div id="container">
                <div class="container">
                    <div class="row content">
                        <div class="col-sm-12  text-left ">
                            <h1>Register Page</h1>
                            <form id="register_form" class="form-horizontal well">
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="id">ID:</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="id" class="form-control" id="id" placeholder="Enter id">
                                    </div>
                                    <div class="form-group">
                                        <%--  아이디 중복확인 버튼 추가  --%>
                                        <div class="col-sm-10">
                                            <span id="check_id" class="bg-danger"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="pwd">Password:</label>
                                        <div class="col-sm-10">
                                            <input type="password" name="pwd" class="form-control" id="pwd" placeholder="Enter password">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="lev">LEV:</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="lev" class="form-control" id="lev" placeholder="Enter lev">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <button id="register_btn" type="button" class="btn btn-default">Register</button>
                                        </div>
                                    </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <%--   card-body 끝 --%>
</div>
</div>
<!-- /.container-fluid -->

<!-- End of Main Content -->