<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 보내기 AJAX 버전</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #57575714;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .mail-form {
        background: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        width: 400px;
    }
    .mail-form h2 {
        margin-bottom: 20px;
        text-align: center;
    }
    .mail-form input, 
    .mail-form textarea {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }
    .mail-form button {
        width: 100%;
        padding: 12px;
        background: #007BFF;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }
    .mail-form button:hover {
        background: #0056b3;
    }
    #resultMessage {
        margin-top: 15px;
        text-align: center;
        font-weight: bold;
    }
</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
    <div class="mail-form">
        <h2>메일 보내기</h2>
        <form id="mailForm">
            보내는 사람: <input type="email" name="from" required><br>
            받는 사람: <input type="email" name="to" required><br>
            제목: <input type="text" name="subject" required><br>
            내용: <textarea name="text" rows="6" required></textarea><br>
            <button type="submit">메일 보내기</button>
        </form>
        <div id="resultMessage"></div>
    </div>

    <script>
    $(function(){
        $("#mailForm").on("submit", function(e){
            e.preventDefault();

            $.ajax({
                type: "POST",
                url: "/sendMail",
                data: $(this).serialize(),
                success: function(response){
                    // result.jsp가 아니라 컨트롤러에서 바로 메시지 반환하는 방식 권장
                    $("#resultMessage").html(response);
                },
                error: function(xhr, status, error){
                    $("#resultMessage").html("메일 발송 중 오류 발생: " + error);
                }
            });
        });
    });
    </script>
</body>
</html>
