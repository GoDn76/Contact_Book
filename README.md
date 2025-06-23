# 📇 Contact Book

A simple **Java Servlet** application with **JSP** front-end and **JDBC** for MySQL database interaction. Allows users to **create**, **view**, **edit**, and **delete** contact entries via a lightweight web interface.

---

## ⚙️ Features

- **List Contacts**: View all saved contacts with details like name, phone, and email.
- **Add Contact**: Input full details—name, phone, email, address, notes—through a form.
- **Edit Contact**: Modify existing entries.
- **Delete Contact**: Remove contacts with confirmation.

Basic CRUD functionality implemented using Java Servlets and JSP pages for presentation.

---

## 🛠️ Technology Stack

- 🌐 **Backend**: Java Servlets  
- 🧩 **Front-end**: JSP (JavaServer Pages)  
- 🔗 **Database Layer**: JDBC with MySQL (via Connector/J driver)  
- ⚙️ **Build Tool**: Maven (for dependencies)

---

## 📦 Prerequisites

- JDK 8+  
- Apache Maven  
- Apache Tomcat (or any Servlet container)  
- MySQL database  
- MySQL Connector/J driver included in project's `pom.xml`

---

## 🚀 Setup & Run

### 1. Clone repository
```bash
git clone https://github.com/GoDn76/Contact-Book.git
cd Contact-Book
```

### 2. Configure Database

- Create the MySQL database, e.g.:
```sql
CREATE DATABASE contactdb;
```
- Create the `contacts` and `login` table in PostgreSQL with specified column names or Run the `contactdb.sql` SQL script.
- Create `config.properties` file in `src/main/resources` and set the DB connection details in `config.properties`.:
```config.properties
db.url = "jdbc:mysql://localhost:3306/contactdb";
db.username = "your_db_user";
db.password = "your_db_password";
```

### 3. Build the project
```bash
mvn clean package
```

### 4. Deploy to Tomcat

- Copy the generated WAR file from `target/` to `TOMCAT_HOME/webapps/`
- Start Tomcat (`TOMCAT_HOME/bin/startup.sh`)
- Browse to `http://localhost:8080/Contact-Book/`

---

## 📁 Project Structure

```
Contact-Book/
├── src/
│   ├── main/
│   │   ├── java/             # Servlet classes (Add, Edit, Delete, List)
│   │   ├── webapp/
│   │       ├── WEB-INF/
│   │       │   └── web.xml   # Servlet mappings
│   │       ├── jsp/          # JSP pages (list, add, edit, confirm delete)
│   │       └── lib/          # PgSQL Connector/J driver
├── pom.xml                   # Maven build + dependencies
├── database.sql              # SQL schema / sample data
└── README.md
```

---

## 🧭 Usage Guide

1. **View Contacts**  
   Landing JSP page (e.g., `ContactBook.jsp`) displays all records.

2. **Add Contact**  
   Use `Add New Contact` button → direct to form JSP → submits to `AddContactServlet`.

3. **Edit Contact**  
   Click `Edit` next to a record → pre-filled form → update via `EditContactServlet`.

4. **Delete Contact**  
   Click `Delete` → confirmation page → deletion handled by `DeleteContactServlet`.

---

## ✅ Contributing

Contributions are welcome! To contribute:

1. Fork the repo  
2. Create a new branch (`git checkout -b feature/YourFeature`)  
3. Make improvements and commit  
4. Push to your branch and open a Pull Request

Please:
- Follow Java coding conventions
- Update Javadoc/comments as needed
- Maintain database SQL scripts if schema changes

---

## 🎯 Future Enhancements

- 🔍 Add **search** and **pagination**
- 🛡️ Implement **input validation** and better **error handling**
- 🔐 Add **user authentication**
- 🧩 Use **MVC framework** (e.g., Spring MVC) for cleaner architecture
- 📦 **Dockerize** for easy deployment

---

## 📬 Questions or Feedback?

Feel free to open an issue or contact me via GitHub. Happy coding!
