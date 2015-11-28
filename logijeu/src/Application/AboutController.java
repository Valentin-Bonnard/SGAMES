package Application;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

/**
 * FXML Controller class
 *
 * @author Bonnard_Valentin
 */
public class AboutController implements Initializable {

    @FXML
    private Button btn_OK;
    @FXML
    private Label lbl_info;
    @FXML
    private Label info_juridique;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        ShowInfo();
    }

    public void ShowInfo() {

        lbl_info.setText("Free for personal use");
        info_juridique.setText("Copyright 2015 LogiJeu"
                + "\nPhillipine Loisseau"
                + "\nBonnard Valentin");
    }

    @FXML
    private void close_about(ActionEvent event) {

        Stage stage = (Stage) btn_OK.getScene().getWindow();
        stage.close();
    }

    @FXML
    private void info_juris(ActionEvent event) throws IOException {
        
        Parent parent = FXMLLoader.load(getClass().getResource("/FXMLApplication/Info_juris.fxml"));
        Stage stage = new Stage();
        Scene scene = new Scene(parent);

        stage.setScene(scene);
        stage.initStyle(StageStyle.UTILITY);
        stage.setTitle("LOGIJEU Info_Juridique");
        stage.getIcons().add(new Image("/Ressources/logijeu.PNG"));
        stage.setResizable(false);
        stage.show();
        
    }

}
