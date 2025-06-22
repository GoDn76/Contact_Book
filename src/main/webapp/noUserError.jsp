<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login Error</title>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f8f8f8;
            text-align: center;
        }

        .error-container {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        h1 {
            font-size: 2.5rem;
            color: #d9534f;
        }

        p {
            font-size: 1.2rem;
            margin-top: 10px;
        }

        .login-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background: #0d6efd;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 1rem;
        }

        .login-button:hover {
            background: #0a58ca;
        }
    </style>
</head>
<body>
<div class="error-container">
    <h1>Login Error</h1>
    <p>There's something wrong with your login credentials.</p>
    <p>Please try logging in again.</p>
    <a href="login.jsp" class="login-button">Go to Login</a>
</div>
</body>
</html>
