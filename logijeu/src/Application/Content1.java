package Application;

import ConnectDB.CnxDB;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ResourceBundle;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.ComboBox;
import javax.swing.JOptionPane;

/**
 *
 * @author Bonnard_Valentin
 * content 1 = recherche de comptabilite de composant
 * en les soumettant entre elles combobox pour choisir les composant voulue -->
 * variables pour le result creation de variable contenant les elements contenue
 * dans les combobox via un actionlistener sur l'item selectionner puis mit dans
 * une variable utilisation de get set
 * les valeurs des combobox sont associé a une variable qui elle-meme sera utilise dans le result et le result_automatique.
 */
public class Content1 implements Initializable {

    @FXML
    private ComboBox<String> comboProcessor;
    @FXML
    private ComboBox<String> comboMotherboard;
    @FXML
    private ComboBox<String> comboGC;
    @FXML
    private ComboBox<String> comboRam;
    @FXML
    private ComboBox<String> comboOS;
    @FXML
    private ComboBox<String> comboGames;
    @FXML
    private ComboBox<String> comboSoftware;

    Connection cnx;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private static String var_proc;
    private static String var_carte_mere;
    private static String var_carte_graphique;
    private static String var_ram;
    private static String var_jeux;
    private static String var_os;
    private static String var_soft;

    Alert alert = new Alert(AlertType.ERROR);

    @Override
    public void initialize(URL url, ResourceBundle rb) {

        ComboProc();
        ComboCarte_mere();
        ComboCarte_graphique();
        Comboram();
        ComboJeux();
        ComboOS();
        comboSoft();

    }

    public void ComboProc() { // methode combobox avec selection cible de la base de donnée et mise en place afin d'une selection 
        comboProcessor.getItems().clear();

        try {

            cnx = CnxDB.ConnectDB();
            String sql = "select Name_Proc from processeur;";
            ps = cnx.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                String name = rs.getString("Name_Proc");
                comboProcessor.getItems().addAll(name);

            }

        } catch (Exception e) {
            
            alert.setTitle("Error Dialog");
            alert.setContentText("Error" + e);
            alert.showAndWait();
        }

