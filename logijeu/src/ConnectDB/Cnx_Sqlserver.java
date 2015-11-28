package ConnectDB;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

/**
 *
 * @author User
 */
public class Cnx_Sqlserver {

    static Connection conSS = Connecter();

    public static Connection Connecter() {
        try {
            //Chaine de connexion
            String url = "jdbc:sqlserver://WIN7PRO;databaseName=Banque";
            //String user ="sa" ;
            String user = "sa";
            String pass = "django_2015";
            //chargement du pilote sql server
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            /*Etablissement de la connection*/
            conSS = DriverManager.getConnection(url, user, pass);

        } catch (Exception e) {

            JOptionPane.showMessageDialog(null, "Erreur de connection a la base de donnees :" + e);
        }
        return conSS;
    }

}
