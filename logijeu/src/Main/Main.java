package Main;

import javafx.application.Application;
import static javafx.application.Application.launch;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

/**
 *
 * @author Bonnard_Valentin
 */
public class Main extends Application {
    
    

    /* Methode de chargement du login, elle fait office de main */
    @Override
    public void start(Stage stage) throws Exception {

        Parent root = FXMLLoader.load(getClass().getResource("/FXMLcnx/Login.fxml"));

        Scene scene = new Scene(root);

        stage.setScene(scene);
        stage.initStyle(StageStyle.UNIFIED);
        stage.setTitle("LOGIJEU Login");
        stage.getIcons().add(new Image("/Ressources/logijeu.PNG"));
        stage.setResizable(false);
        stage.show();

        
    }

    public static void main(String[] args) {
        launch(args);
        
       
        
    }
}
