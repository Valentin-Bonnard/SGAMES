package TableView_Administrator;

import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

/**
 *
 * @author Bonnard_Valentin
 */
public class Suggestion {

    public StringProperty Processeur;
    public StringProperty Carte_mere;
    public StringProperty Carte_graphique;
    public StringProperty RAM_GB_;
    public StringProperty OS;
    public StringProperty Jeux;
    public StringProperty Mail_Client;
    public StringProperty Numero_Portable;

    public Suggestion(
            String Processeur,
            String Carte_mere,
            String Carte_graphique,
            String RAM_GB_,
            String OS,
            String Jeux,
            String Mail_Client,
            String Numero_Portable) {

        this.Processeur = new SimpleStringProperty(Processeur);
        this.Carte_mere = new SimpleStringProperty(Carte_mere);
        this.Carte_graphique = new SimpleStringProperty(Carte_graphique);
        this.RAM_GB_ = new SimpleStringProperty(RAM_GB_);
        this.OS = new SimpleStringProperty(OS);
        this.Jeux = new SimpleStringProperty(Jeux);
        this.Mail_Client = new SimpleStringProperty(Mail_Client);
        this.Numero_Portable = new SimpleStringProperty(Numero_Portable);

    }

    public StringProperty ProcesseurProperty() {
        return Processeur;
    }

    public StringProperty Carte_mereProperty() {
        return Carte_mere;
    }

    public StringProperty Carte_graphiqueProperty() {
        return Carte_graphique;
    }

    public StringProperty RAM_GB_Property() {
        return RAM_GB_;
    }

    public StringProperty OSProperty() {
        return OS;
    }

    public StringProperty JeuxProperty() {
        return Jeux;
    }

    public StringProperty Mail_ClientProperty() {
        return Mail_Client;
    }

    public StringProperty Numero_PortableProperty() {
        return Numero_Portable;
    }

}
