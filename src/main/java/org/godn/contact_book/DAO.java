package org.godn.contact_book;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

class Login_Name{
    public String firstName;
    public String lastName;
}

class SignUp_Info{
    public String firstName;
    public String lastName;
    public String email;
    public String password;
    public String dateAdded;
}

public class DAO {

    private static String URL = null;
    private static String userName = null;
    private static String pass = null;

    public DAO() {
        Properties properties = new Properties();
        try (InputStream input = getClass().getClassLoader().getResourceAsStream("config.properties")) {
            if (input == null) {
                System.out.println("Sorry, unable to find config.properties");
                return;
            }
            properties.load(input);
            URL = properties.getProperty("db.url");
            userName = properties.getProperty("db.username");
            pass = properties.getProperty("db.password");
        } catch (Exception e) {
            throw new RuntimeException("Failed to load database configuration", e);
        }
    }
    //    private static final String driver = "org.postgresql.Driver";
    public boolean validateUser(String user, String passw) {
        Connection con = null;
        PreparedStatement pst = null;


        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        try {
            con = DriverManager.getConnection(URL, userName, pass);
            String query = "SELECT * FROM public.\"Login\" WHERE \"EMAIL\"=? AND \"Pass\"=?";

            pst = con.prepareStatement(query);
            pst.setString(1, user);
            pst.setString(2, passw);

            ResultSet rs = pst.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }
    public Login_Name getInfo(String email, String passw) {
        Login_Name l = new Login_Name();
        Connection con = null;
        PreparedStatement pst = null;

        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        try {
            con = DriverManager.getConnection(URL, userName, pass);

            String query = "SELECT * FROM public.\"Login\" WHERE \"EMAIL\"=? AND \"Pass\"=?";

            pst = con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, passw);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                l.firstName = rs.getString("First Name");
                l.lastName = rs.getString("Last Name");
            }
            return l;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
    public int getTotalRows(String email){
//        SELECT COUNT(*) FROM Public."Contacts" WHERE "User Email" = (SELECT "EMAIL" FROM Public."Login" WHERE "EMAIL" = 'Admin@gmail.com')
        Connection con = null;
        PreparedStatement pst = null;
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        try {
            con = DriverManager.getConnection(URL, userName, pass);

            String query = "SELECT COUNT(*) FROM Public.\"Contacts\" WHERE \"User Email\" = (SELECT \"EMAIL\" FROM Public.\"Login\" WHERE \"EMAIL\" = ?)";

            pst = con.prepareStatement(query);
            pst.setString(1, email);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return 0;
    }

    public boolean emailExists(String email) {
        Connection con = null;
        PreparedStatement pst = null;


        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        try {
            con = DriverManager.getConnection(URL, userName, pass);

            String query = "SELECT * FROM public.\"Login\" WHERE \"EMAIL\"=?";

            pst = con.prepareStatement(query);
            pst.setString(1, email);

            ResultSet rs = pst.executeQuery();
            return rs.next();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }
    public boolean signUp(SignUp_Info signUp) {
        Connection con = null;
        PreparedStatement pst = null;
        try{
            con = DriverManager.getConnection(URL, userName, pass);
            String in = "INSERT INTO public.\"Login\" (\"Pass\", \"EMAIL\", \"DATE ADDED\", \"First Name\", \"Last Name\") VALUES (?, ?, ?, ?, ?)";

            pst = con.prepareStatement(in);

            pst.setString(1, signUp.password);
            pst.setString(2, signUp.email);
            pst.setString(3, signUp.dateAdded);
            pst.setString(4, signUp.firstName);
            pst.setString(5, signUp.lastName);

            int rs = pst.executeUpdate();

            return rs > 0;

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

//    private static void fetchName(){
//        Connection con = null;
//        Statement pst = null;
//        ResultSet rs= null;
//        try{
//            con = DriverManager.getConnection(URL, userName, pass);
//            String query = "SELECT * from Public.emp";
//            pst = con.createStatement();
//            rs = pst.executeQuery(query);
//            while(rs.next()) {
//                System.out.println(rs.getString("ENAME"));
//            }
//        }catch (SQLException e){
//            e.printStackTrace();
//        }finally {
//            try {
//                if (rs != null) rs.close();
//                if (pst != null) pst.close();
//                if (con != null) con.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//    }
    public List<Contact> getContactsForUser(String userEmail) {
        List<Contact> contacts = new ArrayList<>();
        String sql = "SELECT \"Contact Name \", \"Contact Email\", \"Contact Number\" FROM public.\"Contacts\" WHERE \"User Email\" = ?";
        Connection con = null;
        PreparedStatement pst = null;
        try{
            con = DriverManager.getConnection(URL, userName, pass);

            pst = con.prepareStatement(sql);

            pst.setString(1, userEmail);
            try(ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    contacts.add(new Contact(rs.getString("Contact Name "), rs.getString("Contact Email"), rs.getLong("Contact Number")));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contacts;
    }

    public boolean insertContact(Contact contact, String userEmail) {
        Connection con = null;
        PreparedStatement pst = null;
        try{
            con = DriverManager.getConnection(URL, userName, pass);
            String in = "INSERT INTO public.\"Contacts\" (\"Contact Email\", \"Contact Name \", \"Contact Number\", \"User Email\") VALUES (?, ?, ?, ?)";
//            System.out.println(contact.getContactName()+" " + contact.getNumber()+" " + contact.getEmail()+" " + userEmail);
            pst = con.prepareStatement(in);
            pst.setString(1, contact.getEmail());
            pst.setString(2, contact.getContactName());
            pst.setLong(3, contact.getNumber());
            pst.setString(4, userEmail);

            int rs = pst.executeUpdate();

            return rs > 0;

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }
    public boolean deleteContact(long contact, String userEmail) {
        Connection con = null;
        PreparedStatement pst = null;

        try {
            con = DriverManager.getConnection(URL, userName, pass);

            String query = "DELETE FROM public.\"Contacts\" WHERE \"Contact Number\" = ? AND \"User Email\" = ?";

            pst = con.prepareStatement(query);
            pst.setLong(1, contact);
            pst.setString(2, userEmail);

            int rs = pst.executeUpdate();
            return rs > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public boolean numberExits(long number, String email) {
        Connection con = null;
        PreparedStatement pst = null;

        try {
            con = DriverManager.getConnection(URL, userName, pass);

            String query = "SELECT \"Contact Number\" FROM public.\"Contacts\" WHERE \"Contact Number\"=? AND \"User Email\"=?";

            pst = con.prepareStatement(query);
            pst.setLong(1, number);
            pst.setString(2, email);

            ResultSet rs = pst.executeQuery();
            return !rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return true;
    }
    public boolean numberExits(long number, String email, long oldNumber) {
        if(oldNumber != number) {
            Connection con = null;
            PreparedStatement pst = null;

            try {
                con = DriverManager.getConnection(URL, userName, pass);

                String query = "SELECT \"Contact Number\" FROM public.\"Contacts\" WHERE \"Contact Number\"=? AND \"User Email\"=?";

                pst = con.prepareStatement(query);
                pst.setLong(1, number);
                pst.setString(2, email);

                ResultSet rs = pst.executeQuery();
                return !rs.next();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (pst != null) pst.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            return true;
        }else{
            return true;
        }
    }
    public boolean updateContact(Contact contact, String userEmail, long oldContact) {
        Connection con = null;
        PreparedStatement pst = null;
        try{
            con = DriverManager.getConnection(URL, userName, pass);
            String in = "UPDATE public.\"Contacts\" SET \"Contact Email\"=?, \"Contact Name \"=?, \"Contact Number\"=? WHERE \"Contact Number\" = ? AND \"User Email\" = ?;";
//            System.out.println(contact.getContactName()+" " + contact.getNumber()+" " + contact.getEmail()+" " + userEmail);
            pst = con.prepareStatement(in);
            pst.setString(1, contact.getEmail());
            pst.setString(2, contact.getContactName());
            pst.setLong(3, contact.getNumber());
            pst.setLong(4, oldContact);
            pst.setString(5, userEmail);

            int rs = pst.executeUpdate();

            return rs > 0;

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public List<Contact> searchContactsForUser(String query, String email) {
        List<Contact> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        try {
            con = DriverManager.getConnection(URL, userName, pass);
            String sql = "SELECT * FROM \"Contacts\" WHERE \"User Email\" = ? AND " + "(LOWER(\"Contact Name \") LIKE ? OR LOWER(\"Contact Email\") LIKE ?)";
            pst = con.prepareStatement(sql);
            pst.setString(1, email);
            pst.setString(2, "%" + query.toLowerCase() + "%");
            pst.setString(3, "%" + query.toLowerCase() + "%");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Contact c = new Contact(rs.getString(3), rs.getString(1), rs.getLong(4));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public static void main(String[] args) {
        DAO dao = new DAO();
//        System.out.println(dao.validateUser("Admin@gmail.com", "123456789"));
//        System.out.println(dao.getInfo("Admin@gmail.com", "123456789").firstName);
//        System.out.println(dao.getTotalRows("Admin@gmail.com"));
//        System.out.println(dao.emailExists("Admin@gmail.com"));
//        System.out.println(dao.getContactsForUser("Admin@gmail.com").get(0).getContactName());
//        Contact c = new Contact("Gaurav Urmaliya", "gauravurmaliya7610@gmail.com", 8815539879L);
//        System.out.println(dao.insertContact(c, "Admin@gmail.com"));
//        System.out.println(dao.numberExits(8815539879L, "Admin@gmail.com"));
//        Contact ct = dao.searchContactsForUser("Gaurav", "yugChodu@gmail.com").get(0);
//        for(Contact e: dao.searchContactsForUser("Gaur", "yugChodu@gmail.com")){
//            System.out.println(e.getContactName()+" "+e.getNumber()+" "+e.getEmail());
//        }
//        System.out.println(ct.getContactName()+" "+ct.getNumber()+" "+ct.getEmail());
    }
}
