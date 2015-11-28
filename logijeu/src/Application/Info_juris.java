package Application;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TextArea;
import javafx.stage.Stage;

/**
 *
 * @author User
 */
public class Info_juris implements Initializable {

    String filePath = "logijeu_eula.txt";
    
    
    @FXML
    private TextArea text_area;
    @FXML
    private Button close_button;

    @Override
    public void initialize(URL url, ResourceBundle rb) {

        read_eula();
    }

    @FXML
    private void close_info_juris(ActionEvent event) {

        Stage stage = (Stage) close_button.getScene().getWindow();
        stage.close();
    }

    public void read_eula() {
        text_area.setText(readFile());
        
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
}

    

