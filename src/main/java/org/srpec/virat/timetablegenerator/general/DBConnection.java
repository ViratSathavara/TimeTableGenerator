package org.srpec.virat.timetablegenerator.general;

import java.sql.*;
import java.util.HashMap;
import java.util.ResourceBundle;

public class DBConnection implements AutoCloseable {
    private static final HashMap<String,String> dbProps;
    private static final String driverClass = "com.mysql.cj.jdbc.driver";
    private Connection con;

    static {
        dbProps = new HashMap<>();
        ResourceBundle rb = ResourceBundle.getBundle("dbProperties");
        for (String key:rb.keySet()){
            dbProps.put(key,rb.getString(key));
        }
    }

    DBConnection(boolean isReadOnly){
        try {
            Class.forName(driverClass);
            if (con != null && !con.isClosed()){
                String dbUrl = dbProps.get("jdbcUrl");
                String username = dbProps.get("username");
                String password = dbProps.get("password");
                con = DriverManager.getConnection(dbUrl,username,password);
                if (isReadOnly){
                    con.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);
                    con.setReadOnly(true);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public ResultSet selectFromDataBase(String Sql,Object ...value) throws Exception{
        try(PreparedStatement ps = prepareStatement(Sql,value)){
            return ps.executeQuery();
        }
    }

    public PreparedStatement prepareStatement(String Sql,Object ...values) throws Exception{
            PreparedStatement ps = con.prepareStatement(Sql);
            for (int i = 0; i < values.length; i++) {
                ps.setObject(i,values[i]);
            }
            return ps;
    }

    @Override
    public void close() throws Exception {
        if (con != null && !con.isClosed()){
            con.close();
        }
    }
}
