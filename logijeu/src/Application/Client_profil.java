package Application;

import ConnectDB.CnxDB;
import Contollers_Connection.Login;
import java.awt.HeadlessException;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.embed.swing.SwingFXUtils;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.Hyperlink;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Priority;
import javafx.stage.FileChooser;
import javafx.stage.Stage;
import javax.imageio.ImageIO;
import javax.swing.JOptionPane;

/**
 *
 * @author Bonnard_Valentin afficher le profil du client en relation avec la
 * variable user, utilisation de photo avec la mm variable
 */
public class Client_profil implements Initializable {

    @FXML
    private GridPane client_profil;
    @FXML
    private ImageView photo_profil;
    @FXML
    private Button back;
    @FXML
    private Label lbl_compte;
    @FXML
    private Hyperlink Save_image;

    //creation de label dynamiquement
    Label lblnom = new Label();
    Label lblprenom = new Label();
    Label lblmail = new Label();
    Label lbladresse = new Label();
    Label lblville = new Label();
    Label lblpays = new Label();

    Label nom = new Label();
    Label prenom = new Label();
    Label mail = new Label();
    Label adresse = new Label();
    Label ville = new Label();
    Label pays = new Label();

    // idem que pour les label
    TextField update_nom = new TextField();
    TextField update_prenom = new TextField();
    TextField update_mail = new TextField();
    TextField update_adresse = new TextField();
    TextField update_ville = new TextField();
    TextField update_pays = new TextField();

    Connection cnx = null;
    ResultSet rs = null;
    Statement stat = null;
    PreparedStatement ps = null;

    Login login = new Login();
    String user = login.getvar_user();

    Alert alert = new Alert(AlertType.ERROR);

    @Override
    public void initialize(URL url, ResourceBundle rb) {

        lbl_compte.setText("Compte :   " + user);
        profil_gridpane();
        Imageprofil();

    }

    @FXML
    private void close_profil(ActionEvent event) {

        Stage stage = (Stage) back.getScene().getWindow();
        stage.close();
    }

    public void Imageprofil() {

        photo_profil.setImage(new Image("/Ressources/Photo_" + user + ".jpg"));

    }

    public void profil_gridpane() {

        //afficher dans un gridpane les information du client en fonction de l'username
        client_profil.getChildren().clear();

        try {

            cnx = CnxDB.ConnectDB();
            stat = cnx.createStatement();

            rs = cnx.createStatement().executeQuery("select nom_client,"
                    + " prenom_client,"
                    + " mail_client,"
                    + " adresse_client,"
                    + " ville_client,"
                    + " pays_client from client where  username_client ='" + user + "'");

            if (rs.next()) {

                lblnom.setText(rs.getString("nom_client"));
                client_profil.add(lblnom, 1, 0);

                lblprenom.setText(rs.getString("prenom_client"));
                client_profil.add(lblprenom, 1, 1);

                lblmail.setText(rs.getString("mail_client"));
                client_profil.add(lblmail, 1, 2);

                lbladresse.setText(rs.getString("adresse_client"));
                client_profil.add(lbladresse, 1, 3);

                lblville.setText(rs.getString("ville_client"));
                client_profil.add(lblville, 1, 4);

                lblpays.setText(rs.getString("pays_client"));
                client_profil.add(lblpays, 1, 5);

                nom.setText("Nom de famille :");
                client_profil.add(nom, 0, 0);

                prenom.setText("Prenom :");
                client_profil.add(prenom, 0, 1);

                mail.setText("Mail : ");
                client_profil.add(mail, 0, 2);

                adresse.setText("Adresse : ");
                client_profil.add(adresse, 0, 3);

                ville.setText("Ville : ");
                client_profil.add(ville, 0, 4);

                pays.setText("Pays : ");
                client_profil.add(pays, 0, 5);

            } else {

                alert.setTitle("Error Dialog");
                alert.setContentText("Query failed ");
                alert.showAndWait();
            }

        } catch (SQLException | HeadlessException e) {

            alert.setTitle("Error Dialog");
            alert.setContentText("Connection failed" + e);
            alert.showAndWait();
        }

    }

    public void showtextfield_update() {

        client_profil.add(update_nom, 0, 0);

        client_profil.add(update_prenom, 0, 1);

        client_profil.add(update_mail, 0, 2);

        client_profil.add(update_adresse, 0, 3);

        client_profil.add(update_ville, 0, 4);

        client_profil.add(update_pays, 0, 5);
    }

