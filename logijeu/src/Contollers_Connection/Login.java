package Contollers_Connection;

import Application.Constructor;
import Application.Main_Application;
import ConnectDB.CnxDB;
import java.awt.HeadlessException;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Cursor;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Priority;
import javafx.stage.Stage;
import javafx.stage.StageStyle;
import javax.swing.JOptionPane;

/**
 *
 * @author Bonnard_Valentin 
 * connection entre la base de donne et l'application
 * utilisation d'un fichier text pour sauvegarder l'username en clickant sur le
 * radiobutton une method check pour verifier s'il y a une chaine de caractere
 * dans le fichier puis une autre methode pour appliquer cette chaine dans le
 * textfield
 */
public class Login implements Initializable {

    @FXML
    private TextField txt_Username;
    @FXML
    private PasswordField txt_Password;
    @FXML
    private RadioButton radiobtn_Remember;
    @FXML
    private Label lbl_warning2;

    Connection cnx = null;
    ResultSet rs = null;
    PreparedStatement ps = null;

    private String css1 = getClass().getResource("/Ressources/Metro.css").toExternalForm(); //mise en place du css 

    public static final String FILE_PATH = "save.txt";
    
    private static String var_user;

    Alert alert = new Alert(AlertType.ERROR);

    @Override
    public void initialize(URL url, ResourceBundle rb) {

        Check();
        UPDATE();

        radiobtn_Remember.setCursor(Cursor.DEFAULT);
        if (radiobtn_Remember.isSelected()) {
            try {
                SAVE();
            } catch (IOException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

    }

    @FXML
    private void login(ActionEvent event) throws Exception {

        //ouverture du main application si l'utilisateur n'est pas l'admin
        if (!"Admin".equals(txt_Username.getText())) {
            try {

                cnx = CnxDB.ConnectDB();

                String Sql = "Select * from client  where username_client = ? and password_client = ? ;";

                ps = cnx.prepareStatement(Sql);
                ps.setString(1, txt_Username.getText());
                ps.setString(2, txt_Password.getText());
                rs = ps.executeQuery();

            } catch (SQLException | HeadlessException e) {

                JOptionPane.showMessageDialog(null, "scene error" + e);
                alert.setTitle("ERROR DIALOG");
                alert.setContentText("Scene loader error" + e);
            }
            if (rs.next()) {

                ((Node) (event.getSource())).getScene().getWindow().hide();

                FXMLLoader loader = new FXMLLoader();

                AnchorPane mainWindow = (AnchorPane) loader.load(getClass().getResourceAsStream("/FXMLApplication/Main_Application.fxml"));

                Scene scene = new Scene(mainWindow);

                Main_Application controller = loader.getController();
                Constructor.setController(controller);

                Constructor.loadContent(Constructor.CONTENT1);

                System.out.println("scene stylesheets: " + scene.getStylesheets()); // application du css
                scene.getStylesheets().add(css1);

                Stage stage = new Stage();

                stage.setScene(scene);
                stage.initStyle(StageStyle.DECORATED);
                stage.setTitle("LogiJeu");
                stage.getIcons().add(new Image("/Ressources/logijeu.PNG"));
                stage.setResizable(false);
                stage.show();

                var_user = txt_Username.getText();

            } else {
                // message d'erreur si mauvais mot de passe ou manquant
                if (!txt_Password.getText().equals(rs)) {

                    lbl_warning2.setText("Warning, wrong password");

                    if (txt_Password.getText().equals("")) {

                        lbl_warning2.setText("Warning, missing password");
                    }

                }

            }

        } else {

            ((Node) (event.getSource())).getScene().getWindow().hide();
            Parent root = FXMLLoader.load(getClass().getResource("/FXMLAdministrator/Administrator.fxml"));

            Scene scene = new Scene(root);

            Stage stage = new Stage();
            stage.setScene(scene);
            stage.setTitle("Administrator");
            stage.getIcons().add(new Image("/Ressources/logijeu.PNG"));
            stage.setResizable(false);
            stage.show();

        }

    }

    @FXML
    private void cancel(ActionEvent event) {

        // nettoie les textfield
        txt_Username.clear();
        txt_Password.clear();

    }

    @FXML
    private void create_account(ActionEvent event) throws Exception {

        ((Node) (event.getSource())).getScene().getWindow().hide();
        Parent parent = FXMLLoader.load(getClass().getResource("/FXMLcnx/Create_account.fxml"));
        Stage stage = new Stage();
        Scene scene = new Scene(parent);

        stage.setScene(scene);
        stage.initStyle(StageStyle.UNIFIED);
        stage.setTitle("LOGIJEU Create Account");
        stage.getIcons().add(new Image("/Ressources/logijeu.PNG"));
        stage.setResizable(false);
        stage.show();

    }

    @FXML
    private void retrieve_account(ActionEvent event) throws Exception {

        ((Node) (event.getSource())).getScene().getWindow().hide();
        Parent parent = FXMLLoader.load(getClass().getResource("/FXMLcnx/Retreive_account.fxml"));
        Stage stage = new Stage();
        Scene scene = new Scene(parent);

        stage.setScene(scene);
        stage.initStyle(StageStyle.UNIFIED);
        stage.setTitle("Retreive Account");
        stage.getIcons().add(new Image("/Ressources/logijeu.PNG"));
        stage.setResizable(false);
        stage.show();

    }

    private void remember_me(ActionEvent event) throws IOException {

        if (radiobtn_Remember.isSelected()) {
            SAVE();

        }
    }

    public void SAVE() throws IOException {

        // sauvegarde username dans un fichier text dans la racine du projet 
        File file = new File(FILE_PATH);

        if (!file.exists()) {
            file.createNewFile();

            try (BufferedWriter bw = new BufferedWriter(new FileWriter(file.getAbsolutePath()))) {
                bw.write(txt_Username.getText());

            } catch (IOException e) {

                // message exception avec defilement des erreurs.
                alert.setTitle("Exception Dialog");  // titre du dialog
                alert.setContentText("Could not find 1"); // information de l'exception 

                e = new IOException();

                StringWriter sw = new StringWriter(); // pour ecrir de chaine de caractere
                PrintWriter pw = new PrintWriter(sw); // pour afficher les chaines de caractere ecrit  
                e.printStackTrace(pw); // afficher l'exception
                String exceptionText = sw.toString(); // ecrire l'exception 

                Label label = new Label("The exception stacktrace was:");

                TextArea textArea = new TextArea(exceptionText);  // creation d'un textarea pour afficher l'exception
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

                alert.getDialogPane().setExpandableContent(expContent);  // defilement de l'exception 

                alert.showAndWait();  // crée un bouton ok pour fermer la boite de dialog
            }

        }
    }

    public void Check() {

        //radiobutton selectionner si username disponible
        if (txt_Username.getText().equals("")) {
            radiobtn_Remember.setSelected(true);
        } else {
            radiobtn_Remember.setSelected(false);

        }

    }

    public void UPDATE() {

        //lecture du fichier text pour afficher l'username
        File file = new File(FILE_PATH);

        try {
            if (file.exists()) {

                try (Scanner scan = new Scanner(file)) {
                    txt_Username.setText(scan.nextLine());

                }
            }

        } catch (FileNotFoundException ex) {

            // message exception avec defilement des erreurs.
            alert.setTitle("Exception Dialog");// titre du dialog
            alert.setContentText("Could not find file"); // information de l'exception 

            ex = new FileNotFoundException("Could not find file");

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
        }

    }

    @FXML
    private void Remember(ActionEvent event) {
    }

    public String getvar_user() {

        return var_user;
    }

    public void setvar_user(String var_user) {
        this.var_user = var_user;
    }

}
