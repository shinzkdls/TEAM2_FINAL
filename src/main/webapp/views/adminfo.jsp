    <%--jsp 작성을 위해 아래 3줄은 기입.--%>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%--JSTL : 통화 날짜를 표현하게 해주는 문법--%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    <%-- 나의 회원정보 수정하기 기능 --%>

    let adminfo_form = {
        init:function () { // 화면에 이벤트 처리
            // 버튼 클릭되면 send 함수가 실행된다
            $('#adminfo_btn').click(function () {
                adminfo_form.send();
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
            if( pwd == '' ){ // 공백이면 그만진행(수정 안되게)
                $('#pwd').focus();
                return;
            }
            if( lev == '' ){ // 공백이면 그만진행
                $('#lev').focus();
                return;
            }

            $('#adminfo_form').attr({
                'action':'/adminfoimpl', // maincontroller 로 보낸다.
                'method':'post'
            });
            $('#adminfo_form').submit(); // 수정한 pwd, name 모두 전송.
        }
    };
    $(function (){
        adminfo_form.init();
    });
</script>
        <!-- Begin Page Content -->
        <div class="container-fluid">

            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">adminfo</h1>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">나의 상세정보</h6>
                </div>
                <%-- 실제 만들어지는 영역 --%>
                <div class="card-body">
                    <div id="container">
                        <form id="adminfo_form" class="form-horizontal well">
                            <%-- 나의 정보 상세보기  --%>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="id">ID:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="id" class="form-control" id="id" value="${adminfo.id}" readonly>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="pwd">Password:</label>
                                    <div class="col-sm-10">
                                        <input type="password" name="pwd" class="form-control" id="pwd">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="lev">Lev:</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="lev" class="form-control" id="lev" value="${adminfo.lev}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button id="adminfo_btn" type="button" class="btn btn-default">수정하기</button>
                                    </div>
                                </div>
                        </form>
                    </div>

                </div>
                <%--   card-body 끝 --%>
                </div>
            </div>
            <!-- /.container-fluid -->

            <!-- End of Main Content -->
