
<%@ page import="org.godn.contact_book.Contact" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="org.godn.contact_book.DAO" %><%--
  Created by IntelliJ IDEA.
  User: Gaurav Urmaliya
  Date: 15-05-2025
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Contacts</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap');
        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: Montserrat;
        }

        html, body{
            height: 100%;
            width: 100%;
        }
        #container{
            height: 125%;
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            padding-top: 20px;
            animation-delay: -7s;
            animation: fadeIn 5s backwards;
        }
        /*.bgImg{*/
        /*    position: absolute;*/
        /*    top: 0; !* Cover from top *!*/
        /*    left: 0;*/
        /*    width: 100%;*/
        /*    height: 100%; !* Makes it take full height *!*/
        /*    background: url("https://images.unsplash.com/photo-1530541263627-4314dd7a44c2?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDR8fENvbnRhY3R8ZW58MHx8MHx8fDA%3D") top;*/
        /*    background-size: cover;*/
        /*    filter: blur(5px);*/
        /*    z-index: -1;*/
        /*}*/
        body::before {
            content: "";
            position: fixed; /* Ensures it covers the viewport */
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh; /* Covers the full viewport */
            background: url("https://images.unsplash.com/photo-1634562876572-5abe57afcceb?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDN8fENvbnRhY3R8ZW58MHx8MHx8fDA%3D") no-repeat top center/cover;
            filter: blur(5px);
            z-index: -1;
        }
        .logout-container {
            position: absolute;
            top: 20px;
            right: 30px;
        }

        .logout-container button {
            background-color: #f44336;
            color: white;
            padding: 8px 16px;
            border: black solid 2px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }
        @keyframes fadeIn {
            0% {
                opacity: 0;
                display: none;
            }
            90% {
                opacity: 1;
            }
            100% {
                opacity: 1;
            }
        }
        .header {
            text-align: center;
            font-size: 30px;
            margin-top: 20px;
        }

        .greeting {
            text-align: center;
            font-size: 20px;
            margin: 10px 0;
        }

        .table-container {
            background-color: white;
            width: 90%;
            overflow-x: auto;
            border: 1px solid black;
            border-radius: 10px 10px 0 0;
            margin-top: 10px;
        }

        .table-scroll {
            height: 100%;
            overflow-y: auto;
            display: block;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 600px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
            white-space: nowrap;
        }
        tr{
            height: 40px;
        }

        thead {
            background-color: #f2f2f2;
            position: sticky;
            top: 0;
        }

        .action-buttons button {
            margin-right: 5px;
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            color: #fff;
        }

        .edit-btn {
            background-color: #4CAF50;
            border-radius: 4px;
            cursor: pointer;
        }

        .delete-btn {
            background-color: #f44336;
            border-radius: 4px;
            cursor: pointer;
        }
        .actions {
            text-align: center;
            margin: 20px 0;
        }
        .btn-new {
            padding: 9px 15px;
            background-color: #0d6efd;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            height: 5vh;
        }
        .search-bar form {
            display: flex;
            justify-content: center;
            gap: 10px;
            align-items: center;
        }

        .search-bar input[type="text"] {
            padding: 16px 20px;      /* Increase padding for height */
            width: 77.5vw;
            border: 1px solid #ccc;
            border-radius: 5px;
            height: 5vh;

        }

        .search-bar button {
            padding: 8px 12px;
            background-color: #0d6efd;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            height: 5vh;
        }
        th.action_header, td.action_cell{
            text-align: center;
            width: 150px;
        }
        @media (max-width: 768px) {
            #container {
                width: 100%;
                height: 100%;
            }

            .header {
                font-size: 1.6rem;
            }

            table {
                font-size: 0.9rem;
            }

            .search-bar {
                display: flex;
                justify-content: center;
                gap: 10px;
                align-items: center;
                align-self: center;
            }

            .search-bar input[type="text"] {
                padding: 16px 20px;      /* Increase padding for height */
                width: 45.5vw;
                border: 1px solid #ccc;
                border-radius: 5px;
                height: 35px;

            }

            .search-bar button {
                padding: 8px 12px;
                background-color: #0d6efd;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                height: 35px;
            }
            .btn-new {
                font-size: 0.9rem;
            }

            th, td {
                padding: 8px;
            }

            .logout-container {
                top: 15px;
                right: 15px;
            }
        }

        @media (max-width: 480px) {
            #container {
                width: 100%;
                height: 100%;
            }

            .header {
                font-size: 1.6rem;
            }

            table {
                font-size: 0.9rem;
            }

            .search-bar {
                display: flex;
                justify-content: center;
                gap: 10px;
                align-items: center;
                align-self: center;
            }

            .search-bar input[type="text"] {
                padding: 16px 20px;      /* Increase padding for height */
                width: 45.5vw;
                border: 1px solid #ccc;
                border-radius: 5px;
                height: 35px;

            }

            .search-bar button {
                padding: 8px 12px;
                background-color: #0d6efd;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                height: 35px;
            }

            th, td {
                padding: 8px;
            }

            .logout-container {
                top: 15px;
                right: 15px;
            }
            .header {
                font-size: 1.4rem;
            }

            th, td {
                font-size: 0.8rem;
                padding: 6px;
            }

            .logout-container button {
                padding: 6px 12px;
            }
        }

    </style>
