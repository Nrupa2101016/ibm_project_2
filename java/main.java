import java.sql.*;

public class main {

    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://3307/ibm";
    static final String USER = "root";
    static final String PASS = "root";
    static Connection conn = null;
    static Statement stmt = null;

    public static void main(String[] args) {
        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            stmt = conn.createStatement();

            // Call signup method
            signup("user123", "password123");

            // Call login method
            login("user123", "password123");

            stmt.close();
            conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException se2) {
            }
            try {
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }

    // Signup method
    static void signup(String username, String password) throws SQLException {
        String sql = "INSERT INTO login (username, password) VALUES (?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        pstmt.executeUpdate();
        System.out.println("Signup successful for user: " + username);
        pstmt.close();
    }

    // Login method
    static void login(String username, String password) throws SQLException {
        String sql = "SELECT * FROM login WHERE username=? AND password=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            System.out.println("Login successful for user: " + username);
        } else {
            System.out.println("Invalid username or password.");
        }
        rs.close();
        pstmt.close();
    }
}
