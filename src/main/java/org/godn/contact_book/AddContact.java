package org.godn.contact_book;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/AddContact")
public class AddContact extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(session.getAttribute("userEmail") == null) {
            resp.sendRedirect("noUserError.jsp");
        }else{
            Contact contact;
            String contactNum = req.getParameter("ContactNumber");
            if(req.getParameter("ContactEmail") != null) {
                contact = new Contact(req.getParameter("ContactName"), req.getParameter("ContactEmail"), Long.parseLong(contactNum));
            }else{
                contact = new Contact(req.getParameter("ContactName"), null, Long.parseLong(contactNum));
            }

            DAO dao = new DAO();
            if(dao.numberExits(contact.getNumber(), session.getAttribute("userEmail").toString())) {
                dao.insertContact(contact, session.getAttribute("userEmail").toString());
                resp.sendRedirect("Contact-Page.jsp");
            }else{
                session.setAttribute("errorMsg", "Contact Saving Failed due to presence of Same Contact Number please Check for Duplicate Numbers");
                resp.sendRedirect("Contact-error.jsp");
            }

        }


    }
}