</head>
<body>
<div id="container">
    <div class="header">
        <h1>Contact Book</h1>
    </div>
    <div class="logout-container">
        <form action="Logout" method="post">
            <button type="submit">Logout</button>
        </form>
    </div>
    <div class="greeting">
        <h2>Hello, <%= session.getAttribute("user") %>!</h2>
    </div>
    <div class="search-bar">
        <form action="SearchContact" method="get">
            <div class="actions">
                <a href="addContact.jsp" class="btn-new">➕NEW</a>
            </div>
            <input type="text" name="query" placeholder="Search contacts...">
            <button type="submit">Search</button>
        </form>
    </div>
    <div class="table-container">
        <div class="table-scroll">
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Number</th>
                        <th class="action_header">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                        if(session.getAttribute("user") == null){
                            response.sendRedirect("login.jsp");
                        }
                        String userEmail = (String) session.getAttribute("userEmail");
                        List<Contact> contacts = (List<Contact>) request.getAttribute("contacts");
                        Boolean searchMode = (Boolean) request.getAttribute("searchMode");
                        if (contacts == null && session.getAttribute("userEmail") != null && (searchMode == null || !searchMode)) {
                            DAO dao = new DAO();
                            contacts = dao.getContactsForUser((String) session.getAttribute("userEmail"));
                        }
                        int size = 0;
                        if(contacts != null){
                            size = contacts.size();
                        }
                        if(size < 15){
                            for (int i = 0; i < 15; i++) {
                                if(i < size){
                                    Contact contact = contacts.get(i);
                    %>
                    <tr>
                        <td><%= contact.getContactName() %></td>
                        <td><%= contact.getEmail() %></td>
                        <td><%= contact.getNumber() %></td>
                        <td class="action_cell">
                            <button class="edit-btn" onclick="editUser(this)">Edit</button>
                            <button class="delete-btn" onclick="confirmDelete(this)">Delete</button>
                        </td>
                    </tr>
                    <%
                                }else{
                    %>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td class="action_cell"></td>
                    </tr>
                    <%
                                }
                            }
                        }else{
                            for(int i = 0; i < size; i++){
                                Contact contact = contacts.get(i);
                    %>
                    <tr>
                        <td><%= contact.getContactName() %></td>
                        <td><%= contact.getEmail() %></td>
                        <td><%= contact.getNumber() %></td>
                        <td class="action_cell">
                            <button class="edit-btn" onclick="editUser(this)">Edit</button>
                            <button class="delete-btn" onclick="confirmDelete(this)">Delete</button>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

</div>
<script> // Donno nothing about JS just that it asks for a confirmation message

    function editUser(button) {
        const row = button.closest("tr");
        const name = row.cells[0].innerText;
        const email = row.cells[1].innerText;
        const number = row.cells[2].innerText;
        window.location.href = "editContact.jsp?number=" + encodeURIComponent(number) + "&Cemail=" + encodeURIComponent(email) + "&Cname=" + encodeURIComponent(name);
    }

    function confirmDelete(button) {
        if (confirm("Are you sure you want to delete this row?")) {
            const row = button.closest("tr");
            const tableBody = row.parentElement;
            row.remove();
            const newRow = document.createElement("tr");
            newRow.innerHTML = `
            <td></td>
            <td></td>
            <td></td>
            <td>
            </td>
        `;
            tableBody.appendChild(newRow);
            const number = row.cells[2].innerText;
            window.location.href = "DeleteContact?number=" + encodeURIComponent(number);
        }

    }
</script>
</body>
</html>
