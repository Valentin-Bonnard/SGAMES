package Application;

import java.io.IOException;
import java.net.URL;
import java.util.List;
import java.util.Optional;
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
import javafx.scene.control.ButtonType;
import javafx.scene.image.Image;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

/**
 *
 * @author Bonnard_Valentin piece de theatre de l'application, content1 result
 * et help s'affiche de maniere dynamique , les autre formes se creer dans des
 * stage independant de l'application general.
 *
 *
 */
public class Main_Application implements Initializable {

    @FXML
    private AnchorPane content;
    Alert alert = new Alert(AlertType.CONFIRMATION);

    @Override
    public void initialize(URL url, ResourceBundle rb) {

    }

    public void setContent(AnchorPane anchorPane) {
        
        //creation d'une liste de fenetre dynamique
        List<Node> nodes = anchorPane.getChildren();
        content.getChildren().clear();
        content.getChildren().addAll(nodes);

    }

    @FXML
    private void close_Application(ActionEvent event) {
        
        // creation de dialog de confirmation avec un choix soit tu ferme l'application ou ferme le dialog
        alert.setTitle("Confirmation Dialog");
        alert.setContentText("Are you ok with this?");

        Optional<ButtonType> result = alert.showAndWait();
        if (result.get() == ButtonType.OK) {
            System.exit(0);
        } else {
            alert.close();
        }
    }

    @FXML
    private void new_search(ActionEvent event) {

        Constructor.loadContent(Constructor.CONTENT1);
    }

    @FXML
    private void open_about(ActionEvent event) throws Exception {

        Parent parent = FXMLLoader.load(getClass().getResource("/FXMLApplication/About.fxml"));
        Stage stage = new Stage();
        Scene scene = new Scene(parent);

        stage.setScene(scene);
        stage.initStyle(StageStyle.UTILITY);
        stage.setTitle("LOGIJEU Login");
        stage.getIcons().add(new Image("/Ressources/logijeu.PNG"));
        stage.setResizable(false);
        stage.show();

    }

    @FXML
    private void componants_setting(ActionEvent event) {
        Constructor.loadContent(Constructor.CONTENT3);
    }

    @FXML
    private void Help_insert(ActionEvent event) {
        Constructor.loadContent(Constructor.CONTENT4);
    }

    @FXML
    private void Programm_setting_open(ActionEvent event) throws Exception {

        Parent parent = FXMLLoader.load(getClass().getResource("/FXMLApplication/Programm_setting.fxml"));
        Stage stage = new Stage();
        Scene scene = new Scene(parent);

        stage.setScene(scene);
        stage.initStyle(StageStyle.UTILITY);
        stage.setTitle("LOGIJEU Settings");
        stage.getIcons().add(new Image("/Ressources/logijeu.PNG"));
        stage.setResizable(false);
        stage.show();
    }

    @FXML
    private void profil(ActionEvent event) throws Exception {

        Parent parent = FXMLLoader.load(getClass().getResource("/FXMLApplication/Client_profil.fxml"));
        Stage stage = new Stage();
        Scene scene = new Scene(parent);

        stage.setScene(scene);
        stage.setTitle("LOGIJEU Client_Profil");
        stage.initStyle(StageStyle.UTILITY);
        stage.getIcons().add(new Image("/Ressources/logijeu.PNG"));
        stage.setResizable(false);
        stage.show();
    }

    @FXML
    private void deco(ActionEvent event) throws Exception {

        ((Node) (event.getSource())).getScene().getWindow().hide();
        Parent parent = FXMLLoader.load(getClass().getResource("/FXMLcnx/Login.fxml"));
        Stage stage = new Stage();
        Scene scene = new Scene(parent);

        stage.setScene(scene);
        stage.setTitle("LOGIJEU Login");
        stage.initStyle(StageStyle.UTILITY);
        stage.getIcons().add(new Image("/Ressources/logijeu.PNG"));
        stage.setResizable(false);
        stage.show();
    }

    @FXML
    private void automatic(ActionEvent event) throws IOException {

        Parent parent = FXMLLoader.load(getClass().getResource("/FXMLApplication/Choice_auto.fxml"));
        Stage stage = new Stage();
        Scene scene = new Scene(parent);

        stage.setScene(scene);
        stage.setTitle("LOGIJEU Choices");
        stage.initStyle(StageStyle.UNIFIED);
        stage.getIcons().add(new Image("/Ressources/logijeu.PNG"));
        stage.setResizable(false);
        stage.show();

    }

}
