package org.godn.contact_book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/SearchContact")
public class SearchContact extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String query = req.getParameter("query");
        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("userEmail");
        DAO dao = new DAO();
        List<Contact> filteredContacts = dao.searchContactsForUser(query, email);

        req.setAttribute("contacts", filteredContacts); // ✅ Set only filtered results
        req.setAttribute("searchMode", true); // ✅ Tell JSP not to fetch full list again
        req.getRequestDispatcher("Contact-Page.jsp").forward(req, resp);
    }
}
