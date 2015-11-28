package TableView;

import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

/**
 *
 * @author Valentin Bonnard
 */
public class Memoire {

    public StringProperty Constructeur;
    public StringProperty Capacite;
    public StringProperty Types;
    public StringProperty Fraquences;

    public Memoire(String Constructeur, String Capacite, String Types, String Fraquences) {
        this.Constructeur = new SimpleStringProperty(Constructeur);
        this.Capacite = new SimpleStringProperty(Capacite);
        this.Types = new SimpleStringProperty(Types);
        this.Fraquences = new SimpleStringProperty(Fraquences);
    }

    public StringProperty ConstructeurProperty() {
        return Constructeur;
    }

    public StringProperty CapaciteProperty() {
        return Capacite;
    }

    public StringProperty TypesProperty() {
        return Types;
    }

    public StringProperty FraquencesProperty() {
        return Fraquences;
    }

}