        // creation d'une action listener sur l'item selectionner afin de l'utiliser comme variable dans une autre classe
        comboProcessor.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>() {
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {

                var_proc = newValue;
            }
        });
    }

    public void ComboCarte_mere() {
        comboMotherboard.getItems().clear();
        try {
            cnx = CnxDB.ConnectDB();
            String sql = "select CPU_Name from carte_mere;";
            ps = cnx.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                String name = rs.getString("CPU_Name");
                comboMotherboard.getItems().addAll(name);
            }

        } catch (Exception e) {
            
            alert.setTitle("Error Dialog");
            alert.setContentText("Error" + e);
            alert.showAndWait();
        }

        // creation d'une action listener sur l'item selectionner afin de l'utiliser comme variable dans une autre classe
        comboMotherboard.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>() {
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {

                var_carte_mere = newValue;
            }
        });
    }

    public void ComboCarte_graphique() {
        comboGC.getItems().clear();
        try {
            cnx = CnxDB.ConnectDB();
            String sql = "select Name_GPU from carte_graphique;";
            ps = cnx.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                String name = rs.getString("Name_GPU");
                comboGC.getItems().addAll(name);
            }

        } catch (Exception e) {
            
            alert.setTitle("Error Dialog");
            alert.setContentText("Error" + e);
            alert.showAndWait();
        }

        // creation d'une action listener sur l'item selectionner afin de l'utiliser comme variable dans une autre classe
        comboGC.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>() {
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {

                var_carte_graphique = newValue;
            }
        });
    }

    public void Comboram() {
        comboRam.getItems().clear();
        try {
            cnx = CnxDB.ConnectDB();
            String sql = "select Capacite from memoire;";
            ps = cnx.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                String name = rs.getString("Capacite");
                comboRam.getItems().addAll(name);
            }

        } catch (Exception e) {
            
            alert.setTitle("Error Dialog");
            alert.setContentText("Error" + e);
            alert.showAndWait();
        }

        // creation d'une action listener sur l'item selectionner afin de l'utiliser comme variable dans une autre classe
        comboRam.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>() {
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {

                var_ram = newValue;
            }
        });
    }

    public void ComboOS() {

        comboOS.getItems().clear();
        try {
            cnx = CnxDB.ConnectDB();
            String sql = "select type_os from os;";
            ps = cnx.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                String name = rs.getString("type_os");
                comboOS.getItems().addAll(name);
            }

        } catch (Exception e) {
            
            alert.setTitle("Error Dialog");
            alert.setContentText("Error" + e);
            alert.showAndWait();
        }

        // creation d'une action listener sur l'item selectionner afin de l'utiliser comme variable dans une autre classe
        comboOS.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>() {
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {

                var_os = newValue;
            }
        });
    }

    public void ComboJeux() {
        comboGames.getItems().clear();
        try {
            cnx = CnxDB.ConnectDB();
            String sql = "select Designation from jeux;";
            ps = cnx.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                String name = rs.getString("Designation");
                comboGames.getItems().addAll(name);
            }

        } catch (Exception e) {
            
            alert.setTitle("Error Dialog");
            alert.setContentText("Error" + e);
            alert.showAndWait();
        }

        // creation d'une action listener sur l'item selectionner afin de l'utiliser comme variable dans une autre classe
        comboGames.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>() {
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {

                var_jeux = newValue;
            }
        });
    }

    public void comboSoft() {

        comboSoftware.getItems().clear();
        try {
            cnx = CnxDB.ConnectDB();
            String sql = "select Designation from logiciels;";
            ps = cnx.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                String name = rs.getString("Designation");
                comboSoftware.getItems().addAll(name);
            }

        } catch (Exception e) {
            
            alert.setTitle("Error Dialog");
            alert.setContentText("Error" + e);
            alert.showAndWait();
        }

        // creation d'une action listener sur l'item selectionner afin de l'utiliser comme variable dans une autre classe
        comboSoftware.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>() {
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {

                var_soft = newValue;
            }
        });
    }

    @FXML
    private void result_search(ActionEvent event) {

        if (var_carte_graphique == null & var_carte_mere == null & var_os == null & var_proc == null & var_ram == null) {
            JOptionPane.showMessageDialog(null, "Please choose your composants");
        } else {
            Constructor.loadContent(Constructor.CONTENT2);
        }

    }

    public String getvar_proc() { //get pour la variable du combobox processeur

        return var_proc;
    }

    public void setvar_proc(String var_proc) { // set pour la variable du combobox processeur
        this.var_proc = var_proc;
    }

    public String getvar_carte_mere() { //get pour la variable du combobox carte-mere

        return var_carte_mere;
    }

    public void setvar_carte_mere(String var_carte_mere) { //set pour la variable du combobox carte-mere
        this.var_carte_mere = var_carte_mere;
    }

    public String getvar_carte_graphique() { //get pour la variable du combobox carte-graphique

        return var_carte_graphique;
    }

    public void setvar_carte_graphique(String var_carte_graphique) { //set pour la variable du combobox carte-graphique
        this.var_carte_graphique = var_carte_graphique;
    }

    public String getvar_ram() { //get pour la variable du combobox ram

        return var_ram;
    }

    public void setvar_ram(String var_ram) { //set pour la variable du combobox ram
        this.var_ram = var_ram;
    }

    public String getvar_jeux() { //get pour la variable du combobox jeux

        return var_jeux;
    }

    public void setvar_jeux(String var_jeux) { //set pour la variable du combobox jeux
        this.var_jeux = var_jeux;
    }

    public String getvar_os() { //get pour la variable du combobox os

        return var_os;
    }

    public void setvar_os(String var_os) { //set pour la variable du combobox os
        this.var_os = var_os;
    }

    public String getvar_soft() { //get pour la variable du combobox logiciels

        return var_soft;
    }

    public void setvar_soft(String var_soft) { //set pour la variable du combobox logiciels
        this.var_soft = var_soft;
    }
}
