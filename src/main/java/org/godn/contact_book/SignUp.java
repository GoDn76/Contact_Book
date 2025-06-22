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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/Signup")
public class SignUp extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String pass = req.getParameter("pass");
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        pass = hashPassword(pass);
        DAO daoSignUp = new DAO();
        if (daoSignUp.emailExists(email)) {
            req.setAttribute("errorMsg", "Email already exists!");
            req.getRequestDispatcher("signUp.jsp").forward(req, resp);
        }else{
            HttpSession session = req.getSession();
            SignUp_Info Info = new SignUp_Info();
            System.out.println();
            Info.firstName = firstName;
            Info.lastName = lastName;
            Info.email = email;
            Info.password = pass;
            Info.dateAdded = now.format(formatter);
            if(daoSignUp.signUp(Info)) {
                session.setAttribute("user", Info.firstName);
                resp.sendRedirect("Contact-Page.jsp");
            }
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