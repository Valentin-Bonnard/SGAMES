package TableView;

import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

/**
 *
 * @author Valentin Bonnard
 */
public class Logiciel {
    
    public StringProperty Designation;
    public StringProperty Marque;
    public StringProperty Modele;
    public StringProperty Compatiblite;
    
    
    public Logiciel (
            String Designation,
            String Marque,
            String Modele,
            String Compatiblite)
    {
        this.Designation = new SimpleStringProperty(Designation);
        this.Marque = new SimpleStringProperty(Marque);
        this.Modele = new SimpleStringProperty(Modele);
        this.Compatiblite = new SimpleStringProperty(Compatiblite);
    }

    public StringProperty DesignationProperty() {
        return Designation;
    }

    public StringProperty MarqueProperty() {
        return Marque;
    }

    public StringProperty ModeleProperty() {
        return Modele;
    }

    public StringProperty CompatibliteProperty() {
        return Compatiblite;
    }
}
