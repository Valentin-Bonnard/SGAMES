package Application;

import ConnectDB.CnxDB;
import Contollers_Connection.Create_account;
import java.net.URL;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextField;
import javax.swing.JOptionPane;

/**
 *
 * @author Bonnard_Valentin Insert pour soumettre a l'admin qu'il manque des
 * composant a l'application insert via une procedure stocke
 */
public class Help_insert implements Initializable {

    @FXML
    private TextField txtProcesseurSuggestion;
    @FXML
    private TextField txtCGSuggestion;
    @FXML
    private TextField txtCASuggestion;
    @FXML
    private TextField txtGAMESSuggestion;
    @FXML
    private TextField txtOSSuggestion;
    @FXML
    private TextField txtRAMSuggestion;
    @FXML
    private TextField txtMailSuggestion;
    @FXML
    private TextField txtPhoneSuggestion;
    @FXML
    private RadioButton CbPhone;

    Connection cnx = null;
    PreparedStatement ps = null;
    CallableStatement cs = null;

    Alert alert = new Alert(AlertType.ERROR);

    @Override
    public void initialize(URL url, ResourceBundle rb) {

    }

    @FXML
    private void Validation(ActionEvent event) {

        // appelle d'une procedure stockee d'insert et insert du numero de portable si l'utilisateur le demande 
        try {
            cnx = CnxDB.ConnectDB();
            cs = cnx.prepareCall(" {call ca_insertsuggestion (?, ?, ?, ?, ?, ?, ? ) } "); // appelle procedure stocké insertsuggestion
            cs.setString(1, txtProcesseurSuggestion.getText());
            cs.setString(2, txtCASuggestion.getText());
            cs.setString(3, txtCGSuggestion.getText());
            cs.setString(4, txtRAMSuggestion.getText());
            cs.setString(5, txtOSSuggestion.getText());
            cs.setString(6, txtGAMESSuggestion.getText());
            cs.setString(7, txtMailSuggestion.getText());
            cs.executeUpdate();

            if (true) {
                Constructor.loadContent(Constructor.CONTENT1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Create_account.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (CbPhone.isSelected()) { // si radiobutton est selectionné alors on isert le numero de portable sinon rien 
            try {
                cnx = CnxDB.ConnectDB();
                String Sql = "insert into suggestion(Numero_Portable)  values (?);";

                ps = cnx.prepareStatement(Sql);
                ps.setString(1, txtPhoneSuggestion.getText());
                ps.execute();
            } catch (SQLException ex) {

                alert.setTitle("Error dialog");
                alert.setContentText("Error" + ex);
                alert.showAndWait();
            }
        }

    }

}
