package khppp.application.steps;

import khppp.application.components.GroupsTab;
import khppp.application.entitites.Group;
import khppp.factory.PageFactory;

import java.util.List;

/**
 * Created by Oleksandra_Ostrizhna on 11/28/2014.
 */
public class GroupsTabSteps {

    GroupsTab groupsTab;

    public GroupsTabSteps(PageFactory factory) {
        this.groupsTab = factory.createPage(GroupsTab.class);
    }

    public void clickAddGroups() {
        groupsTab.getAddGroupBtn().click();
    }

    public List<Group> getAllGroups() {
        return groupsTab.getAllGroups();
    }

    public boolean isGroupTabDisplayed() {
        return groupsTab.isGroupTabNameDisplayed();
    }

    public boolean isBtnAddGroupDisplayed() {
        return groupsTab.isBtnAddGroupDisplayed();
    }

    public boolean groupDisplayed(String grName) {
        return groupsTab.isCreateGroupDisplayed(grName);
    }
}
