package Application;

import ConnectDB.CnxDB;
import TableView.Result_Config;
import java.awt.Desktop;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextArea;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.image.Image;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Priority;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javax.swing.JOptionPane;

/**
 *
 * @author Bonnard_Valentin 
 * creation du resultat en relation avec les combobox du content 1 ainsi que l'insert des config realise par les clients.
 * L'insert se fait en deux temps car les clients peuvent soumettre leur config ainsi
 * qu'une note, mais l'admin peut faire une update de cette config en lui
 * rajoutant une note "admin"
 */
public class Result_Content1 implements Initializable {

    @FXML
    private TableView table_config;
    @FXML
    private TableColumn column1;
    @FXML
    private TableColumn column2;
    @FXML
    private TableColumn column3;
    @FXML
    private TableColumn column4;
    @FXML
    private TableColumn column5;
    @FXML
    private TableColumn column6;
    @FXML
    private TableColumn column7;
    @FXML
    private TableColumn column8;
    @FXML
    private Label lbl_couleur;
    @FXML
    private Label config;
    @FXML
    private TextArea txt_minimum;
    @FXML
    private TextArea txt_recommended;
    @FXML
    private VBox box;

    // instanciation des variables venant du content 1 (combobox), 
    Content1 c1 = new Content1();
    String var_proc = c1.getvar_proc();
    String var_carte_mere = c1.getvar_carte_mere();
    String var_carte_graphique = c1.getvar_carte_graphique();
    String var_ram = c1.getvar_ram();
    String var_jeux = c1.getvar_jeux();
    String var_os = c1.getvar_os();
    String var_soft = c1.getvar_soft();
    String filePath = var_jeux + "_mim.txt";
    String filePath2 = var_jeux + "_reco.txt";

    Integer note;
    Integer fiabilité;

    Connection cnx = null;
    ResultSet rs = null;
    Statement stat = null;
    PreparedStatement ps = null;

    ObservableList<Result_Config> data;
    Alert alert = new Alert(AlertType.ERROR);

    @Override
    public void initialize(URL url, ResourceBundle rb) {

        Display_config();
        Display_Color();
        Display_note();
        txt_mim();
        txt_reco();
        Table_result();

    }

