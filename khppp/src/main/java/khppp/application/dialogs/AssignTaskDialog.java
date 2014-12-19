package khppp.application.dialogs;

import org.openqa.selenium.WebDriver;

/**
 * Created by Oleksandra_Ostrizhna on 12/18/2014.
 */
public class AssignTaskDialog extends AbstractDialog {

    public AssignTaskDialog(WebDriver driver) {
        super(driver);
    }

    @Override
    public void switchToDialog() {
    }

    @Override
    public void switchToDialog(String modalUrl) {
        super.switchToDialog(modalUrl);

    }
}
