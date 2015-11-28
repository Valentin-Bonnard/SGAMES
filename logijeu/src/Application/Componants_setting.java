package Application;

import ConnectDB.CnxDB;
import TableView.Carte_Mere;
import TableView.Carte_graphique;
import TableView.Jeux;
import TableView.Logiciel;
import TableView.Memoire;
import TableView.Processeur;
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
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextArea;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Priority;

/**
 *
 * @author Bonnard_Valentin afficher l'ensemble des composants dans des tableau
 * repartit par type de produit servant a renseigner le client sur les articles
 * pris en compte
 */
public class Componants_setting implements Initializable {

    Connection cnx = null;
    ResultSet rs = null;
    Statement stat = null;

    Alert alert = new Alert(AlertType.ERROR);

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
    private TableColumn column9;
    @FXML
    private TableView table_view;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        table_view.setVisible(false);

    }

    @FXML
    private void jeuxtable(ActionEvent event) {
        ObservableList<Jeux> data; // creation liste via ma classe jeux
        try {
            cnx = CnxDB.ConnectDB();
            stat = cnx.createStatement();
            data = FXCollections.observableArrayList();
            rs = cnx.createStatement().executeQuery("select Designation,"
                    + "Genre,"
                    + " PEGI,"
                    + " Type_Media from jeux;");
            while (rs.next()) {
                data.add(new Jeux(
                        rs.getString("Designation"), //definition parametre
                        rs.getString("Genre"),
                        rs.getString("Type_Media"),
                        rs.getInt("PEGI")));
            }
            column1.setText("Designation");
            column1.setCellValueFactory(new PropertyValueFactory("Designation"));

            column2.setText("Genre");
            column2.setCellValueFactory(new PropertyValueFactory("Genre"));

            column3.setText("Type_Media");
            column3.setCellValueFactory(new PropertyValueFactory("Type_Media"));

            column4.setText("PEGI");
            column4.setCellValueFactory(new PropertyValueFactory("PEGI"));

            column5.setText(null);
            column6.setText(null);
            column7.setText(null);
            column8.setText(null);
            column9.setText(null);

            table_view.setItems(null);
            table_view.setItems(data);
            table_view.setVisible(true);

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

    @FXML
    private void proctable(ActionEvent event) {

        ObservableList<Processeur> data;
        try {
            cnx = CnxDB.ConnectDB();
            stat = cnx.createStatement();
            data = FXCollections.observableArrayList();
            rs = cnx.createStatement().executeQuery("select Name_Proc,"
                    + " Cpu_Speed,"
                    + " Physical_Cores,"
                    + " Cpu_socket,"
                    + " CPU_Codename from processeur;");
            while (rs.next()) {
                data.add(new Processeur(
                        rs.getString("Name_Proc"),
                        rs.getString("Cpu_Speed"),
                        rs.getString("Physical_Cores"),
                        rs.getString("Cpu_socket"),
                        rs.getString("CPU_Codename")));
            }
            column1.setText("Nom Processeur");
            column1.setCellValueFactory(new PropertyValueFactory("Name_Proc"));

            column2.setText("Vitesse Processeur");
            column2.setCellValueFactory(new PropertyValueFactory("Cpu_Speed"));

            column3.setText("Core Processeur");
            column3.setCellValueFactory(new PropertyValueFactory("Physical_Cores"));

            column4.setText("Socket Processeur");
            column4.setCellValueFactory(new PropertyValueFactory("Cpu_socket"));

            column5.setText("Processeur Surnom");
            column5.setCellValueFactory(new PropertyValueFactory("CPU_Codename"));

            column6.setText(null);
            column7.setText(null);
            column8.setText(null);
            column9.setText(null);

            table_view.setItems(null);
            table_view.setItems(data);
            table_view.setVisible(true);

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

    @FXML
    private void graphtable(ActionEvent event) {
        ObservableList<Carte_graphique> data;
        try {
            cnx = CnxDB.ConnectDB();
            stat = cnx.createStatement();
            data = FXCollections.observableArrayList();
            rs = cnx.createStatement().executeQuery("select Name_GPU,"
                    + " Memory,"
                    + " Pixel_Rate,"
                    + " Direct_X,"
                    + " Resolution__WxH_ from carte_graphique;");
            while (rs.next()) {
                data.add(new Carte_graphique(
                        rs.getString("Name_GPU"),
                        rs.getString("Memory"),
                        rs.getString("Pixel_Rate"),
                        rs.getString("Direct_X"),
                        rs.getString("Resolution__WxH_")));
            }
            column1.setText("Nom Carte-graphique");
            column1.setCellValueFactory(new PropertyValueFactory("Name_GPU"));

            column2.setText("Memoire");
            column2.setCellValueFactory(new PropertyValueFactory("Memory"));

            column3.setText("Pixel");
            column3.setCellValueFactory(new PropertyValueFactory("Pixel_Rate"));

            column4.setText("Direct");
            column4.setCellValueFactory(new PropertyValueFactory("Direct_X"));

            column5.setText("Resolution");
            column5.setCellValueFactory(new PropertyValueFactory("Resolution__WxH_"));

            column6.setText(null);
            column7.setText(null);
            column8.setText(null);
            column9.setText(null);

            table_view.setItems(null);
            table_view.setItems(data);
            table_view.setVisible(true);

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

    @FXML
    private void CAtable(ActionEvent event) {
        ObservableList<Carte_Mere> data;
        try {
            cnx = CnxDB.ConnectDB();
            stat = cnx.createStatement();
            data = FXCollections.observableArrayList();
            rs = cnx.createStatement().executeQuery("select CPU_Name,"
                    + " Chipset,"
                    + " Total_RAM,"
                    + " Total_USB,"
                    + " Memory_Type,"
                    + " Memory_Capacity,"
                    + " Memory_Total,"
                    + " Memory_Speed,"
                    + " GPU_Interface from carte_mere;");
            while (rs.next()) {
                data.add(new Carte_Mere(
                        rs.getString("CPU_Name"),
                        rs.getString("Chipset"),
                        rs.getString("Total_RAM"),
                        rs.getString("Total_USB"),
                        rs.getString("Memory_Type"),
                        rs.getString("Memory_Capacity"),
                        rs.getString("Memory_Total"),
                        rs.getString("Memory_Speed"),
                        rs.getString("GPU_Interface")
                ));
            }
            column1.setText("Nom Carte-mere");
            column1.setCellValueFactory(new PropertyValueFactory("CPU_Name"));

            column2.setText("Chipset");
            column2.setCellValueFactory(new PropertyValueFactory("Chipset"));

            column3.setText("Ramm total");
            column3.setCellValueFactory(new PropertyValueFactory("Total_RAM"));

            column4.setText("Usb total");
            column4.setCellValueFactory(new PropertyValueFactory("Total_USB"));

            column5.setText("Type de mémoire");
            column5.setCellValueFactory(new PropertyValueFactory("Memory_Type"));

            column6.setText("Capacité mémoire");
            column6.setCellValueFactory(new PropertyValueFactory("Memory_Capacity"));

            column7.setText("Total mémoire");
            column7.setCellValueFactory(new PropertyValueFactory("Memory_Total"));

            column8.setText("Vitesse mémoire");
            column8.setCellValueFactory(new PropertyValueFactory("Memory_Speed"));

            column9.setText("Interfac carte graphique");
            column9.setCellValueFactory(new PropertyValueFactory("GPU_Interface"));

            table_view.setItems(null);
            table_view.setItems(data);
            table_view.setVisible(true);

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

    @FXML
    private void memoiretable(ActionEvent event) {
        ObservableList<Memoire> data;
        try {
            cnx = CnxDB.ConnectDB();
            stat = cnx.createStatement();
            data = FXCollections.observableArrayList();
            rs = cnx.createStatement().executeQuery("select Constructeur,"
                    + " Capacite,"
                    + " Types,"
                    + " Fraquences from memoire;");

            while (rs.next()) {
                data.add(new Memoire(
                        rs.getString("Constructeur"),
                        rs.getString("Capacite"),
                        rs.getString("Types"),
                        rs.getString("Fraquences")
                ));

            }
            column1.setText("Nom Constructeur");
            column1.setCellValueFactory(new PropertyValueFactory("Constructeur"));

            column2.setText("Capacité memoire");
            column2.setCellValueFactory(new PropertyValueFactory("Capacite"));

            column3.setText("Types memoire");
            column3.setCellValueFactory(new PropertyValueFactory("Types"));

            column4.setText("Fréquences memoire");
            column4.setCellValueFactory(new PropertyValueFactory("Fraquences"));

            column5.setText(null);
            column6.setText(null);
            column7.setText(null);
            column8.setText(null);
            column9.setText(null);

            table_view.setItems(null);
            table_view.setItems(data);
            table_view.setVisible(true);

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

    @FXML
    private void logicielstable(ActionEvent event) {
        ObservableList<Logiciel> data;
        try {
            cnx = CnxDB.ConnectDB();
            stat = cnx.createStatement();
            data = FXCollections.observableArrayList();
            rs = cnx.createStatement().executeQuery("select Designation,"
                    + " Marque,"
                    + " Modele,"
                    + " Compatiblite from logiciels;");

            while (rs.next()) {
                data.add(new Logiciel(
                        rs.getString("Designation"),
                        rs.getString("Marque"),
                        rs.getString("Modele"),
                        rs.getString("Compatiblite")
                ));

            }
            column1.setText("Nom Logiciel");
            column1.setCellValueFactory(new PropertyValueFactory("Designation"));

            column2.setText("Marque");
            column2.setCellValueFactory(new PropertyValueFactory("Marque"));

            column3.setText("Modele");
            column3.setCellValueFactory(new PropertyValueFactory("Modele"));

            column4.setText("Compatiblite");
            column4.setCellValueFactory(new PropertyValueFactory("Compatiblite"));

            column5.setText(null);
            column6.setText(null);
            column7.setText(null);
            column8.setText(null);
            column9.setText(null);

            table_view.setItems(null);
            table_view.setItems(data);
            table_view.setVisible(true);

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
