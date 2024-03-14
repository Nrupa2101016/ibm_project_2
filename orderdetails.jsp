<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Order Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .order-details-container {
            width: 50%;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            margin-bottom: 50px;
            padding: 15px;
            text-align: center;
        }

        .order-details-header {
            background-color: #4CAF50;
            color: #fff;
            padding: 15px;
            font-weight: bold;
            font-size: 18px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>

<%
    Connection conn = null;
    PreparedStatement stmtOrderDetails = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String jdbcURL = "jdbc:mysql://localhost:3307/ibm";
        String dbUser = "root";
        String dbPassword = "root";

        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        int orderId = Integer.parseInt(request.getParameter("id"));

        // Retrieve order details
        String orderDetailsQuery = "SELECT * FROM orders WHERE id = ?";
        stmtOrderDetails = conn.prepareStatement(orderDetailsQuery);
        stmtOrderDetails.setInt(1, orderId);
        rs = stmtOrderDetails.executeQuery();

%>

<div class="order-details-container">
    <div class="order-details-header">Order Details</div>

    <%
        if (rs.next()) {
    %>
        <table>
            <tr>
                <th>Order ID</th>
                <td><%= rs.getInt("id") %></td>
            </tr>
            <tr>
                <th>Name</th>
                <td><%= rs.getString("name") %></td>
            </tr>
            <tr>
                <th>Address</th>
                <td><%= rs.getString("address") %></td>
            </tr>
            <tr>
                <th>Phone</th>
                <td><%= rs.getString("phone") %></td>
            </tr>
            <tr>
                <th>Product ID</th>
                <td><%= rs.getString("productId") %></td>
            </tr>
            <tr>
                <th>Timestamp</th>
                <td><%= rs.getTimestamp("timestamp") %></td>
            </tr>
        </table>
    <%
        } else {
    %>
        <p>No order found with ID <%= orderId %>.</p>
    <%
        }
    %>

    <div>
        <a href="cancelorder.jsp?id=<%= orderId %>">Cancel Order</a>
    </div>

</div>

<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmtOrderDetails != null) stmtOrderDetails.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

</body>
</html>
