package khppp.application.steps;

import khppp.application.components.AddGroupTab;
import khppp.application.components.AddUserTab;
import khppp.application.components.GroupsTab;
import khppp.application.components.UsersTab;
import khppp.factory.PageFactory;
import org.openqa.selenium.WebElement;
import ru.yandex.qatools.allure.annotations.Step;

/**
 * Created by Oleksandra_Ostrizhna on 11/28/2014.
 */
public class AddGroupSteps {
    GroupsTab groupsTab;
    AddGroupTab addGroupTab;

    public AddGroupSteps(PageFactory factory) {
        this.groupsTab = factory.createPage(GroupsTab.class);
        this.addGroupTab = factory.createPage(AddGroupTab.class);
    }

    @Step("When I add new group {0},{1}")
    public void addNewGroup(String gName, String depName) {
        groupsTab.getAddGroupBtn().click();
        addGroupTab.enterGroupName(gName);
        addGroupTab.selectDepartment(depName);
        addGroupTab.clickSaveBtn();
    }

    public boolean isErrorEmptyGroupNameDisplayed(String message) {
        return addGroupTab.isErrorEmptyGroupNameDisplayed(message);
    }

    public boolean isErrorNotSelectedDepDisplayed(String message) {
        return addGroupTab.isErrorNotSelectedDepDisplayed(message);
    }
}
