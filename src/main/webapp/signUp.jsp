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
            background-image: url("https://images.unsplash.com/photo-1712293912791-e875c1515384?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGNvbnRhY3R8ZW58MHx8MHx8fDA%3D");
            background-size: cover;
            background-position: center;
            flex-direction: column;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #content {
            width: 60%;
            height: 70%;
            box-shadow: 0 0 20px rgba(0,0,0,0.7);
            display: grid;
            grid-template-columns: 55% 45%;
            border-radius: 8px;
            overflow: hidden;
            background-color: white;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
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
            font-size: 35px;
            line-height: 5vh;
        }

        #tag2 {
            padding-left: 40px;
            font-size: 13px;
        }

        #login-panel {
            grid-column: 2;
            background-color: white;
            overflow: hidden;
            display: grid;
        }

        #login-box {
            padding: 13%;
            padding-top: 5%;
        }

        #login-title {
            margin: 50px auto 0px;
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

        .name-fields {
            display: flex;
            gap: 10px;
            margin: 10px 0;
        }

        .name-fields input {
            flex: 1;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        form input,
        .name-fields input {
            box-sizing: border-box;
            width: 100%;
        }

        .signup-text {
            font-size: 15px;
            text-align: center;
            margin-top: 10px;
        }

        .signup-text a {
            color: #0d6efd;
            text-decoration: none;
        }

        /* Responsive styles */
        @media (max-width: 768px) {
            #content {
                width: 90%;
                height: auto;
                grid-template-columns: 1fr;
                border-radius: 16px;
                box-shadow: 0 0 18px rgba(0,0,0,0.5);
            }

            #left-panel {
                display: none;
            }

            #login-panel {
                grid-column: 1 / -1;
                padding: 30px 20px;
            }

            #login-box {
                padding: 20px;
            }

            .name-fields {
                flex-direction: column;
                gap: 0;
            }

            input, button {
                font-size: 16px;
                padding: 14px;
            }

            .signup-text {
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

            #content {
                border-radius: 14px;
                box-shadow: 0 0 16px rgba(0, 0, 0, 0.4);
            }

            .signup-text {
                font-size: 13px;
            }
        }

        @media (max-width: 400px) {
            #container {
                padding: 20px 10px;
            }

            #content {
                width: 100%;
                border-radius: 10px;
                box-shadow: 0 0 12px rgba(0, 0, 0, 0.3);
            }

            #login-box {
                padding: 10px;
            }

            input, button {
                padding: 10px;
                font-size: 14px;
            }

            .signup-text {
                font-size: 12px;
            }

            .name-fields {
                flex-direction: column;
            }
        }
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
            background-image: url("https://images.unsplash.com/photo-1712293912791-e875c1515384?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGNvbnRhY3R8ZW58MHx8MHx8fDA%3D");
            background-size: cover;
            background-position: center;
            flex-direction: column;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #content {
            width: 60%;
            height: 70%;
            box-shadow: 0 0 20px rgba(0,0,0,0.7);
            display: grid;
            grid-template-columns: 55% 45%;
            border-radius: 8px;
            overflow: hidden;
            background-color: white;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
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
            font-size: 35px;
            line-height: 5vh;
        }

        #tag2 {
            padding-left: 40px;
            font-size: 13px;
        }

        #login-panel {
            grid-column: 2;
            background-color: white;
            overflow: hidden;
            display: grid;
        }

        #login-box {
            padding: 13%;
            padding-top: 5%;
        }

        #login-title {
            margin: 50px auto 0px;
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

        .name-fields {
            display: flex;
            gap: 10px;
            margin: 10px 0;
        }

        .name-fields input {
            flex: 1;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        form input,
        .name-fields input {
            box-sizing: border-box;
            width: 100%;
        }

        .signup-text {
            font-size: 15px;
            text-align: center;
            margin-top: 10px;
        }

        .signup-text a {
            color: #0d6efd;
            text-decoration: none;
        }

        /* Responsive styles */
        @media (max-width: 768px) {
            #content {
                width: 90%;
                height: auto;
                grid-template-columns: 1fr;
                border-radius: 16px;
                box-shadow: 0 0 18px rgba(0,0,0,0.5);
            }

            #left-panel {
                display: none;
            }

            #login-panel {
                grid-column: 1 / -1;
                padding: 30px 20px;
            }

            #login-box {
                padding: 20px;
            }

            .name-fields {
                flex-direction: column;
                gap: 0;
            }

            input, button {
                font-size: 16px;
                padding: 14px;
            }

            .signup-text {
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

            #content {
                border-radius: 14px;
                box-shadow: 0 0 16px rgba(0, 0, 0, 0.4);
            }

            .signup-text {
                font-size: 13px;
            }
        }

        @media (max-width: 400px) {
            #container {
                padding: 20px 10px;
            }

            #content {
                width: 100%;
                border-radius: 10px;
                box-shadow: 0 0 12px rgba(0, 0, 0, 0.3);
            }

            #login-box {
                padding: 10px;
            }

            input, button {
                padding: 10px;
                font-size: 14px;
            }

            .signup-text {
                font-size: 12px;
            }

            .name-fields {
                flex-direction: column;
            }
        }
    </style>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <title>Sign Up</title>
</head>
<body>
<div id="container">
    <% String error = (String) request.getAttribute("errorMsg");
        if (error != null) { %>
    <div id="error">
        <p
            style="padding: 10px 20px;
                margin-bottom: 15px;
                border: 2px dashed white;
                background-color: rgba(255, 0, 0, 0.15);
                color: white;
                text-align: center;
                font-weight: 500;
                border-radius: 5px;
                animation: fadeIn 0.5s ease-in-out;">
        <%= error %>
        </p>
    </div>
    <% } %>
    <div id="content">
        <div class="error">

        </div>
        <div id="left-panel">
            <h1 id="tag">Built with Servlets,<br>Designed for You.</h1>
            <h4 id="tag2">Smart. Simple. Scalable.</h4>
        </div>
        <div id="login-panel">
            <h1 id="login-title">Sign Up</h1>
            <div id="login-box">
                <form method="POST" action="Signup" onsubmit="return validateForm();">
                    <p class="signup-text">Already have an Account? <a href="login.jsp">Login</a></p>
                    <div class="name-fields">
                        <input type="text" placeholder="First Name" name="firstName" required />
                        <input type="text" placeholder="Last Name" name="lastName" required />
                    </div>
                    <input type="email" placeholder="Email" name="email" id="email" required />
                    <input type="password" placeholder="Password" name="pass" id="password" required />
                    <input type="password" placeholder="Confirm Password" name="conf_pass" id="confirmPassword" required />
                    <button type="submit">Sign in</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    function validateForm() {
        const password = document.getElementById("password").value;
        const confirmPassword = document.getElementById("confirmPassword").value;
        if (password !== confirmPassword) {
            alert("Passwords do not match!");
            return false; // Prevent form submission
        }
        if(password.length < 8) {
            alert("Password must be at least 8 characters");
            return false;
        }


        return true; // Allow form submission
    }
</script>
</html>

