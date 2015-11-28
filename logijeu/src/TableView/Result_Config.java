package TableView;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

/**
 *
 * @author Bonnard_Valentin
 */
public class Result_Config {

    public StringProperty Name_GPU; // carte graphique
    public StringProperty CPU_Name; // catre mere
    public StringProperty Name_Proc;
    public StringProperty Capacite; // ram 
    public StringProperty Designation_Logiciel;
    public StringProperty Designation_Jeux;
    public IntegerProperty Note;
    public IntegerProperty Fidelite;

    public Result_Config(
            String Name_GPU,
            String CPU_Name,
            String Name_Proc,
            String Capacite,
            String Designation_Logiciel,
            String Designation_Jeux,
            Integer Note,
            Integer Fidelite) {

        this.Name_GPU = new SimpleStringProperty(Name_GPU);
        this.CPU_Name = new SimpleStringProperty(CPU_Name);
        this.Name_Proc = new SimpleStringProperty(Name_Proc);
        this.Capacite = new SimpleStringProperty(Capacite);
        this.Designation_Logiciel = new SimpleStringProperty(Designation_Logiciel);
        this.Designation_Jeux = new SimpleStringProperty(Designation_Jeux);
        this.Note = new SimpleIntegerProperty(Note);
        this.Fidelite = new SimpleIntegerProperty(Fidelite);

    }

    public StringProperty Name_GPUProperty() {
        return Name_GPU;
    }

    public StringProperty CPU_NameProperty() {
        return CPU_Name;
    }

    public StringProperty Name_ProcProperty() {
        return Name_Proc;
    }

    public StringProperty CapaciteProperty() {
        return Capacite;
    }

    public StringProperty Designation_LogicielProperty() {
        return Designation_Logiciel;
    }

    public StringProperty Designation_JeuxProperty() {
        return Designation_Jeux;
    }

    public IntegerProperty NoteProperty() {
        return Note;
    }

    public IntegerProperty FideliteProperty() {
        return Fidelite;
    }

    
}
