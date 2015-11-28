package TableView;

import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

/**
 *
 * @author bonnard
 */
public class Processeur {
    
    public StringProperty Name_Proc;
    public StringProperty Cpu_Speed;
    public StringProperty Physical_Cores;
    public StringProperty Cpu_socket;
    public StringProperty CPU_Codename;
    
    
    
    public Processeur(String Name_Proc, String Cpu_Speed, String Physical_Cores, String Cpu_socket, String CPU_Codename) {
        this.Name_Proc = new SimpleStringProperty(Name_Proc);
        this.Cpu_Speed = new SimpleStringProperty(Cpu_Speed);
        this.Physical_Cores = new SimpleStringProperty(Physical_Cores);
        this.Cpu_socket = new SimpleStringProperty(Cpu_socket);
        this.CPU_Codename = new SimpleStringProperty(CPU_Codename);
    } 

    public StringProperty Name_ProcProperty() {
        return Name_Proc;
    }

    public StringProperty Cpu_SpeedProperty() {
        return Cpu_Speed;
    }

    public StringProperty Physical_CoresProperty() {
        return Physical_Cores;
    }

    public StringProperty Cpu_socketProperty() {
        return Cpu_socket;
    }

    public StringProperty CPU_CodenameProperty() {
        return CPU_Codename;
    }
}
