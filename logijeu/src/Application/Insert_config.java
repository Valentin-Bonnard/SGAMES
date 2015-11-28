package Application;

import ConnectDB.CnxDB;
import java.net.URL;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TextField;

/**
 *
 * @author Bonnard_Valentin
 * stage servant d'insert pour les client afin de soumettre leur config tester ou pas en raison de la note de fiabilite
 * 
 */
public class Insert_config implements Initializable{
    @FXML
    private TextField txtname_gpu;
    @FXML
    private TextField txtcpu_name;
    @FXML
    private TextField txt_nameproc;
    @FXML
    private TextField txt_capacite;
    @FXML
    private TextField txt_designation_jeux;
    @FXML
    private TextField txt_designation_soft;
    @FXML
    private TextField txt_fidelite;

    Connection cnx = null;
    CallableStatement cs = null;
    
    @Override
    public void initialize(URL url, ResourceBundle resources) {
        
    }

    @FXML
    private void insert_avis(ActionEvent event) {
        
        // appelle d'une procedure stockee pour l'insert de config par l'utilisateur avec une note de fidelite
        
        try {
            cnx = CnxDB.ConnectDB();
            cs = cnx.prepareCall(" {call ca_insertconfig(?, ?, ?, ?, ?, ?, ? , ?) } ");

            cs.setString(1, txtname_gpu.getText());
            cs.setString(2, txtcpu_name.getText());
            cs.setString(3, txt_nameproc.getText());
            cs.setString(4, txt_capacite.getText());
            cs.setString(5, txt_designation_soft.getText());
            cs.setString(6, txt_designation_jeux.getText());
            cs.setString(7, ""); // param note , c'est pour l'admin pas pour les client 
            cs.setString(8, txt_fidelite.getText()); // "note" relative fait pour les clients 
            cs.execute();

        } catch (SQLException ex) {
            Logger.getLogger(Insert_config.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }
    
}
