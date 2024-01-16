import java.nio.channels.SelectableChannel;
import java.sql.*;
import java.util.Scanner;

public class DbConnect {
    public static final String DB_URL = "jdbc:mysql://localhost/jdbc_db";
    public static final String DB_USER = "root";
    public static final String DB_PASSWORD = "mysql";

    public static void showTbl(ResultSet r) throws SQLException {

        System.out.println("\t----tblEmployee----");
        String col = "%-2s %-8s %-10s %-8s ";
        System.out.printf(col, "ID", "NAME", "POSITION", "SALARY");
        while (r.next()) {
            System.out.println();
            System.out.printf(col, r.getInt("employees_id"), r.getString("employees_name"),
                    r.getString("employees_position"), r.getFloat("employees_salary"));
        }
        System.out.println();
        System.out.println("\t----tblEmployee----");
    }

    public static void main(String[] args) {
        Connection connection = null;
        Statement select = null;
        String sqlSelect = "SELECT * FROM EMPLOYEES";
        String sqlInsert = "INSERT INTO EMPLOYEES (employees_name,employees_position,employees_salary) VALUES (?,?,?)";
        String sqlUpdate = "UPDATE EMPLOYEES SET  employees_salary = ? WHERE employees_position = ? ";
        String sqlDelete = "DELETE FROM EMPLOYEES WHERE employees_position = ? ";
        try {
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            select = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);  // veritabanı bağlantısı üzeerinden bir statement oluştur.
            ResultSet dataShow = select.executeQuery(sqlSelect);
            showTbl(dataShow);

            System.out.println();
            System.out.println("--INSERT SYNTAX--");
            System.out.println("PreparedStatement : " + sqlInsert);
            PreparedStatement prsInsert = connection.prepareStatement(sqlInsert);
            prsInsert.setString(1, "MUTLU");
            prsInsert.setString(2, "MANAGER");
            prsInsert.setFloat(3, 95000);
            prsInsert.executeUpdate();
            prsInsert.close();

            ResultSet dataInsert = select.executeQuery(sqlSelect);
            System.out.println();
            showTbl(dataInsert);


            System.out.println();
            System.out.println("--UPDATE SYNTAX--");
            System.out.println("PreparedStatement : " + sqlUpdate);
            PreparedStatement prsUpdate = connection.prepareStatement(sqlUpdate);
            prsUpdate.setString(2, "MANAGER");
            prsUpdate.setFloat(1, 12000);
            prsUpdate.executeUpdate();
            prsUpdate.close();

            ResultSet dataUpdate = select.executeQuery(sqlSelect);
            System.out.println();
            showTbl(dataUpdate);


            System.out.println();
            System.out.println("--DELETE SYNTAX--");
            System.out.println("PreparedStatement : " + sqlDelete);
            PreparedStatement prsDelete = connection.prepareStatement(sqlDelete);
            prsDelete.setString(1, "MANAGER");
            prsDelete.executeUpdate();

            ResultSet dataDel = select.executeQuery(sqlSelect);
            System.out.println();
            showTbl(dataDel);


        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
