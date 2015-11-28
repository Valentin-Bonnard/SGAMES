package ConnectDB;

import java.awt.HeadlessException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Priority;

/**
 *
 * @author Valentin Bonnard
 */
public class CnxDB {

    static Alert alert = new Alert(AlertType.ERROR);

    public static Connection ConnectDB() {

        // Si base de donnée mysql
        try {
            Class.forName("com.mysql.jdbc.Driver");

        } catch (Exception ex) {
            // message exception avec defilement des erreurs.
            alert.setTitle("Exception Dialog");// titre du dialog
            alert.setContentText("Could not find file"); // information de l'exception 

            ex = new Exception("Could not find file");

            StringWriter sw = new StringWriter(); // pour ecrir de chaine de caractere
            PrintWriter pw = new PrintWriter(sw);  // pour afficher les chaines de caractere ecrit  
            ex.printStackTrace(pw); // afficher l'exception
            String exceptionText = sw.toString(); // ecrire l'exception 

            Label label = new Label("The exception stacktrace was:");

            TextArea textArea = new TextArea(exceptionText); // creation d'un textarea pour afficher l'exception
            textArea.setEditable(false);
            textArea.setWrapText(true);

            textArea.setMaxWidth(Double.MAX_VALUE);
            textArea.setMaxHeight(Double.MAX_VALUE);
            GridPane.setVgrow(textArea, Priority.ALWAYS);
            GridPane.setHgrow(textArea, Priority.ALWAYS);

            GridPane expContent = new GridPane();
            expContent.setMaxWidth(Double.MAX_VALUE);
            expContent.add(label, 0, 0);
            expContent.add(textArea, 0, 1);

            alert.getDialogPane().setExpandableContent(expContent); // defilement de l'exception 

            alert.showAndWait(); // crée un bouton ok pour fermer la boite de dialog
            return null;

        }
        try {
            Connection cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/logijeu", "root", "");/*MheB666aqD&&*/

            return cnx;

        } catch (SQLException | HeadlessException e) {
            // message exception avec defilement des erreurs.
            alert.setTitle("Exception Dialog");// titre du dialog
            alert.setContentText("Could not find file"); // information de l'exception 

            HeadlessException ev = new HeadlessException("Could not find file");

            StringWriter sw = new StringWriter(); // pour ecrir de chaine de caractere
            PrintWriter pw = new PrintWriter(sw);  // pour afficher les chaines de caractere ecrit  
            ev.printStackTrace(pw); // afficher l'exception
            String exceptionText = sw.toString(); // ecrire l'exception 

            Label label = new Label("The exception stacktrace was:");

            TextArea textArea = new TextArea(exceptionText); // creation d'un textarea pour afficher l'exception
            textArea.setEditable(false);
            textArea.setWrapText(true);

            textArea.setMaxWidth(Double.MAX_VALUE);
            textArea.setMaxHeight(Double.MAX_VALUE);
            GridPane.setVgrow(textArea, Priority.ALWAYS);
            GridPane.setHgrow(textArea, Priority.ALWAYS);

            GridPane expContent = new GridPane();
            expContent.setMaxWidth(Double.MAX_VALUE);
            expContent.add(label, 0, 0);
            expContent.add(textArea, 0, 1);

            alert.getDialogPane().setExpandableContent(expContent); // defilement de l'exception 

            alert.showAndWait(); // crée un bouton ok pour fermer la boite de dialog
            return null;
        }
    }
}
