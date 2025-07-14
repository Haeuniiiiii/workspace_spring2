<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 보내기 폼</title>
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
</style>
</head>
<body>
    <form action="/sendMail" method="post" class="mail-form">
        <h2>메일 보내기</h2>
        보내는 사람: <input type="email" name="from" placeholder="보내는 이메일 주소 입력" required><br>
        받는 사람: <input type="email" name="to" placeholder="받는 이메일 주소 입력" required><br>
        제목: <input type="text" name="subject" placeholder="메일 제목 입력" required><br>
        내용: <textarea name="text" rows="6" placeholder="메일 내용 입력" required></textarea><br>
        <button type="submit">메일 보내기</button>
    </form>
</body>
</html>
