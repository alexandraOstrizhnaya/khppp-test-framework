package khppp.application.components;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import java.util.ArrayList;
import java.util.List;


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

    public void chooseMentees(String name) {
        Select sel = new Select(find(By.xpath("//select[@name='allMentees']")));
        sel.selectByVisibleText(name);
    }

    public String getLabManName() {
        WebElement labManName = waitFor(xpath("//p[@class='static_form_field']"));
        return labManName.getText();
    }


    public WebElement getAddBtn() {
        return waitFor(xpath("//div[@class='btn btn-success btn-sm add_user_btn add_option page_changer']"));
    }

    public WebElement getSaveBtn() {
        return waitFor(xpath("//*[@id='create-group-btn']"));
    }

    public WebElement getRemoveBtn() {
        return waitFor(xpath("//div[@class='btn btn-warning btn-sm remove_user_btn remove_option page_changer']"));
    }

    public boolean isAddGroupTabNameDisplayed() {
        WebElement tabName = waitFor(xpath("//div[@class='page_header_text']"));
        return tabName.isDisplayed() && "Add Group".equals(tabName.getText());
    }

    public boolean LabelsDisplayedCorrectly() {
        ArrayList<WebElement> labels = new ArrayList<>();
        labels.add(waitFor(xpath("//div[@class='col-md-7 label_container float_left']/label[text()='Group name:']")));
        labels.add(waitFor(xpath("//div[@class='col-md-7 label_container float_left']/label[text()='Department:']")));
        labels.add(waitFor(xpath("//div[@class='col-md-7 label_container float_left']/label[text()='Lab manager:']")));
        labels.add(waitFor(xpath("//div[@class='col-md-4']/label[text()='Available mentees']")));
        labels.add(waitFor(xpath("//div[@class='col-md-4']/label[text()='Chosen Mentees']")));
        return labels.size() == 5;
    }

    public boolean isGroupNameFieldDisplayed() {
        WebElement grNameField = waitFor(xpath("//input[@name='groupName']"));
        return grNameField.isDisplayed();
    }


    public boolean ErrorEmptyGroupNameDisplayed() {
        WebElement error = waitFor(xpath("//div[text()='Group name can not be empty']"));
        return error.isDisplayed();
    }

    public boolean ErrorNotSelectedDepDisplayed() {
        WebElement error = waitFor(xpath("//div[text()='Department must be specified']"));
        return error.isDisplayed();
    }

    public boolean ErrorOneSymbolInGroupNameDisplayed() {
        WebElement error = waitFor(xpath("//div[text() = 'Name must start with a letter and contains from 2 to 40 symbols']"));
        return error.isDisplayed();
    }
}
