package TableView_Administrator;

import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

/**
 *
 * @author Bonnard_Valentin
 */
public class Client {

    public StringProperty prenom_client;
    public StringProperty nom_client;
    public StringProperty mail_client;
    public StringProperty adresse_client;
    public StringProperty ville_client;
    public StringProperty pays_client;

    public Client() {
        this(null, null, null, null, null, null);
    }

    public Client(
            String prenom_client,
            String nom_client,
            String mail_client,
            String adresse_client,
            String ville_client,
            String pays_client) {

        this.prenom_client = new SimpleStringProperty(prenom_client);
        this.nom_client = new SimpleStringProperty(nom_client);
        this.mail_client = new SimpleStringProperty(mail_client);
        this.adresse_client = new SimpleStringProperty(adresse_client);
        this.ville_client = new SimpleStringProperty(ville_client);
        this.pays_client = new SimpleStringProperty(pays_client);

    }

    public String getprenom_client() {
        return prenom_client.get();
    }

    public void setprenom_client(String prenom) {
        this.prenom_client.set(prenom);
    }

    public StringProperty prenom_clientProperty() {
        return prenom_client;
    }

    public String getnom_client() {
        return nom_client.get();
    }

    public void setnom_client(String prenom) {
        this.nom_client.set(prenom);
    }

    public StringProperty nom_clientProperty() {
        return nom_client;
    }

    public String getmail_client() {
        return mail_client.get();
    }

    public void setmail_client(String mail) {
        this.mail_client.set(mail);
    }

    public StringProperty mail_clientProperty() {
        return mail_client;
    }

    public String getadresse_client() {
        return adresse_client.get();
    }

    public void setadresse_client(String adresse) {
        this.adresse_client.set(adresse);
    }

    public StringProperty adresse_clientProperty() {
        return adresse_client;
    }

    public String getville_client() {
        return ville_client.get();
    }

    public void setville_client(String ville) {
        this.ville_client.set(ville);
    }

    public StringProperty ville_clientProperty() {
        return ville_client;
    }

    public String getpays_client() {
        return pays_client.get();
    }

    public void setpays_client(String pays) {
        this.pays_client.set(pays);
    }

    public StringProperty pays_clientProperty() {
        return pays_client;

    }
}
