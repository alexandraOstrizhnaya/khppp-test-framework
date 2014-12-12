package khppp.application.components;

import khppp.application.entitites.Group;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Oleksandra_Ostrizhna on 11/28/2014.
 */
public class GroupsTab extends Component {

    public GroupsTab(WebDriver driver) {
        super(driver);
    }

    public WebElement getEditGroupBtn() {
        return waitFor(xpath("//tr[1]/td[7]/a"));
    }

    public WebElement getAddGroupBtn() {
        return waitFor(xpath("//button[@class='btn btn-success']"));
    }

    public WebElement getExportBtn() {
        return waitFor(xpath(".//*[@id='create_csv_button']"));
    }
    public void clickFirstGroup(){waitFor(xpath("//tbody/tr[1]/td[1]")).click(); }


    public boolean isGroupTabNameDisplayed() {
        WebElement tabName = waitFor(xpath("//div[@class='page_header_text']"));
        return tabName.isDisplayed() && "Groups".equals(tabName.getText());
    }

    public boolean isBtnAddGroupDisplayed() {
        WebElement btnName = waitFor(xpath("//button[@class='btn btn-success']"));
        return btnName.isDisplayed() && "Add Group".equals(btnName.getText());
    }

    public boolean isBtnExportDisplayed() {
        WebElement btnName = waitFor(xpath("//tr[1]/td[7]/a"));
        return btnName.isDisplayed() && "Export".equals(btnName.getText());
    }

    public List<Group> getAllGroups() {
        int numberOfRows = waitForAll(xpath("//*[@id='table_group_journal']//tr")).size();
        System.out.println("ROWS " + numberOfRows);
        List<Group> groups = new ArrayList<>();
        for (int i = 1; i < numberOfRows - 1; i++) {
            List<WebElement> columns = findAll(xpath(
                    "//*[@id='table_group_journal']//tr[%s]//td", i));
            Group group = new Group();
            group.setGroupName(columns.get(0).getText());
            group.setNumOfMentees(columns.get(1).getText());
            group.setDepName(columns.get(2).getText());
            group.setLabManName(columns.get(4).getText());
            groups.add(group);
        }
        return groups;
    }

    public boolean isCreateGroupDisplayed(String groupName) {
        return displayed(xpath("//td[contains('%s')][1]", groupName));
    }

    public boolean isGroupMenteesDisplayed(String numOfMentees, String groupName) {
        return displayed(xpath("//tr//td[2]", numOfMentees)) && displayed(xpath("//td[contains(.,'%s')][1]", groupName));
    }
}
