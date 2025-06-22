package org.godn.contact_book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import java.io.IOException;

@WebServlet("/Login")
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String pass = req.getParameter("pass");
        pass = hashPassword(pass);
        DAO daoLogin = new DAO();
        if(daoLogin.validateUser(email, pass)){
            HttpSession session = req.getSession();
            String firstName = daoLogin.getInfo(email, pass).firstName;
            session.setAttribute("user", firstName);
            session.setAttribute("userEmail", email);
            session.setAttribute("totalRows", daoLogin.getTotalRows(email));
            resp.sendRedirect("Contact-Page.jsp");
        }else{
//            resp.sendRedirect("login.jsp");
            req.setAttribute("errorMsg", "Invalid email or password!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
    public static String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256"); // Or bcrypt for stronger security
            byte[] bytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : bytes) {
                sb.append(String.format("%02x", b)); // Convert byte to hex
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }
}