    @FXML
    private void textfield_update_nom(ActionEvent event) {

        lblnom.setVisible(false);
        client_profil.add(update_nom, 1, 0);

        // validation de l'upadte avec la touche entrer 
        update_nom.setOnKeyPressed(new EventHandler<KeyEvent>() {

            @Override
            public void handle(KeyEvent ke) {
                if (ke.getCode().equals(KeyCode.ENTER)) {

                    cnx = CnxDB.ConnectDB();
                    try {

                        stat = cnx.createStatement();
                        String sql = null;
                        String update1 = update_nom.getText();
                        sql = "update client set nom_client = '" + update1 + "' where username_client  ='" + user + "'";

                        stat.executeUpdate(sql);

                        lblnom.setText(update_nom.getText());
                        update_nom.setVisible(false);
                        lblnom.setVisible(true);

                    } catch (SQLException ex) {

                        alert.setTitle("Exception Dialog");
                        alert.setHeaderText("Look, an Exception Dialog");
                        alert.setContentText("\"Update failed, check later\"");

                        ex = new SQLException("Update failed, check later");

                        StringWriter sw = new StringWriter();
                        PrintWriter pw = new PrintWriter(sw);
                        ex.printStackTrace(pw);
                        String exceptionText = sw.toString();

                        Label label = new Label("The exception stacktrace was:");

                        TextArea textArea = new TextArea(exceptionText);
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

                        alert.getDialogPane().setExpandableContent(expContent);

                        alert.showAndWait();
                    }

                }
            }
        });

    }

    @FXML
    private void textfield_update_prenom(ActionEvent event) {
        lblprenom.setVisible(false);
        client_profil.add(update_prenom, 1, 1);

        // validation de l'upadte avec la touche entrer 
        update_prenom.setOnKeyPressed(new EventHandler<KeyEvent>() {

            @Override
            public void handle(KeyEvent ke) {
                if (ke.getCode().equals(KeyCode.ENTER)) {

                    cnx = CnxDB.ConnectDB();
                    try {

                        stat = cnx.createStatement();
                        String sql = null;
                        String update2 = update_prenom.getText();
                        sql = "update client set prenom_client = '" + update2 + "' where username_client  ='" + user + "'";

                        stat.executeUpdate(sql);

                        lblprenom.setText(update_prenom.getText());
                        update_prenom.setVisible(false);
                        lblprenom.setVisible(true);

                    } catch (SQLException ex) {

                        alert.setTitle("Exception Dialog");
                        alert.setHeaderText("Look, an Exception Dialog");
                        alert.setContentText("\"Update failed, check later\"");

                        ex = new SQLException("Update failed, check later");

                        StringWriter sw = new StringWriter();
                        PrintWriter pw = new PrintWriter(sw);
                        ex.printStackTrace(pw);
                        String exceptionText = sw.toString();

                        Label label = new Label("The exception stacktrace was:");

                        TextArea textArea = new TextArea(exceptionText);
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

                        alert.getDialogPane().setExpandableContent(expContent);

                        alert.showAndWait();
                    }

                }
            }
        });
    }

    @FXML
    private void textfield_update_mail(ActionEvent event) {
        lblmail.setVisible(false);
        client_profil.add(update_mail, 1, 2);

        // validation de l'upadte avec la touche entrer 
        update_mail.setOnKeyPressed(new EventHandler<KeyEvent>() {

            @Override
            public void handle(KeyEvent ke) {
                if (ke.getCode().equals(KeyCode.ENTER)) {

                    cnx = CnxDB.ConnectDB();
                    try {

                        stat = cnx.createStatement();
                        String sql = null;
                        String update3 = update_mail.getText();
                        sql = "update client set mail_client = '" + update3 + "' where username_client  ='" + user + "'";

                        stat.executeUpdate(sql);

                        lblmail.setText(update_mail.getText());
                        update_mail.setVisible(false);
                        lblmail.setVisible(true);

                    } catch (SQLException ex) {

                        alert.setTitle("Exception Dialog");
                        alert.setHeaderText("Look, an Exception Dialog");
                        alert.setContentText("\"Update failed, check later\"");

                        ex = new SQLException("Update failed, check later");

                        StringWriter sw = new StringWriter();
                        PrintWriter pw = new PrintWriter(sw);
                        ex.printStackTrace(pw);
                        String exceptionText = sw.toString();

                        Label label = new Label("The exception stacktrace was:");

                        TextArea textArea = new TextArea(exceptionText);
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

                        alert.getDialogPane().setExpandableContent(expContent);

                        alert.showAndWait();
                    }

                }
            }
        });
    }

    @FXML
    private void textfield_update_adresse(ActionEvent event) {
        lbladresse.setVisible(false);
        client_profil.add(update_adresse, 1, 3);

        // validation de l'upadte avec la touche entrer 
        update_adresse.setOnKeyPressed(new EventHandler<KeyEvent>() {

            @Override
            public void handle(KeyEvent ke) {
                if (ke.getCode().equals(KeyCode.ENTER)) {

                    cnx = CnxDB.ConnectDB();
                    try {

                        stat = cnx.createStatement();
                        String sql = null;
                        String update4 = update_adresse.getText();
                        sql = "update client set adresse_client = '" + update4 + "' where username_client  ='" + user + "'";

                        stat.executeUpdate(sql);

                        lbladresse.setText(update_adresse.getText());
                        update_adresse.setVisible(false);
                        lbladresse.setVisible(true);

                    } catch (SQLException ex) {

                        alert.setTitle("Exception Dialog");
                        alert.setHeaderText("Look, an Exception Dialog");
                        alert.setContentText("\"Update failed, check later\"");

                        ex = new SQLException("Update failed, check later");

                        StringWriter sw = new StringWriter();
                        PrintWriter pw = new PrintWriter(sw);
                        ex.printStackTrace(pw);
                        String exceptionText = sw.toString();

                        Label label = new Label("The exception stacktrace was:");

                        TextArea textArea = new TextArea(exceptionText);
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

                        alert.getDialogPane().setExpandableContent(expContent);

                        alert.showAndWait();
                    }

                }
            }
        });
    }

