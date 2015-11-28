package TableView;

import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

/**
 *
 * @author bonnard
 */
public class Carte_Mere {

    public StringProperty CPU_Name;
    public StringProperty Chipset;
    public StringProperty Total_RAM;
    public StringProperty Name_GPU;
    public StringProperty Total_USB;
    public StringProperty Memory_Type;
    public StringProperty Memory_Capacity;
    public StringProperty Memory_Speed;
    public StringProperty GPU_Interface;

    public Carte_Mere(
            String CPU_Name,
            String Chipset,
            String Total_RAM,
            String Name_GPU,
            String Total_USB,
            String Memory_Type,
            String Memory_Capacity,
            String Memory_Speed,
            String GPU_Interface) {

        this.CPU_Name = new SimpleStringProperty(CPU_Name);
        this.Chipset = new SimpleStringProperty(Chipset);
        this.Total_RAM = new SimpleStringProperty(Total_RAM);
        this.Name_GPU = new SimpleStringProperty(Name_GPU);
        this.Total_USB = new SimpleStringProperty(Total_USB);
        this.Memory_Type = new SimpleStringProperty(Memory_Type);
        this.Memory_Capacity = new SimpleStringProperty(Memory_Capacity);
        this.Memory_Speed = new SimpleStringProperty(Memory_Speed);
        this.GPU_Interface = new SimpleStringProperty(GPU_Interface);

    }

    public StringProperty CPU_NameProperty() {
        return CPU_Name;
    }

    public StringProperty ChipsetProperty() {
        return Chipset;
    }

    public StringProperty Total_RAMProperty() {
        return Total_RAM;
    }

    public StringProperty Name_GPUProperty() {
        return Name_GPU;
    }

    public StringProperty Total_USBProperty() {
        return Total_USB;
    }

    public StringProperty Memory_TypeProperty() {
        return Memory_Type;
    }

    public StringProperty Memory_CapacityProperty() {
        return Memory_Capacity;
    }

    public StringProperty Memory_SpeedProperty() {
        return Memory_Speed;
    }

    public StringProperty GPU_InterfaceProperty() {
        return GPU_Interface;
    }

}
