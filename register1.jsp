<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Registration</title>
</head>
<body>
<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/ibm", "root", "root");
    String que = "INSERT INTO register1 (firstname, lastname, username, pass) VALUES (?, ?, ?, ?)";
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String username = request.getParameter("username");
    String pass = request.getParameter("pass");
    PreparedStatement p = con.prepareStatement(que);
    p.setString(1, firstname);
    p.setString(2, lastname);
    p.setString(3, username);
    p.setString(4, pass);
    p.executeUpdate();
    out.println("<h1>Values Added successfully!!</h1>");
    p.close();
    con.close();

    // Redirect to the login page after successful registration
    response.sendRedirect("userregistered.html");
} catch (Exception e) {
    out.println("<h1>Exception: " + e.getMessage() + "</h1>");
}
%>
</body>
</html>
