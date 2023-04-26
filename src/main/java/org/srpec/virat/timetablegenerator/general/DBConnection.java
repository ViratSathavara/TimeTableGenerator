package org.srpec.virat.timetablegenerator.general;

import org.json.JSONArray;
import org.json.JSONObject;

import java.sql.*;
import java.util.HashMap;
import java.util.ResourceBundle;

public class DBConnection implements AutoCloseable {
    private static final HashMap<String, String> dbProps;
    private static final String driverClass = "com.mysql.cj.jdbc.Driver";
    private Connection con;

    static {
        dbProps = new HashMap<>();
        ResourceBundle rb = ResourceBundle.getBundle("dbProperties");
        for (String key : rb.keySet()) {
            dbProps.put(key, rb.getString(key));
            System.out.println(key + ":" + rb.getString(key));
        }
    }

    DBConnection(boolean isReadOnly) {
        try {
            Class.forName(driverClass);
            if (con == null || con.isClosed()) {
                String dbUrl = dbProps.get("jdbcUrl");
                String username = dbProps.get("username");
                String password = dbProps.get("password");
                con = DriverManager.getConnection(dbUrl, username, password);
                if (isReadOnly) {
                    con.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);
                    con.setReadOnly(true);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public ResultSet selectFromDataBase(String Sql, Object... value) throws Exception {
        PreparedStatement ps = prepareStatement(Sql, value);
        return ps.executeQuery();
    }

    public JSONArray getJsonFromDB(StringBuilder SQL, String ifNull, Object... values) {
        return getJsonFromDB(SQL.toString(), ifNull, values);
    }

    public JSONArray getJsonFromDB(String SQL, String ifNull, Object... values) {
        JSONArray jsonArray = new JSONArray();
        try (ResultSet myRs = selectFromDataBase(SQL, values)) {
            ResultSetMetaData rsmd = myRs.getMetaData();
            JSONObject jsonObject = new JSONObject();
            int colCount = rsmd.getColumnCount();
            while(myRs.next()){
                for (int i = 1; i <= colCount; i++) {
                    String columnLabel = rsmd.getColumnLabel(i);
                    String value = String.valueOf(myRs.getObject(i));
                    if (value == null || "".equalsIgnoreCase(value) || "".equalsIgnoreCase(value.trim())) {
                        value = ifNull;
                    }
                    jsonObject.put(columnLabel.toLowerCase(), value);
                }
                jsonArray.put(jsonObject);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }

    public PreparedStatement prepareStatement(String Sql, Object... values) throws Exception {
        PreparedStatement ps = con.prepareStatement(Sql);
        for (int i = 0; i < values.length; i++) {
            ps.setObject(i, values[i]);
        }
        System.out.println(ps.toString());
        return ps;
    }

    @Override
    public void close() throws Exception {
        if (con != null && !con.isClosed()) {
            con.close();
        }
    }
}
