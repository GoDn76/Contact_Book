package org.godn.contact_book;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet("/DeleteContact")
public class DeleteContact extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        if(session.getAttribute("user") == null){
            resp.sendRedirect("noUserError.jsp");
            return;
        }
        String number = req.getParameter("number");
        RequestDispatcher rd;
        if (number != null) {
            DAO dao = new DAO();
            try {
                dao.deleteContact(Long.parseLong(number), session.getAttribute("userEmail").toString());
                resp.sendRedirect("Contact-Page.jsp");
            }catch (Exception e) {
                session.setAttribute("errorMsg", "Contact Deletion Failed due to : " + e.getMessage());
                resp.sendRedirect("Contact-error.jsp");
            }
        }
    }
}
