package ConnectDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author User / Valentin Bonnard
 */
public class Connect_Debian_Mysql {

    public String drivers;
    String url;
    String user;
    String pass;
    Connection conDMYSQL;

    public boolean DriversCharg() {
        try {
            Class.forName(drivers);

        } catch (ClassNotFoundException e) {
            System.err.println("Chargement drivers echoué\n" + e);
            return false;
        }
        return true;
    }

    public boolean Connect() {
        try {
            
            boolean recup = this.DriversCharg();
            System.out.println("Drivers charges:" + recup);
            conDMYSQL = DriverManager.getConnection(url, user, pass);
            System.out.println("\nConnection a la base etablie");
        } 
        catch (SQLException evt) 
        {
            System.err.println("==>SQL Exception :\n");
            while (evt != null) {
                System.out.println("Message: " + evt.getMessage());
                System.out.println("SQLState: " + evt.getSQLState());
                System.out.println("ErrorCode: " + evt.getErrorCode());
                evt = evt.getNextException();
                System.out.println("");
                return false;
            }
        }
        return true;
    }

}
