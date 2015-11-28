package TableView;

import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

/**
 *
 * @author bonnard
 */
public class Carte_graphique {

    public StringProperty Name_GPU;
    public StringProperty Memory;
    public StringProperty Pixel_Rate;
    public StringProperty Direct_X;
    public StringProperty Resolution__WxH_;

    public Carte_graphique(String Name_GPU, String Memory, String Pixel_Rate, String Direct_X, String Resolution__WxH_) {
        this.Name_GPU = new SimpleStringProperty(Name_GPU);
        this.Memory = new SimpleStringProperty(Memory);
        this.Pixel_Rate = new SimpleStringProperty(Pixel_Rate);
        this.Direct_X = new SimpleStringProperty(Direct_X);
        this.Resolution__WxH_ = new SimpleStringProperty(Resolution__WxH_);
    }

    public StringProperty Name_GPUProperty() {
        return Name_GPU;
    }

    public StringProperty MemoryProperty() {
        return Memory;
    }

    public StringProperty Pixel_RateProperty() {
        return Pixel_Rate;
    }

    public StringProperty Direct_XProperty() {
        return Direct_X;
    }

    public StringProperty Resolution__WxH_Property() {
        return Resolution__WxH_;
    }
}
