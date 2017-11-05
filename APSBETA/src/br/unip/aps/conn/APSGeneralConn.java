package br.unip.aps.conn;

import java.sql.Connection;
import java.sql.SQLException;

import br.unip.aps.conn.MySQLConn;

public class APSGeneralConn {

	 
    public static Connection getConnection() 
              throws ClassNotFoundException, SQLException {
    		
    		return MySQLConn.getMySQLConnection();
    	
    		// PARA CASO FORMOS UTILIZAR UM OUTRO DB
        //return OracleConnUtils.getOracleConnection();
        // return OracleConnUtils.getOracleConnection();
        // return SQLServerConnUtils_JTDS.getSQLServerConnection_JTDS();
        // return SQLServerConnUtils_SQLJDBC.getSQLServerConnection_SQLJDBC();
        // return PostGresConnUtils.getPostGresConnection();
    }
     
    public static void closeQuietly(Connection conn) {
        try {
            conn.close();
        } catch (Exception e) {
        }
    }
 
    public static void rollbackQuietly(Connection conn) {
        try {
            conn.rollback();
        } catch (Exception e) {
        }
    }
}
