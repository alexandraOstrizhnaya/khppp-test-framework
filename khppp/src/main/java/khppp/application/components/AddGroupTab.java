package khppp.application.components;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;


/**
 * Created by Oleksandra_Ostrizhna on 11/28/2014.
 */
public class AddGroupTab extends Component {

    public AddGroupTab(WebDriver driver) {
        super(driver);
    }

    public void enterGroupName(String groupName) {
        WebElement gName = waitFor(xpath("//input[@class='form-control page_changer']"));
        typeInto(gName, groupName);
    }

    public void selectDepartment(String name) {
        Select sel = new Select(find(By.xpath("//select[@name='department']")));
        sel.selectByVisibleText(name);
    }

    public void clickSaveBtn() {
        waitFor(xpath("//*[@id='create-group-btn']"))
                .click();
    }

    public boolean isErrorEmptyGroupNameDisplayed(String message) {
        WebElement error = waitFor(xpath("//div[text()='Group name can not be empty']"));
        if (error.isDisplayed()&& error.getText().equals(message)) {
            return true;
        } else return false;
    }

    public boolean isErrorNotSelectedDepDisplayed(String message) {
        WebElement error = waitFor(xpath("//div[text()='Department must be specified']"));
        if (error.isDisplayed()&& error.getText().equals(message)) {
            return true;
        } else return false;
    }
}
