<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Main</title>
            <link rel="shortcut icon" type="image/x-icon" href="/resource/duck.ico">
            <script src="https://code.jquery.com/jquery-3.6.1.min.js"
                integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
                </script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
                crossorigin="anonymous"></script>
            <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <style>
                * {
                    box-sizing: border-box;
                }
                .main{
                    
                }
                .loginBox {
                    position: absolute;
                    width: 400px;
                    height: 300px;
                    left: 50%;
                    top: 40px;
                    transform: translate(-50%);
                }

                td>button {
                    width: 100%;
                    height: 100%;
                }

                th {
                    padding: 10px;
                }
                #main{
                    width: 500px;
                }
            </style>
        </head>

        <body>
            <script>
                console.log("${loginId}");
                console.log("${loginId != null}");
            </script>
            <c:choose>
                <c:when test="${loginId != null}">
                    <div class="container">
                        <div class="row justify-content-center">
                            <table id="main" class="text-center">
                                <tr>
                                    <th colspan=4 style="text-align: center;">
                                        <span>${loginId}??? ???????????????.</span>
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="/freeBoard.board?cpage=1">
                                            <button id="mypage" class="btn btn-outline-primary">???????????????</button>
                                        </a>
                                    <td>
                                        <form method="post" action="/mypage.member">
                                            <button id="mypage" class="btn btn-outline-primary">???????????????</button>
                                        </form>
                                    <td>
                                        <form method="post" action="/logout.member">
                                            <button id="logout" class="btn btn-outline-primary">????????????</button>
                                        </form>
                                    <td>
                                        <form id="memberoutFrm" method="post" action="/memberout.member">
                                            <button id="memberout" class="btn btn-outline-primary">?????? ??????</button>
                                        </form>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <script>
                        $("#memberoutFrm").on("submit", function () {
                            let returnSubmit = false;
                            const swalWithBootstrapButtons = Swal.mixin({
                                customClass: {
                                    confirmButton: 'btn btn-success',
                                    cancelButton: 'btn btn-danger'
                                },
                                buttonsStyling: false
                            })

                            swalWithBootstrapButtons.fire({
                                title: 'Are you sure?',
                                text: "????????? ??? ????????????!",
                                icon: 'warning',
                                showCancelButton: true,
                                confirmButtonText: '?????????',
                                cancelButtonText: '??????',
                                reverseButtons: true
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    swalWithBootstrapButtons.fire(
                                        'Deleted!',
                                        'Your account has been deleted.',
                                        'success'
                                    );
                                    returnSubmit = true;
                                } else if (
                                    /* Read more about handling dismissals below */
                                    result.dismiss === Swal.DismissReason.cancel
                                ) {
                                    swalWithBootstrapButtons.fire(
                                        'Cancelled',
                                        'Your imaginary account is safe :)',
                                        'error'
                                    )
                                }
                            })
                            return returnSubmit;
                        });
                    </script>
                </c:when>

                <c:otherwise>
                    <div class="loginBox">
                        <div class="container">
                            <div class="row"><a href='/freeBoard.board?cpage=1'>
                                <button id="mypage" class="btn btn-outline-primary">???????????????</button>
                            </a></div>
                            <div id="loginHeader" class="row text-center">
                                <span class="h1 fw-bold">Login Box</span>
                            </div>
                            <form method="post" action="login.member" class="justify-content-center">
                                <div id="loginID" class="row input-group m-1 justify-content-center">
                                    <span class="input-group-text col-3" id="basic-addon3">ID</span>
                                    <input type="text" class="form-control col-9" id="id" name="id"
                                        aria-describedby="basic-addon3">
                                </div>
                                <div id="loginPW" class="row input-group m-1 justify-content-center">
                                    <span class="input-group-text col-3" id="basic-addon3">Password</span>
                                    <input type="password" class="form-control col-9" id="pw" name="pw"
                                        aria-describedby="basic-addon3">
                                </div>
                                <div class="text-center mt-3">
                                    <input class="form-check-input" type="checkbox" value="" name="checkRemeberId"
                                        aria-label="Radio button for following text input">
                                    <span>Remember ID</span>
                                </div>
                                <div class="row justify-content-center pt-2">
                                    <button id="loginBtn" class="col-3 btn btn-primary mx-2"
                                        type="submit">Login</button>
                                    <a class="col-3 btn btn-primary mx-2" href="member/signup.jsp" role="button">Sign
                                        Up</a>
                                </div>
                            </form>
                            <script>
                                $("#loginBtn").on("loginSuccess", function () {
                                    console.log("login success!");
                                    $("#id").val("");
                                    $("#pw").val("");
                                    Swal.fire('Login Success!!');
                                })

                                $("#loginBtn").on("loginFail", function () {
                                    console.log("login fail!");
                                    $("#id").val("");
                                    $("#pw").val("");
                                    Swal.fire('Login Fail!!');
                                })
                            </script>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </body>

        </html>