package Application;

import ConnectDB.CnxDB;
import Contollers_Connection.Login;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
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
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Priority;
import javafx.stage.Stage;

/**
 *
 * @author User / Valentin Bonnard
 */
public class Choice_auto implements Initializable {

    @FXML
    private Button back_btn;
    @FXML
    private Button next_btn;
    @FXML
    private ComboBox<String> combo_games;
    @FXML
    private ComboBox<String> combo_software;

    Connection cnx;
    PreparedStatement ps = null;
    ResultSet rs = null;

    Login login = new Login();
    String user = login.getvar_user();
    String line;
    String FilePath = "infoComputer" + user + ".txt";

    private static String var_soft;
    private static String var_games;
    private static String varCard_name;
    private static String varSystem_Model;
    private static String varMemory;
    private static String varProcessor;
    private static String replaceCard_name;
    private static String replaceSystem_Model;
    private static String replaceMemory;
    private static String replaceProcessor;
    private static String varCm;
    private static String varCg;
    private static String varM;
    private static String varProc;

    Alert alert = new Alert(AlertType.ERROR);
    Alert alertW = new Alert(AlertType.WARNING);

    @Override
    public void initialize(URL url, ResourceBundle rb) {

        Combo_Games();
        Combo_Software();
        automatisme();

    }

    @FXML
    private void back(ActionEvent event) {

        Stage stage = (Stage) back_btn.getScene().getWindow();
        stage.close();
    }

    @FXML
    private void next(ActionEvent event) {
        if (var_soft == null && var_games == null) {

            alertW.setTitle("Warning dialog");
            alertW.setContentText("Please make your choice between games or software");
            alertW.showAndWait();

        }
        Constructor.loadContent(Constructor.CONTENT5);
        Stage stage = (Stage) next_btn.getScene().getWindow();
        stage.close();

    }

    public void Combo_Software() { // methode combobox avec selection cible de la base de donnée et mise en place afin d'une selection 
        combo_software.getItems().clear();

        try {

            cnx = CnxDB.ConnectDB();
            String sql = "select Designation from logiciels;";
            ps = cnx.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                String name = rs.getString("Designation");
                combo_software.getItems().addAll(name);

            }

        } catch (Exception e) {

            alert.setTitle("Error Dialog");
            alert.setContentText("Error" + e);
            alert.showAndWait();
        }

        // creation d'une action listener sur l'item selectionner afin de l'utiliser comme variable dans une autre classe
        combo_software.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>() {
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {

                var_soft = newValue;
            }
        });
    }

    public void Combo_Games() { // methode combobox avec selection cible de la base de donnée et mise en place afin d'une selection 
        combo_games.getItems().clear();

        try {

            cnx = CnxDB.ConnectDB();
            String sql = "select Designation from jeux;";
            ps = cnx.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                String name = rs.getString("Designation");
                combo_games.getItems().addAll(name);

            }

        } catch (Exception e) {
            alert.setTitle("Error Dialog");
            alert.setContentText("Error" + e);
            alert.showAndWait();
        }

        // creation d'une action listener sur l'item selectionner afin de l'utiliser comme variable dans une autre classe
        combo_games.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>() {
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {

                var_games = newValue;
            }
        });
    }

    public void automatisme() {

        try {
            ProcessBuilder pb = new ProcessBuilder("cmd.exe", "/c", "dxdiag", "/t", FilePath);

            // dxdialog : Commande pour connaître les composants et les caractéristiques de son PC
            //System.out.println("-- Executing dxdiag command --");
            Process p = pb.start();
            p.waitFor();

            BufferedReader br = new BufferedReader(new FileReader(FilePath));

            // System.out.println(String.format("-- Printing %1$1s info --", filePath));
            while ((line = br.readLine()) != null) {

                if (line.trim().startsWith("Card name:")) {

                    varCard_name = line;
                    replaceCard_name = varCard_name.replace("Card name:", "");
                    varCg = replaceCard_name.replaceAll("\\s", "");// enlever l'espace blanc induite au remplacement precedent

                }
                if (line.trim().startsWith("System Model:")) {

                    varSystem_Model = line;
                    replaceSystem_Model = varSystem_Model.replaceAll("System Model:", "");
                    varCm = replaceSystem_Model.replaceAll("\\s", "");// enlever l'espace blanc induite au remplacement precedent

                }

                if (line.trim().startsWith("Memory:")) {

                    varMemory = line;
                    replaceMemory = varMemory.replace("Memory:", "");
                    varM = replaceMemory.replaceAll("\\s", "");// enlever l'espace blanc induite au remplacement precedent

                }

                if (line.trim().startsWith("Processor:")) {

                    varProcessor = line;
                    replaceProcessor = varProcessor.replace("Processor:", "");
                    varProc = replaceProcessor.replaceAll("\\s", ""); // enlever l'espace blanc induite au remplacement precedent

                }

            }
        } catch (IOException | InterruptedException ex) {

            // message exception avec defilement des erreurs.
            alert.setTitle("Exception Dialog"); // titre du dialog
            alert.setHeaderText("Look, an Exception Dialog"); // information de l'exception 

            InterruptedException e = new InterruptedException();

            StringWriter sw = new StringWriter(); // pour ecrir de chaine de caractere
            PrintWriter pw = new PrintWriter(sw);// pour afficher les chaines de caractere ecrit  
            e.printStackTrace(pw);// afficher l'exception
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

            alert.getDialogPane().setExpandableContent(expContent);// defilement de l'exception

            alert.showAndWait();  // crée un bouton ok pour fermer la boite de dialog

        }
    }

    public String getvar_games() { //get pour la variable du combobox jeux

        return var_games;
    }

    public void setvar_games(String var_games) { //set pour la variable du combobox jeux
        this.var_games = var_games;
    }

    public String getvar_soft() { //get pour la variable du combobox logiciel

        return var_soft;
    }

    public void setvar_soft(String var_soft) { //set pour la variable du combobox logiciel
        this.var_soft = var_soft;
    }

    public String getvarCard_name() {

        return varCg;
    }

    public void setvarCard_name(String varCg) {
        this.varCg = varCg;
    }

    public String getvarSystem_Model() {

        return varCm;
    }

    public void setvarSystem_Model(String varCm) {
        this.varCm = varCm;
    }

    public String getvarMemory() {

        return varM;
    }

    public void setvarMemory(String replaceMemory) {
        this.varM = varM;
    }

    public String getvarProcessor() {

        return varProc;
    }

    public void setvarProcessor(String varProc) {
        this.varProc = varProc;
    }

}
