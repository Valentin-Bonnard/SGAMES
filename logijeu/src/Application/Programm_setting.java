package Application;

import Contollers_Connection.Login;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.management.ManagementFactory;
import java.net.URL;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.concurrent.Task;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.ProgressBar;
import javafx.scene.control.TextArea;
import javafx.scene.effect.Reflection;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Priority;
import javafx.scene.paint.Color;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

/**
 *
 * @author Bonnard_Valentin programm setting , info de l'application , creation
 * de l'info en relation a la demande de savoir quelle composant j'ai. deux
 * Easter eggs progress bar = kitt k2000 et methode "joke " = language auslogics
 * .
 */
public class Programm_setting implements Initializable {

    @FXML
    private Button btn_process;
    @FXML
    private Button btn_cancel;
    @FXML
    private ComboBox<String> combo_box;
    @FXML
    private Label info;
    @FXML
    private ProgressBar progressbar;
    @FXML
    private Button Cancel;

    @FXML
    private TextArea txt_show;

    Task copyworker;
    int mb = 1024 * 1024;
    int gb = 1024 * 1024 * 1024;

    Alert alert = new Alert(AlertType.INFORMATION);
    final private static Alert alertE = new Alert(AlertType.ERROR);

    Login login = new Login();
    String user = login.getvar_user();

    String nameOS = "os.name";
    String versionOS = "os.version";
    String architectureOS = "os.arch";
    String filePath = "infoComputer" + user + ".txt";
    String line;

    private static final String RED_BAR = "red-bar";
    private static final String YELLOW_BAR = "yellow-bar";
    private static final String ORANGE_BAR = "orange-bar";
    private static final String GREEN_BAR = "green-bar";
    private static final String[] barColorStyleClasses = {RED_BAR, ORANGE_BAR, YELLOW_BAR, GREEN_BAR};

    com.sun.management.OperatingSystemMXBean operatingSystemMXBean = (com.sun.management.OperatingSystemMXBean) ManagementFactory.getOperatingSystemMXBean();
    com.sun.management.OperatingSystemMXBean os = (com.sun.management.OperatingSystemMXBean) java.lang.management.ManagementFactory.getOperatingSystemMXBean();

    long physicalMemorySize = os.getTotalPhysicalMemorySize();
    long physicalfreeMemorySize = os.getFreePhysicalMemorySize();

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        combo_box.getItems().clear();
        combo_box.getItems().add("English");
        info.setText("Componenets comparator : 4.0.0.0" + "\n\n " + "Logijeu");

