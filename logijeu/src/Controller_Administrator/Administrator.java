package Controller_Administrator;

import ConnectDB.CnxDB;
import TableView_Administrator.Suggestion;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
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
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextArea;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.image.Image;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Priority;
import javafx.stage.Stage;

/**
 *
 * @author Bonnard_Valentin
 */
public class Administrator implements Initializable {

    Connection cnx = null;
    ResultSet rs = null;
    Statement stat = null;

    Alert alert = new Alert(AlertType.ERROR); // pour afficher un dialog erreur
    
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
    private TableView tableAdministrator;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        TableAdminSuggestion();
    }

    @FXML
    private void infoclient(ActionEvent event) throws Exception {

        ((Node) (event.getSource())).getScene().getWindow().hide();
        Parent parent = FXMLLoader.load(getClass().getResource("/FXMLAdministrator/ViewClient.fxml"));
        Stage stage = new Stage();
        Scene scene = new Scene(parent);

        stage.setScene(scene);
        stage.setTitle("LOGIJEU Login");
        stage.getIcons().add(new Image("/Ressources/logijeu.PNG"));
        stage.setResizable(false);
        stage.show();

    }

    @FXML
    private void deconnexion(ActionEvent event) throws Exception {

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

    public void TableAdminSuggestion() {
        
        //creation d'une liste et utilisation afin d'afficher les suggestion des clients dans un tableview
        ObservableList<Suggestion> data;
        try {
            cnx = CnxDB.ConnectDB();
            stat = cnx.createStatement();

            data = FXCollections.observableArrayList();
            rs = cnx.createStatement().executeQuery("Select Processeur,"
                    + "Carte_mere,"
                    + "Carte_graphique,"
                    + "RAM_GB_,"
                    + "OS,"
                    + "Jeux,"
                    + "Mail_Client,"
                    + "Numero_Portable from suggestion;");

            while (rs.next()) {
                data.add(new Suggestion(
                        rs.getString("Processeur"),
                        rs.getString("Carte_mere"),
                        rs.getString("Carte_graphique"),
                        rs.getString("RAM_GB_"),
                        rs.getString("OS"),
                        rs.getString("Jeux"),
                        rs.getString("Mail_Client"),
                        rs.getString("Numero_Portable")
                ));
            }
            column1.setText("Nom Processeur");
            column1.setCellValueFactory(new PropertyValueFactory("Processeur"));

            column2.setText("Nom Carte_mere");
            column2.setCellValueFactory(new PropertyValueFactory("Carte_mere"));

            column3.setText("Nom Carte_graphique");
            column3.setCellValueFactory(new PropertyValueFactory("Carte_graphique"));

            column4.setText("RAM_GB");
            column4.setCellValueFactory(new PropertyValueFactory("RAM_GB_"));

            column5.setText("OS");
            column5.setCellValueFactory(new PropertyValueFactory("OS"));

            column6.setText("Jeux");
            column6.setCellValueFactory(new PropertyValueFactory("Jeux"));

            column7.setText("Mail_Client");
            column7.setCellValueFactory(new PropertyValueFactory("Mail_Client"));

            column8.setText("Numero_Portable");
            column8.setCellValueFactory(new PropertyValueFactory("Numero_Portable"));

            tableAdministrator.setItems(null);
            tableAdministrator.setItems(data);

        } catch (Exception e) {
            
            // message exception avec defilement des erreurs.
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
