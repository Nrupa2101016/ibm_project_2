<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<%
    String username = request.getParameter("username");
    String id = request.getParameter("id");
    String newPassword = request.getParameter("newPassword");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/ibm", "root", "root");

        // Check if the username exists
        String checkUserQuery = "SELECT * FROM register1 WHERE username=? and id=?";
        PreparedStatement checkUserStatement = con.prepareStatement(checkUserQuery);
        checkUserStatement.setString(1, username);
        checkUserStatement.setString(2, id);
        ResultSet userResultSet = checkUserStatement.executeQuery();

        if (userResultSet.next()) {
            // User exists, update the password
            String updatePasswordQuery = "UPDATE register1 SET pass=? WHERE username=? and id=?";
            PreparedStatement updatePasswordStatement = con.prepareStatement(updatePasswordQuery);
            updatePasswordStatement.setString(1, newPassword);
            updatePasswordStatement.setString(2, username);
            updatePasswordStatement.setString(3, id);
            updatePasswordStatement.executeUpdate();

            // Redirect to a new page with a success message and login button
            response.sendRedirect("passwordupdated.jsp");
        } else {
            // User does not exist
            out.println("<h1>User does not exist.</h1>");
        }

        checkUserStatement.close();
        con.close();
    } catch (Exception e) {
        out.println("Exception: " + e.getMessage());
    }
%>

</body>
</html>
