package cn.scutvk.Utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.Statement;

public class C3p0Utils {
    // this class is using c3p0 to connect to database
    // has methods: getConnection, release
    private static DataSource ds = null;
    static {
        ComboPooledDataSource cpds = new ComboPooledDataSource();
        // try to connect Driver
        try {
            cpds.setDriverClass("com.mysql.cj.jdbc.Driver");
            cpds.setJdbcUrl("jdbc:mysql://localhost:3306/[your database name]");
            cpds.setUser("[your database username]");
            cpds.setPassword("[your database password]");
            cpds.setInitialPoolSize(100);
            cpds.setMaxPoolSize(90000);
            cpds.setTestConnectionOnCheckout(false);
            cpds.setTestConnectionOnCheckin(true);
            cpds.setIdleConnectionTestPeriod(90);
            ds = cpds;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public static Connection getConnection() throws Exception {
        return ds.getConnection();
    }
    public static void release(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            conn = null;
        }
    }

    public static void release(Connection conn, Statement stmt) {
        release(conn);
        if (stmt != null) {
            try {
                stmt.close();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            stmt = null;
        }
    }
}
