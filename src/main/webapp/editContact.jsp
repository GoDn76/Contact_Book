<%@ page import="org.godn.contact_book.DAO" %>
<%@ page import="org.godn.contact_book.Contact" %><%--
  Created by IntelliJ IDEA.
  User: Gaurav Urmaliya
  Date: 25-05-2025
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add a Contact</title>
</head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap');

    *{
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        font-family: "Montserrat"

    }
    html, body{
        width: 100%;
        height: 100%;
    }
    #container{
        width: 100%;
        height: 100%;
        background: url("https://images.unsplash.com/photo-1639667172498-835ca18d6852?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
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

    #content{
        width: 60%;
        height: 70%;
        /*background-color: red;*/
        box-shadow: 0 0 20px rgba(0,0,0,0.7);
        display: grid;
        border-radius: 6px;
        overflow: hidden;
    }
    #details{
        background: rgba(255, 255, 255, 0.2);
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.15);
        overflow: hidden;
        display: grid;
    }
    #detail-box{
        padding: 1%;
        padding-inline: 7%;
    }
    #detail-title{
        color: whitesmoke;
        padding: 1%;
        text-align: center;
        font-size: 3.2rem;
        font-weight: bold;

    }
    #avatar{
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
    input[type="number"]::-webkit-inner-spin-button,
    input[type="number"]::-webkit-outer-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }
    @media (max-width: 780px) {
        #content{
            width: 100%;
            height: 100%;
            /*background-color: red;*/
            box-shadow: 0 0 20px rgba(0,0,0,0.7);
            display: grid;
            border-radius: 6px;
            overflow: hidden;
        }
    }
</style>
<body>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if(session.getAttribute("user") == null){
        response.sendRedirect("Contact-error.jsp");
    }
%>
<div id="container">
        <div id="content">
            <div id="details">
                <div id="detail-box">
                    <h1 id="detail-title">Edit Contact Details Here</h1>
                    <div id="avatar"></div>
                    <%
                        String userEmail = (String) session.getAttribute("userEmail");
                        if(userEmail != null){
                            DAO dao = new DAO();
                        }
                        String name = request.getParameter("Cname") != null ? request.getParameter("Cname") : "";
                        long num = request.getParameter("number") != null ? Long.parseLong(request.getParameter("number")) : 0;
                        session.setAttribute("oldNum", num);
                        String email = request.getParameter("Cemail") != null ? request.getParameter("Cemail") : "";
                    %>
                    <form id="contactForm" action="EditContact" method="get">
                        <input type="text" placeholder="Contact Name" name="ContactName" value="<%=name%>" required/>
                        <input type="number" placeholder="Contact Number" name="ContactNumber" value="<%=num%>" required/>
                        <input type="email" placeholder="Contact Email" name="ContactEmail" value="<%=email%>"/>
                        <button type="submit" id="addContactBtn">Save Details</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<script>
    function disableButton() {
        const form = document.getElementById("contactForm");

        // Check if required fields are filled
        if (!form.checkValidity()) {
            alert("Please fill all required fields before submitting.");
            return; // Prevent submission
        }
        document.getElementById("addContactBtn").disabled = true;
        document.getElementById("contactForm").submit();
    }
</script>
