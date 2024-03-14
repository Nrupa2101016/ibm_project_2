<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login</title>
</head>
<body>

<%
    String username = request.getParameter("username");
    String pass = request.getParameter("pass");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/ibm", "root", "root");

        String query = "SELECT * FROM register1 WHERE username=? AND pass=?";
        PreparedStatement preparedStatement = con.prepareStatement(query);
        preparedStatement.setString(1, username);
        preparedStatement.setString(2, pass);

        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            // User is authenticated, redirect to the main page
            response.sendRedirect("index.html");
        } else {
            // Authentication failed, you can redirect to a failure page or display an error message.
            out.println("<h1>Login failed. Invalid username or password.</h1>");
            response.sendRedirect("login1.html");
        }

        preparedStatement.close();
        con.close();
    } catch (Exception e) {
        out.println("Exception: " + e.getMessage());
    }
%>

</body>
</html>