    public void Table_result() {

        if (var_soft == null) {
            // creation liste via ma classe jeux
            try {
                cnx = CnxDB.ConnectDB();
                stat = cnx.createStatement();
                data = FXCollections.observableArrayList();
                rs = cnx.createStatement().executeQuery("select Name_GPU,"
                        + " CPU_Name,"
                        + " Name_Proc,"
                        + " Capacite,"
                        + " Designation_Logiciel,"
                        + " Designation_Jeux,"
                        + " Note,"
                        + " Fidelite from result"
                        + " where"
                        + " CPU_Name ='" + var_carte_mere + "'"
                        + " and"
                        + " Designation_Jeux = '" + var_jeux + "';");

                while (rs.next()) {
                    data.add(new Result_Config(
                            rs.getString("Name_GPU"),//definition parametre
                            rs.getString("CPU_Name"),
                            rs.getString("Name_Proc"),
                            rs.getString("Capacite"),
                            rs.getString("Designation_Logiciel"),
                            rs.getString("Designation_Jeux"),
                            rs.getInt("Note"),
                            rs.getInt("Fidelite"))); // erreur base de donnee , a modifier plus tard en fiabilite

                }
                column1.setText("Name_GPU");
                column1.setCellValueFactory(new PropertyValueFactory("Name_GPU"));

                column2.setText("CPU_Name");
                column2.setCellValueFactory(new PropertyValueFactory("CPU_Name"));

                column3.setText("Name_Proc");
                column3.setCellValueFactory(new PropertyValueFactory("Name_Proc"));

                column4.setText("Capacite");
                column4.setCellValueFactory(new PropertyValueFactory("Capacite"));

                column5.setText("Logiciel");
                column5.setCellValueFactory(new PropertyValueFactory("Designation_Logiciel"));

                column6.setText("Jeux");
                column6.setCellValueFactory(new PropertyValueFactory("Designation_Jeux"));

                column7.setText("Note");
                column7.setCellValueFactory(new PropertyValueFactory("Note"));

                column8.setText("Fidelite");
                column8.setCellValueFactory(new PropertyValueFactory("Fidelite"));

                table_config.setItems(null);
                table_config.setItems(data);
                table_config.setVisible(true);

            } catch (Exception e) {
                alert.setTitle("Error Dialog"); // titre du dialog
                alert.setContentText("Error populate database"); // information de l'exception 

                e = new Exception();

                StringWriter sw = new StringWriter(); // pour ecrir de chaine de caractere
                PrintWriter pw = new PrintWriter(sw); // pour afficher les chaines de caractere ecrit  
                e.printStackTrace(pw); // afficher l'exception
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
        } else {
            try {
                cnx = CnxDB.ConnectDB();
                stat = cnx.createStatement();
                data = FXCollections.observableArrayList();
                rs = cnx.createStatement().executeQuery("select Name_GPU,"
                        + " CPU_Name,"
                        + " Name_Proc,"
                        + " Capacite,"
                        + " Designation_Logiciel,"
                        + " Designation_Jeux,"
                        + " Note,"
                        + " Fidelite from result"
                        + " where"
                        + " CPU_Name ='" + var_carte_mere + "'"
                        + " and"
                        + " Designation_Logiciel = '" + var_soft + "';");

                while (rs.next()) {
                    data.add(new Result_Config(
                            rs.getString("Name_GPU"),//definition parametre
                            rs.getString("CPU_Name"),
                            rs.getString("Name_Proc"),
                            rs.getString("Capacite"),
                            rs.getString("Designation_Logiciel"),
                            rs.getString("Designation_Jeux"),
                            rs.getInt("Note"),
                            rs.getInt("Fidelite"))); // erreur base de donnee , a modifier plus tard en fiabilite

                }
                column1.setText("Name_GPU");
                column1.setCellValueFactory(new PropertyValueFactory("Name_GPU"));

                column2.setText("CPU_Name");
                column2.setCellValueFactory(new PropertyValueFactory("CPU_Name"));

                column3.setText("Name_Proc");
                column3.setCellValueFactory(new PropertyValueFactory("Name_Proc"));

                column4.setText("Capacite");
                column4.setCellValueFactory(new PropertyValueFactory("Capacite"));

                column5.setText("Logiciel");
                column5.setCellValueFactory(new PropertyValueFactory("Designation_Logiciel"));

                column6.setText("Jeux");
                column6.setCellValueFactory(new PropertyValueFactory("Designation_Jeux"));

                column7.setText("Note");
                column7.setCellValueFactory(new PropertyValueFactory("Note"));

                column8.setText("Fidelite");
                column8.setCellValueFactory(new PropertyValueFactory("Fidelite"));

                table_config.setItems(null);
                table_config.setItems(data);
                table_config.setVisible(true);

            } catch (Exception e) {
                alert.setTitle("Error Dialog"); // titre du dialog
                alert.setContentText("Error populate database"); // information de l'exception 

                e = new Exception();

                StringWriter sw = new StringWriter(); // pour ecrir de chaine de caractere
                PrintWriter pw = new PrintWriter(sw); // pour afficher les chaines de caractere ecrit  
                e.printStackTrace(pw); // afficher l'exception
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
    }

    public void Display_Color() {

        if (var_soft == null) {
            try {
                cnx = CnxDB.ConnectDB();

                String sql = ("select  Note,"
                        + " Fidelite from result "
                        + " where"
                        + " Name_GPU = '" + var_carte_graphique + "' "
                        + " and "
                        + " CPU_Name ='" + var_carte_mere + "' "
                        + " and"
                        + " Name_Proc = '" + var_proc + "' "
                        + " and "
                        + " Designation_Jeux = '" + var_jeux + "' ;");

                ps = cnx.prepareStatement(sql);
                rs = ps.executeQuery();

                if (rs.next()) {
                    rs.getInt("Note");
                    rs.getInt("Fidelite");

                    note = rs.getInt("Note");
                    fiabilité = rs.getInt("Fidelite");
                }

            } catch (Exception e) {
                alert.setTitle("Error Dialog"); // titre du dialog
                alert.setContentText("Error populate database"); // information de l'exception 

                e = new Exception();

                StringWriter sw = new StringWriter(); // pour ecrir de chaine de caractere
                PrintWriter pw = new PrintWriter(sw); // pour afficher les chaines de caractere ecrit  
                e.printStackTrace(pw); // afficher l'exception
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
        } else {
            try {
                cnx = CnxDB.ConnectDB();

                String sql = ("select  Note,"
                        + " Fidelite from result "
                        + " where"
                        + " Name_GPU = '" + var_carte_graphique + "' "
                        + " and "
                        + " CPU_Name ='" + var_carte_mere + "' "
                        + " and"
                        + " Name_Proc = '" + var_proc + "' "
                        + " and "
                        + " Designation_Logiciel = '" + var_soft + "';");

                ps = cnx.prepareStatement(sql);
                rs = ps.executeQuery();

                if (rs.next()) {
                    rs.getInt("Note");
                    rs.getInt("Fidelite");

                    note = rs.getInt("Note");
                    fiabilité = rs.getInt("Fidelite");
                }

            } catch (Exception e) {
                alert.setTitle("Error Dialog"); // titre du dialog
                alert.setContentText("Error populate database"); // information de l'exception 

                e = new Exception();

                StringWriter sw = new StringWriter(); // pour ecrir de chaine de caractere
                PrintWriter pw = new PrintWriter(sw); // pour afficher les chaines de caractere ecrit  
                e.printStackTrace(pw); // afficher l'exception
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
        if (var_soft == null && var_jeux == null) {

            JOptionPane.showMessageDialog(null, "Please make your choice between games or software");
        }

        if (fiabilité == 5) {
            Label lbl_fiabilite1 = new Label(fiabilité.toString() + "/10");
            lbl_fiabilite1.setId("code-orange");
            box.getChildren().add(lbl_fiabilite1);

        } else {

            if (fiabilité < 5) {
                Label lbl_fiabilite2 = new Label(fiabilité.toString() + "/10");
                lbl_fiabilite2.setId("code-rouge");
                box.getChildren().add(lbl_fiabilite2);
            } else {
                Label lbl_fiabilite3 = new Label(fiabilité.toString() + "/10");
                lbl_fiabilite3.setId("code-vert");
                box.getChildren().add(lbl_fiabilite3);
            }

        }

    }

    public void Display_config() {

        if (var_jeux == null) {
            config.setText("Configurations : "
                    + var_carte_mere
                    + " + "
                    + var_proc
                    + " + "
                    + var_carte_graphique
                    + " + "
                    + var_ram
                    + " + "
                    + var_os
                    + " + "
                    + var_soft);
        } else {
            config.setText("Configurations : "
                    + var_carte_mere
                    + " + "
                    + var_proc
                    + " + "
                    + var_carte_graphique
                    + " + "
                    + var_ram
                    + " + "
                    + var_os
                    + " + "
                    + var_jeux);
        }
    }

    @FXML
    private void insert_config_open(ActionEvent event) throws IOException {

        Parent root = FXMLLoader.load(getClass().getResource("/FXMLApplication/Insert_config.fxml"));

        Scene scene = new Scene(root);

        Stage stage = new Stage();
        stage.setScene(scene);
        stage.setTitle("Submit");
        stage.getIcons().add(new Image("/Ressources/logijeu.PNG"));
        stage.setResizable(false);
        stage.show();
    }

    public void Display_note() {

        if (note == 5) {
            lbl_couleur.setText(note.toString() + "/10");
            lbl_couleur.setId("code-orange");

        } else {

            if (note < 5) {
                lbl_couleur.setText(note.toString() + "/10");
                lbl_couleur.setId("code-rouge");

            } else {
                lbl_couleur.setText(note.toString() + "/10");
                lbl_couleur.setId("code-vert");

            }

        }
    }

    public void txt_mim() {
        txt_minimum.setText(readFile());
    }

    private String readFile() {

        StringBuilder stringBuffer = new StringBuilder();
        BufferedReader bufferedReader = null;

        try {

            FileInputStream fstream = new FileInputStream(filePath);
            bufferedReader = new BufferedReader(new InputStreamReader(fstream));

            String strLine;
            while ((strLine = bufferedReader.readLine()) != null) {
                stringBuffer.append(strLine);
                stringBuffer.append(System.getProperty("line.separator")); // permert d'organiser le texte 
            }

        } catch (FileNotFoundException ex) {
            Logger.getLogger(Programm_setting.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Programm_setting.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                bufferedReader.close();
            } catch (IOException ex) {
                Logger.getLogger(Programm_setting.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return stringBuffer.toString();
    }

    public void txt_reco() {
        txt_recommended.setText(readline());

    }

    public String readline() {
        StringBuilder stringBuffer = new StringBuilder();
        BufferedReader bufferedReader = null;

        try {

            FileInputStream fstream = new FileInputStream(filePath2);
            bufferedReader = new BufferedReader(new InputStreamReader(fstream));

            String strLine;
            while ((strLine = bufferedReader.readLine()) != null) {
                stringBuffer.append(strLine);
                stringBuffer.append(System.getProperty("line.separator"));
            }

        } catch (FileNotFoundException ex) {
            Logger.getLogger(Programm_setting.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Programm_setting.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                bufferedReader.close();
            } catch (IOException ex) {
                Logger.getLogger(Programm_setting.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return stringBuffer.toString();
    }

    //  utilisation d'une methode incluse dans java pour afficher une page web via un hypertext dans le navigateur par defaut (Desktop.getDesktop().browse)
    @FXML
    private void hp_materiel(ActionEvent event) throws IOException, URISyntaxException {
        Desktop.getDesktop().browse(new URI("http://www.materiel.net/"));
    }

    @FXML
    private void hp_ldlc(ActionEvent event) throws URISyntaxException, IOException {
        Desktop.getDesktop().browse(new URI("http://www.ldlc.com/"));
    }

    @FXML
    private void hp_topachat(ActionEvent event) throws URISyntaxException, IOException {
        Desktop.getDesktop().browse(new URI("http://www.topachat.com/accueil/index.php"));

    }

}