    @FXML
    private void textfield_update_ville(ActionEvent event) {
        lblville.setVisible(false);
        client_profil.add(update_ville, 1, 4);

        // validation de l'upadte avec la touche entrer 
        update_ville.setOnKeyPressed(new EventHandler<KeyEvent>() {

            @Override
            public void handle(KeyEvent ke) {
                if (ke.getCode().equals(KeyCode.ENTER)) {

                    cnx = CnxDB.ConnectDB();
                    try {

                        stat = cnx.createStatement();
                        String sql = null;
                        String update5 = update_ville.getText();
                        sql = "update client set ville_client = '" + update5 + "' where username_client  ='" + user + "'";

                        stat.executeUpdate(sql);

                        lblville.setText(update_ville.getText());
                        update_ville.setVisible(false);
                        lblville.setVisible(true);

                    } catch (SQLException ex) {

                        alert.setTitle("Exception Dialog");
                        alert.setHeaderText("Look, an Exception Dialog");
                        alert.setContentText("\"Update failed, check later\"");

                        ex = new SQLException("Update failed, check later");

                        StringWriter sw = new StringWriter();
                        PrintWriter pw = new PrintWriter(sw);
                        ex.printStackTrace(pw);
                        String exceptionText = sw.toString();

                        Label label = new Label("The exception stacktrace was:");

                        TextArea textArea = new TextArea(exceptionText);
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

                        alert.getDialogPane().setExpandableContent(expContent);

                        alert.showAndWait();
                    }

                }
            }
        });
    }

    @FXML
    private void textfield_update_pays(ActionEvent event) {
        lblpays.setVisible(false);
        client_profil.add(update_pays, 1, 5);

        // validation de l'upadte avec la touche entrer 
        update_pays.setOnKeyPressed(new EventHandler<KeyEvent>() {

            @Override
            public void handle(KeyEvent ke) {
                if (ke.getCode().equals(KeyCode.ENTER)) {

                    cnx = CnxDB.ConnectDB();
                    try {

                        stat = cnx.createStatement();
                        String sql = null;
                        String update6 = update_pays.getText();
                        sql = "update client set pays_client = '" + update6 + "' where username_client  ='" + user + "'";

                        stat.executeUpdate(sql);

                        lblpays.setText(update_pays.getText());
                        update_pays.setVisible(false);
                        lblpays.setVisible(true);

                    } catch (SQLException ex) {

                        // message exception avec defilement des erreurs.
                        alert.setTitle("Exception Dialog");// titre du dialog
                        alert.setContentText("Update failed, check later");  // information de l'exception 

                        ex = new SQLException("Update failed, check later");

                        StringWriter sw = new StringWriter(); // pour ecrir de chaine de caractere
                        PrintWriter pw = new PrintWriter(sw); // pour afficher les chaines de caractere ecrit  
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

                        alert.getDialogPane().setExpandableContent(expContent);  // defilement de l'exception 

                        alert.showAndWait(); // crée un bouton ok pour fermer la boite de dialog
                    }

                }
            }
        });
    }

    @FXML
    private void choose_modify_image(ActionEvent event) throws IOException {

        // utilisation du filechooser afin de trouver une image dans l'ordi et de la placer dans une imageview
        // sauvegarder l'image dans la ressources du projet afin de pouvoir la reutiliser dans une autre methode en fonction de l'username associé
        FileChooser filechooser = new FileChooser();
        filechooser.setTitle("Select your images");
        filechooser.setInitialDirectory(new File("C:\\Users\\Bonnard_Valentin\\Pictures")); // chemin a changer
        filechooser.getExtensionFilters().addAll(new FileChooser.ExtensionFilter("PICTURES Files", "*.jpg", "*.bmp", "*.pct", "*.tif", "*.png"));
        File selectedfile = filechooser.showOpenDialog(null);

        if (selectedfile != null) {

            BufferedImage bufferedimage = ImageIO.read(selectedfile);

            Image image = SwingFXUtils.toFXImage(bufferedimage, null);
            photo_profil.setImage(image);

            Save_image.setOnAction(new EventHandler<ActionEvent>() {
                public void handle(ActionEvent event) {

                    try {
                        ImageIO.write(SwingFXUtils.fromFXImage(photo_profil.getImage(),
                                null), "png", new File(
                                        "C:\\Users\\Bonnard_Valentin\\Desktop\\LOGIJEU\\logijeu\\src\\Ressources\\Photo_" + user + ".jpg"));
                    } catch (IOException ex) {
                        Logger.getLogger(Client_profil.class.getName()).log(Level.SEVERE, null, ex);
                    }

                }
            });

        }
    }
}
