package khppp.application.steps;

import khppp.application.components.*;
import khppp.factory.PageFactory;
import org.openqa.selenium.WebElement;
import ru.yandex.qatools.allure.annotations.Step;

/**
 * Created by Oleksandra_Ostrizhna on 11/28/2014.
 */
public class AddGroupSteps {
    GroupsTab groupsTab;
    AddGroupTab addGroupTab;
    NavBar navBar;

    public AddGroupSteps(PageFactory factory) {
        this.groupsTab = factory.createPage(GroupsTab.class);
        this.addGroupTab = factory.createPage(AddGroupTab.class);
        this.navBar = factory.createPage(NavBar.class);
    }

    @Step("When I add new group {0},{1}")
    public void addNewEmptyGroup(String gName, String depName) {
        addGroupTab.enterGroupName(gName);
        addGroupTab.selectDepartment(depName);
        addGroupTab.getSaveBtn().click();
    }

    public void addNewEmptyGroupWithoutName(String depName) {
        addGroupTab.selectDepartment(depName);
        addGroupTab.getSaveBtn().click();
    }


    public void addNewGroupWithMentees(String gName, String depName, String menteeName) {
        groupsTab.getAddGroupBtn().click();
        addGroupTab.enterGroupName(gName);
        addGroupTab.selectDepartment(depName);
        addGroupTab.chooseMentees(menteeName);
        addGroupTab.getAddBtn().click();
        addGroupTab.getSaveBtn().click();
    }

    public boolean isAddGroupTabDisplayed() {
        return addGroupTab.isAddGroupTabNameDisplayed();
    }

    public boolean isGroupNameFieldDisplayed() {
        return addGroupTab.isGroupNameFieldDisplayed();
    }

    public boolean isErrorEmptyGroupNameDisplayed() {
        return addGroupTab.ErrorEmptyGroupNameDisplayed();
    }

    public boolean isErrorNotSelectedDepDisplayed() {
        return addGroupTab.ErrorNotSelectedDepDisplayed();
    }

    public boolean allLabelsAreCorrect() {
        return addGroupTab.LabelsDisplayedCorrectly();
    }

    public boolean isErrorIncorrectlyGroupNameDisplayed() {
        return addGroupTab.ErrorOneSymbolInGroupNameDisplayed();
    }

    public boolean allButtonsAreDisplayed() {
        return addGroupTab.getAddBtn().isDisplayed() && addGroupTab.getRemoveBtn().isDisplayed() && addGroupTab.getSaveBtn().isDisplayed();
    }
}