        progressbar.progressProperty().addListener(new ChangeListener<Number>() {
            @Override
            public void changed(ObservableValue<? extends Number> observable, Number oldValue, Number newValue) {
                double progress = newValue == null ? 0 : newValue.doubleValue();
                if (progress < 0.2) {
                    setBarStyleClass(progressbar, RED_BAR);
                } else if (progress < 0.4) {
                    setBarStyleClass(progressbar, ORANGE_BAR);
                } else if (progress < 0.6) {
                    setBarStyleClass(progressbar, YELLOW_BAR);
                } else {
                    setBarStyleClass(progressbar, GREEN_BAR);
                }
            }

            private void setBarStyleClass(ProgressBar bar, String barStyleClass) {
                bar.getStyleClass().removeAll(barColorStyleClasses);
                bar.getStyleClass().add(barStyleClass);
            }
        });

    }

    @FXML
    private void process_compo(ActionEvent event) throws Exception {
        btn_process.setDisable(true);
        progressbar.setProgress(10);
        Cancel.setDisable(false);
        copyworker = createWorker();
        progressbar.progressProperty().bind(copyworker.progressProperty());

        new Thread(copyworker).start();

        Cancel.setOnAction(new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
                btn_process.setDisable(false);
                Cancel.setDisable(true);
                copyworker.cancel(true);
                progressbar.progressProperty().unbind();
                progressbar.setProgress(0);
            }
        });

    }

    public Task createWorker() {
        return new Task() {
            @Override
            protected Object call() throws Exception {
                for (int i = 0; i < 100; i++) {
                    Thread.sleep(0);
                    System.out.print(i + "%");
                    try {
                        ProcessBuilder pb = new ProcessBuilder("cmd.exe", "/c", "dxdiag", "/t", filePath);

                        // dxdialog : Commande pour connaître les composants et les caractéristiques de son PC
                        //System.out.println("-- Executing dxdiag command --");
                        Process p = pb.start();
                        p.waitFor();

                        txt_show.setText(readFile());

                    } catch (IOException | InterruptedException ex) {

                        // message exception avec defilement des erreurs.
                        alertE.setTitle("Exception Dialog"); // titre du dialog
                        alertE.setContentText("Could not find file");  // information de l'exception 

                        IOException e = new IOException();

                        StringWriter sw = new StringWriter(); // pour ecrir de chaine de caractere
                        PrintWriter pw = new PrintWriter(sw); // pour afficher les chaines de caractere ecrit  
                        e.printStackTrace(pw);  // afficher l'exception
                        String exceptionText = sw.toString(); // ecrire l'exception 

                        Label label = new Label("The exception stacktrace was:");

                        TextArea textArea = new TextArea(exceptionText); // creation d'un textarea pour afficher l'exception
                        textArea.setEditable(false);
                        textArea.setWrapText(true);

                        textArea.setMaxWidth(Double.MAX_VALUE);
                        textArea.setMaxHeight(Double.MAX_VALUE);
                        GridPane.setVgrow(textArea, Priority.ALWAYS);
                        GridPane.setHgrow(textArea, Priority.ALWAYS);

                        GridPane expContent = new GridPane();
                        expContent.setMaxWidth(Double.MAX_VALUE);
                        expContent.add(label, 0, 0);
                        expContent.add(textArea, 0, 1);

                        alertE.getDialogPane().setExpandableContent(expContent); // defilement de l'exception

                        alertE.showAndWait();  // crée un bouton ok pour fermer la boite de dialog
                    }
                }
                alert.setTitle("Information");
                alert.setHeaderText("Information Processus");
                alert.setContentText("Processus Complete");
                alert.showAndWait();
                return true;
            }
        };
    }

    private String readFile() {

        StringBuilder stringBuffer = new StringBuilder();
        BufferedReader bufferedReader = null;

        try {
            FileInputStream fstream = new FileInputStream(filePath);
            bufferedReader = new BufferedReader(new InputStreamReader(fstream));

            String strLine;
            while ((strLine = bufferedReader.readLine()) != null) {
                stringBuffer.append(strLine);
                stringBuffer.append(System.getProperty("line.separator"));

            }

        } catch (FileNotFoundException ex) {
            Logger.getLogger(Programm_setting.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Programm_setting.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                bufferedReader.close();

            } catch (IOException ex) {
                Logger.getLogger(Programm_setting.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }

        return stringBuffer.toString();
    }

    @FXML
    private void print_pdf(ActionEvent event) throws Exception {

        File file = new File("infoComputer" + user + ".txt");

        if (file.getName().endsWith(".txt")) {

            if (convertTextToPDF(file)) {

                alert.setTitle("Information Dialog");
                alert.setContentText("Text file successfully converted to PDF");
                alert.showAndWait();

            }
        }

    }

    public static boolean convertTextToPDF(File file) throws Exception {
        FileInputStream fis = null;
        DataInputStream in = null;
        InputStreamReader isr = null;
        BufferedReader br = null;

        try {

            Document pdfDoc = new Document();
            String output_file = "infoComputerUser.pdf";
            PdfWriter writer = PdfWriter.getInstance(pdfDoc, new FileOutputStream(output_file));
            pdfDoc.open();
            pdfDoc.setMarginMirroring(true);
            pdfDoc.setMargins(36, 72, 108, 180);
            pdfDoc.topMargin();
            Font myfont = new Font();
            Font bold_font = new Font();
            bold_font.setStyle(Font.BOLD);
            bold_font.setSize(10);
            myfont.setStyle(Font.NORMAL);
            myfont.setSize(10);
            pdfDoc.add(new Paragraph("\n"));

            if (file.exists()) {

                fis = new FileInputStream(file);
                in = new DataInputStream(fis);
                isr = new InputStreamReader(in);
                br = new BufferedReader(isr);
                String strLine;

                while ((strLine = br.readLine()) != null) {

                    Paragraph para = new Paragraph(strLine + "\n", myfont);
                    para.setAlignment(Element.ALIGN_JUSTIFIED);
                    pdfDoc.add(para);
                }
            } else {

                alertE.setTitle("Error Dialog");
                alertE.setContentText("no such file exists!");
                alertE.showAndWait();

                return false;
            }
            pdfDoc.close();
        } catch (Exception e) {
            System.out.println("Exception: " + e.getMessage());
        } finally {

            if (br != null) {
                br.close();
            }
            if (fis != null) {
                fis.close();
            }
            if (in != null) {
                in.close();
            }
            if (isr != null) {
                isr.close();
            }

        }

        return true;
    }

    @FXML
    private void close_setting(ActionEvent event) {
        Stage stage = (Stage) btn_cancel.getScene().getWindow();
        stage.close();
    }

    @FXML
    private void joke(ActionEvent event) {

        Group root = new Group();
        Image image = new Image("http://media.giphy.com/media/oIR6xeOffCEBa/giphy.gif");
        ImageView view = new ImageView(image);
        root.getChildren().add(view);
        Scene scene = new Scene(root, image.getWidth(), 2 * image.getHeight(), Color.TRANSPARENT);

        Stage stage = new Stage();

        stage.setScene(scene);
        stage.initStyle(StageStyle.TRANSPARENT);
        stage.show();

        view.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent t) {
                stage.close();
            }
        });
        view.setEffect(new Reflection());

    }

}
