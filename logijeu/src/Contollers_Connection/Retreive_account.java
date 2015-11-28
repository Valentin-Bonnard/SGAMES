package Contollers_Connection;

import java.io.Writer;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.stage.Stage;
import javafx.stage.StageStyle;
import javax.swing.JOptionPane;
import org.apache.commons.net.smtp.AuthenticatingSMTPClient;
import org.apache.commons.net.smtp.SimpleSMTPHeader;

/**
 *
 * @author Bonnard_Valentin
 * Retrouver son mot de passe avec envoie d'une requete a l'admin par mail et retransmition du mot de passe
 */
public class Retreive_account implements Initializable{

    @FXML
    private TextField txt_mail;
    @FXML
    private Label lbl_rule;

    String hostname = "smtp.laposte.net"; // boite mail
    int port = 465;// port de la boite mail 

    String password = "Holmes"; // mot de passe boite mail
    String login = "v.bonnard150";// adresse mail sans @

    String from = login + "@laposte.net"; 

    String subject = "subject"; 
    String text = "Mot de passe/identifiant perdu : ";

    Alert alert = new Alert(AlertType.WARNING);
    Alert alertIN = new Alert(AlertType.INFORMATION);
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        ShowRule();
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

    @FXML
    private void next(ActionEvent event) throws Exception {
 
        // method d'envoie du mail du client demandeur de mot de passe a l'admin 
        
        if (!txt_mail.getText().equals("")) {

            AuthenticatingSMTPClient client = new AuthenticatingSMTPClient("TLS", true);
            try {
                String to = "valentinbonnard0303@gmail.com";

                client.setDefaultTimeout(10 * 1000);
                client.connect(hostname, port);
                client.ehlo("localhost");
                client.auth(AuthenticatingSMTPClient.AUTH_METHOD.LOGIN, login, password);

                client.setSender(from);

                client.addRecipient(to);

                Writer writer = client.sendMessageData();

                if (writer != null) {
                    SimpleSMTPHeader header = new SimpleSMTPHeader(from, to, subject);
                    writer.write(header.toString());
                    writer.write(text + txt_mail.getText());
                    writer.close();
                    if (!client.completePendingCommand()) {
                        throw new Exception("Echec d'envoie mail " + client.getReply() + client.getReplyString());
                    }
                } else {
                    throw new Exception("Echec d'envoie mail  " + client.getReply() + client.getReplyString());
                }
            } catch (Exception e) {
                throw e;
            } finally {
                client.logout();
                client.disconnect();
            }

            if (true) {
                
                alertIN.setTitle("Information Dialog");
                alertIN.setContentText("Your request will be processed promptly.");
                alertIN.showAndWait();

                ((Node) (event.getSource())).getScene().getWindow().hide();
                Parent parent = FXMLLoader.load(getClass().getResource("/FXMLcnx/Login.fxml"));
                Stage stage = new Stage();
                Scene scene = new Scene(parent);

                stage.setScene(scene);
                stage.setTitle("LOGIJEU Login");
                stage.getIcons().add(new Image("/Ressources/logijeu.PNG"));
                stage.setResizable(false);
                stage.show();
            }

        } else {
            alert.setTitle("Information Dialog");
            alert.setHeaderText("Please enter your email address");
            alert.setContentText("Careful next time");
            
            alert.showAndWait();
            
        }
    }

    @FXML
    private void cancel(ActionEvent event) throws Exception {

        txt_mail.clear();
        
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

    private void ShowRule() {
        lbl_rule.setText("Before we can change your password or username, we first need to verify your"
                + "\nidentity. Please enter your mail below.");
        
    }
}
