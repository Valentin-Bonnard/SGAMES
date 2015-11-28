package Controller_Administrator;

import ConnectDB.CnxDB;
import TableView_Administrator.Client;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ResourceBundle;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
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
import javafx.scene.control.Button;
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
public class ViewClient implements Initializable {

    @FXML
    private TableView<Client> tableClient;
    @FXML
    private TableColumn<Client, String> prenomClient;
    @FXML
    private TableColumn<Client, String> nomClient;
    @FXML
    private GridPane infoClient;
    @FXML
    private Button retour;

    Connection cnx = null;
    ResultSet rs = null;
    Statement stat = null;

    Alert alert = new Alert(AlertType.ERROR); // pour afficher un dialog erreur

    @Override
    public void initialize(URL url, ResourceBundle rb) {

        // rentrer valeur des prenom et nom des clients dans un tableau 
        prenomClient.setCellValueFactory(cellData -> cellData.getValue().prenom_clientProperty());
        nomClient.setCellValueFactory(cellData -> cellData.getValue().nom_clientProperty());

        ViewClientprenomNom();
    }

    @FXML
    private void retour(ActionEvent event) throws IOException {

        ((Node) (event.getSource())).getScene().getWindow().hide();
        Parent parent = FXMLLoader.load(getClass().getResource("/FXMLAdministrator/Administrator.fxml"));
        Stage stage = new Stage();
        Scene scene = new Scene(parent);
        stage.setScene(scene);
        stage.setTitle("Hub");
        stage.getIcons().add(new Image("/Ressources/logijeu.PNG"));
        stage.setResizable(false);
        stage.show();

    }

    public void ViewClientprenomNom() {

        ObservableList<Client> data;
        try {
            cnx = CnxDB.ConnectDB();
            stat = cnx.createStatement();

            data = FXCollections.observableArrayList();
            rs = cnx.createStatement().executeQuery("select prenom_client,"
                    + " nom_client,"
                    + " mail_client,"
                    + " adresse_client,"
                    + " ville_client,"
                    + " pays_client from client;");

            while (rs.next()) {
                data.add(new Client(
                        rs.getString("prenom_client"),
                        rs.getString("nom_client"),
                        rs.getString("mail_client"),
                        rs.getString("adresse_client"),
                        rs.getString("ville_client"),
                        rs.getString("pays_client")
                ));
            }

            prenomClient.setCellValueFactory(new PropertyValueFactory("prenom_client"));

            nomClient.setCellValueFactory(new PropertyValueFactory("nom_client"));

            tableClient.setItems(null);
            tableClient.setItems(data);

            // mise en relation tableclient et le gridpane afin de pouvoir en clickant sur un prenom 
            // avoir dans le gridpane les info du client 
            tableClient.getSelectionModel().selectedItemProperty().addListener(
                    new ChangeListener<Client>() {

                        @Override
                        public void changed(ObservableValue<? extends Client> observable, Client oldValue, Client newValue) {

                            infoClient.getChildren().clear();

                            Label lblprenom = new Label();
                            Label lblnom = new Label();
                            Label lblmail = new Label();
                            Label lbladresse = new Label();
                            Label lblville = new Label();
                            Label lblpays = new Label();

                            lblprenom.setText(newValue.getprenom_client()); //la nouvelle valeur du prenom et l'ajouter au gridpane
                            infoClient.add(lblprenom, 1, 0); // ajout de cette valeur a l'emplacement du Gridpane

                            lblnom.setText(newValue.getnom_client()); //la nouvelle valeur du nom et l'ajouter au gridpane
                            infoClient.add(lblnom, 1, 1); // ajout de cette valeur a l'emplacement du Gridpane

                            lblmail.setText(newValue.getmail_client()); //la nouvelle valeur du mail et l'ajouter au gridpane
                            infoClient.add(lblmail, 1, 2); // ajout de cette valeur a l'emplacement du Gridpane

                            lbladresse.setText(newValue.getadresse_client()); //la nouvelle valeur du adresse et l'ajouter au gridpane
                            infoClient.add(lbladresse, 1, 3); // ajout de cette valeur a l'emplacement du Gridpane

                            lblville.setText(newValue.getville_client()); //la nouvelle valeur du ville et l'ajouter au gridpane
                            infoClient.add(lblville, 1, 4); // ajout de cette valeur a l'emplacement du Gridpane

                            lblpays.setText(newValue.getpays_client()); //la nouvelle valeur du pays et l'ajouter au gridpane
                            infoClient.add(lblpays, 1, 5); // ajout de cette valeur a l'emplacement du Gridpane

                            Label prenom = new Label(); // creation de label dynamique
                            Label nom = new Label(); // creation de label dynamique
                            Label mail = new Label(); // creation de label dynamique
                            Label adresse = new Label(); // creation de label dynamique
                            Label ville = new Label(); // creation de label dynamique
                            Label pays = new Label(); // creation de label dynamique

                            prenom.setText("Prenom :");
                            infoClient.add(prenom, 0, 0); // ajout du label crée dans l'emplacement du gridpane

                            nom.setText("Nom de famille :");
                            infoClient.add(nom, 0, 1); // ajout du label crée dans l'emplacement du gridpane

                            mail.setText("Mail : ");
                            infoClient.add(mail, 0, 2); // ajout du label crée dans l'emplacement du gridpane

                            adresse.setText("Adresse : ");
                            infoClient.add(adresse, 0, 3); // ajout du label crée dans l'emplacement du gridpane

                            ville.setText("Ville : ");
                            infoClient.add(ville, 0, 4); // ajout du label crée dans l'emplacement du gridpane

                            pays.setText("Pays : ");
                            infoClient.add(pays, 0, 5); // ajout du label crée dans l'emplacement du gridpane
                        }
                    }
            );

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
