package TableView;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

/**
 *
 * @author Valentin Bonnard
 */
public class Jeux {

    public StringProperty Designation;
    public StringProperty Genre;
    public IntegerProperty PEGI;
    public StringProperty Type_Media;

    public Jeux(
            String Designation,
            String Genre,
            String Type_Media,
            int PEGI) {
        
        this.Designation = new SimpleStringProperty(Designation);
        this.Genre = new SimpleStringProperty(Genre);
        this.Type_Media = new SimpleStringProperty(Type_Media);
        this.PEGI = new SimpleIntegerProperty(PEGI);
    }

    public IntegerProperty PEGIProperty() {
        return PEGI;
    }

    public StringProperty Type_MediaProperty() {
        return Type_Media;
    }

    public StringProperty DesignationProperty() {
        return Designation;
    }

    public StringProperty GenreProperty() {
        return Genre;
    }
    
    
    
    
}
