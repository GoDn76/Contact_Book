<%--
  Created by IntelliJ IDEA.
  User: Gaurav Urmaliya
  Date: 14-05-2025
  Time: 01:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap');

        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: "Montserrat", sans-serif;
        }

        html, body {
            width: 100%;
            height: 100%;
        }

        #container {
            width: 100%;
            height: 100%;
            background: url("https://images.unsplash.com/photo-1542435503-956c469947f6?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
            background-size: cover;
            flex-direction: column;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        #content {
            width: 60%;
            height: 70%;
            box-shadow: 0 0 20px rgba(0,0,0,0.7);
            display: grid;
            grid-template-columns: 65% 35%;
            border-radius: 6px;
            overflow: hidden;
        }

        #left-panel {
            opacity: 0.35;
            background-color: #cce0f4;
            backdrop-filter: blur(5px);
            grid-column: 1/2;
        }

        #tag {
            padding-top: 50px;
            padding-left: 40px;
            font-size: 40px;
            line-height: 6vh;
            color: black;
            text-shadow: 2px 2px 5px rgba(0,0,0,0.5);
        }

        #tag2 {
            padding-left: 40px;
            font-size: 15px;
            color: black;
            text-shadow: 2px 2px 5px rgba(0,0,0,0.5);
        }

        #login-panel {
            grid-column: 2;
            background-color: white;
            overflow: hidden;
            display: grid;
        }

        #login-box {
            padding: 13%;
            padding-inline: 10%;
        }

        #avatar {
            width: 90px;
            height: 90px;
            background-color: grey;
            border-radius: 50%;
            margin: 10px auto 40px;
            overflow: hidden;
            background-image: url("resources/avatar.png");
            background-size: cover;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        input {
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            padding: 12px;
            background-color: #0d6efd;
            color: white;
            border: none;
            margin-top: 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        .signup-text {
            font-size: 15px;
            text-align: center;
            margin-top: 10px;
        }

        .forgot {
            font-size: 15px;
            text-align: center;
            margin-top: 15px;
        }

        .signup-text a,
        .forgot a {
            color: #0d6efd;
            text-decoration: none;
        }

        /* Responsive styles */
        @media (max-width: 768px) {
            #content {
                width: 90%;
                height: auto;
                grid-template-columns: 1fr;
                grid-template-rows: auto auto;
                border-radius: 20px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.6);
                overflow: hidden;
            }

            #left-panel {
                display: none;
            }

            #login-panel {
                grid-column: 1 / -1;
                padding: 30px 20px;
            }

            #login-box {
                padding: 0;
            }

            input, button {
                font-size: 16px;
                padding: 14px;
            }

            .signup-text, .forgot {
                font-size: 14px;
            }
        }

        @media (max-width: 480px) {
            #tag {
                font-size: 30px;
                padding-left: 20px;
                padding-top: 30px;
            }

            #tag2 {
                font-size: 13px;
                padding-left: 20px;
            }

            #avatar {
                width: 70px;
                height: 70px;
                margin-bottom: 30px;
            }

            #content {
                border-radius: 16px;
                box-shadow: 0 0 16px rgba(0, 0, 0, 0.5);
            }
        }

        @media (max-width: 400px) {
            #container {
                padding: 20px 10px;
            }

            #content {
                width: 100%;
                box-shadow: 0 0 12px rgba(0, 0, 0, 0.4);
                border-radius: 12px;
            }

            #avatar {
                width: 60px;
                height: 60px;
                margin-bottom: 20px;
            }

            input {
                padding: 10px;
                font-size: 14px;
            }

            button {
                padding: 10px;
                font-size: 14px;
            }

            .signup-text,
            .forgot {
                font-size: 13px;
            }

            #login-box {
                padding-inline: 5%;
            }
        }
    </style>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap" rel="stylesheet">
    <title>Contact Book</title>
</head>
<body>
    <div id="container">
        <% String error = (String) request.getAttribute("errorMsg");
            if (error != null) { %>
        <div id="error"><p
                style="padding: 10px 20px;
                margin-bottom: 15px;
                border: 2px dashed red;
                background-color: rgba(255, 0, 0, 0.15);
                color: red;
                text-align: center;
                font-weight: 500;
                border-radius: 5px;
                animation: fadeIn 0.5s ease-in-out;">
            <%= error %>
        </p></div>
        <% } %>
        <div id="content">

            <div id="left-panel">
                <h1 id="tag">Built with Servlets,<br>Designed for You.</h1>
                <h4 id="tag2">Smart. Simple. Scalable.</h4>
            </div>
            <div id="login-panel">
                <div id="login-box">
                    <div id="avatar"></div>
                    <form action="Login" method="post">
                            <p class="signup-text">Need an Account? <a href="signUp.jsp">Sign Up</a></p>
                            <input type="email" placeholder="Email" name="email" required />
                            <input type="password" placeholder="Password" name="pass" required />
                            <button type="submit">Sign in</button>
                    </form>
                </div>
                <p class="forgot"><a href="#">Forgot Your Password?</a></p>
            </div>
        </div>
    </div>
</body>
</html>
