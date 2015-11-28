package Application;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.layout.AnchorPane;

/**
 *
 * @author Bonnard_Valentin
 * Constructeur dynamique entre main application (piece de theatre) et content 1 , composant setting ,  result et help_insert ( scene) 
 */
public class Constructor {

    @FXML
    public static String CONTENT1 = "/FXMLApplication/Content1.fxml"; // chemin du content 1
    @FXML
    public static String CONTENT2 = "/FXMLApplication/Result_content1.fxml"; // chemin du content 2
    @FXML
    public static String CONTENT3 = "/FXMLApplication/Componants_setting.fxml"; // chemin du content 3
    @FXML
    public static String CONTENT4 = "/FXMLApplication/Help_insert.fxml"; // chemin du content 4
    @FXML
    public static String CONTENT5 = "/FXMLApplication/Result_automatic.fxml"; // chemin du content 5 

    @FXML
    private static Main_Application mainController;

    @FXML
    public static void setController(Main_Application controller) {
        Constructor.mainController = controller;
    }

    @FXML
    public static void loadContent(String fxmlFile) {
        try {
            mainController.setContent(
                    (AnchorPane) FXMLLoader.load(Constructor.class.getResource(fxmlFile))
            );
        } catch (IOException ex) {
            Logger.getLogger(Constructor.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
