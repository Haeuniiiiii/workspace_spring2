<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 전송 결과</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f0f0f0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .result-box {
        background: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        width: 400px;
        text-align: center;
    }
    .result-box h2 {
        margin-bottom: 20px;
    }
    .result-box p {
        font-size: 18px;
        color: #333;
        margin-bottom: 20px;
    }
    .result-box a {
        display: inline-block;
        padding: 10px 20px;
        background: #007BFF;
        color: white;
        text-decoration: none;
        border-radius: 5px;
    }
    .result-box a:hover {
        background: #0056b3;
    }
</style>
</head>
<body>
    <div class="result-box">
        <h2>메일 전송 결과</h2>
        <p>${msg}</p>
        <a href="/">다시 보내기</a>
    </div>
</body>
</html>
