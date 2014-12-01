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

    public WebElement getAddGroupBtn() {
        return waitFor(xpath("//button[@class='btn btn-success']"));
    }



    public boolean isGroupTabNameDisplayed() {
        WebElement tabName = waitFor(xpath("//div[@class='page_header_text']"));
        if (tabName.isDisplayed() && tabName.getText().equals("Groups")) {
            return true;
        } else return false;
    }

    public boolean isBtnAddGroupDisplayed() {
        WebElement btnName = waitFor(xpath("//button[@class='btn btn-success']"));
        if (btnName.isDisplayed() && btnName.getText().equals("Add Group")) {
            return true;
        } else return false;
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
            group.setDepName(columns.get(2).getText());
            System.out.println("Group " + group);
            groups.add(group);
        }
        return groups;
    }

    public boolean isCreateGroupDisplayed(String groupName) {
        return displayed(xpath("//td[contains(.,'%s')][1]", groupName));
    }

}
