<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Product List</title>
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

        .chatbot-container {
            width: 90%;
            max-width: 800px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            margin-bottom: 50px;
            padding: 15px;
        }

        .chat-header {
            background-color: #4CAF50;
            color: #fff;
            padding: 15px;
            text-align: center;
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

        .order-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="chatbot-container">
    <div class="chat-header">Product List</div>

    <table>
        <thead>
        <tr>
            <th>Product ID</th>
            <th>Category</th>
            <th>Product Name</th>
            <th>Description</th>
            <th>Price</th>
        </tr>
        </thead>
        <tbody>
            <% 
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String jdbcURL = "jdbc:mysql://localhost:3307/ibm";
                    String dbUser = "root";
                    String dbPassword = "root";

                    conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
                    stmt = conn.createStatement();

                    String query = "SELECT * FROM products";
                    rs = stmt.executeQuery(query);

                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getInt("product_id") + "</td>");
                        out.println("<td>" + rs.getString("category") + "</td>");
                        out.println("<td>" + rs.getString("product_name") + "</td>");
                        out.println("<td>" + rs.getString("description") + "</td>");
                        out.println("<td>" + rs.getDouble("price") + "</td>");
                        out.println("</tr>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </tbody>
    </table>

    <a href="orderpage.html" class="order-link">Go to Order Page</a>
</div>

</body>
</html>
