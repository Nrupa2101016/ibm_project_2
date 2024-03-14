<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Order</title>
</head>
<body>
<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/ibm", "root", "root");
    
    // Assuming your table is named "orders"
    String que = "INSERT INTO orders (name, address, phone, productId) VALUES (?, ?, ?, ?)";
    
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");
    String productId = request.getParameter("productId");
    
    PreparedStatement p = con.prepareStatement(que);
    p.setString(1, name);
    p.setString(2, address);
    p.setString(3, phone);
    p.setString(4, productId);
    
    p.executeUpdate();
    out.println("<h1>Order Placed Successfully!</h1>");
    
    p.close();
    con.close();

    // Redirect to a confirmation page or any other relevant page
    response.sendRedirect("orderdetails.jsp");
} catch (Exception e) {
    out.println("<h1>Exception: " + e.getMessage() + "</h1>");
}
%>
</body>
</html>
