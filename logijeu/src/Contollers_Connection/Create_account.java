package Contollers_Connection;

import ConnectDB.CnxDB;
import java.net.URL;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

/**
 *
 * @author Bonnard_Valentin
 */
public class Create_account implements Initializable {

    Connection cnx = null;
    CallableStatement cs = null;

    @FXML
    private TextField txt_prenom;
    @FXML
    private TextField txt_nom;
    @FXML
    private TextField txt_mail;
    @FXML
    private TextField txt_ville;
    @FXML
    private TextField txt_pays;
    @FXML
    private TextField txt_adresse;
    @FXML
    private TextField txt_password;
    @FXML
    private PasswordField txt_username;

    @Override
    public void initialize(URL url, ResourceBundle rb) {

    }

    @FXML
    private void registration_account(ActionEvent event) {

        // appelle d'une procedure stocké
        try {
            cnx = CnxDB.ConnectDB();
            cs = cnx.prepareCall(" {call ca_insertclient(?, ?, ?, ?, ?, ?, ? , ?) } ");

            cs.setString(1, txt_prenom.getText());
            cs.setString(2, txt_nom.getText());
            cs.setString(3, txt_mail.getText());
            cs.setString(4, txt_ville.getText());
            cs.setString(5, txt_pays.getText());
            cs.setString(6, txt_adresse.getText());
            cs.setString(7, txt_username.getText());
            cs.setString(8, txt_password.getText());
            cs.execute();

        } catch (SQLException ex) {
            Logger.getLogger(Create_account.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @FXML
    private void back(ActionEvent event) throws Exception {

        ((Node) (event.getSource())).getScene().getWindow().hide();
        Parent parent = FXMLLoader.load(getClass().getResource("/FXMLcnx/Login.fxml"));
        Stage stage = new Stage();
        Scene scene = new Scene(parent);

        stage.setScene(scene);
        stage.initStyle(StageStyle.UNIFIED);
        stage.setTitle("LOGIJEU Login");
        stage.getIcons().add(new Image("/Ressources/logijeu.PNG"));
        stage.setResizable(false);
        stage.show();

    }

}
