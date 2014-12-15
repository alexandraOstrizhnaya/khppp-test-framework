package khppp.application.steps;

import khppp.application.components.AddGroupTab;
import khppp.application.components.GroupsTab;
import khppp.application.entitites.Group;
import khppp.factory.PageFactory;
import sun.rmi.runtime.Log;

import java.util.List;

/**
 * Created by Oleksandra_Ostrizhna on 11/28/2014.
 */
public class GroupsTabSteps {

    GroupsTab groupsTab;
    AddGroupTab addGroupTab;

    public GroupsTabSteps(PageFactory factory) {
        this.groupsTab = factory.createPage(GroupsTab.class);
        this.addGroupTab = factory.createPage(AddGroupTab.class);
    }

    public boolean isGroupTabDisplayed() {
        return groupsTab.isGroupTabNameDisplayed();
    }

    public boolean isBtnAddGroupDisplayed() {
        return groupsTab.isBtnAddGroupDisplayed();
    }

    public boolean isBtnExportDisplayed() {
        return groupsTab.isBtnExportDisplayed();
    }

    public boolean emptyGroupCreated(String groupname) {
        return groupsTab.isCreateGroupDisplayed(groupname);
    }

    public boolean groupWithMenteeCreated(String groupName, String numOfMentees) {
        return groupsTab.isGroupWithMenteesDisplayed(groupName, numOfMentees);
    }

    public boolean groupsTabTableHeadDisplayed() {
        return groupsTab.getGroupsTableHead();
    }

    public AddGroupTab goToAddGroupTab() {
        groupsTab.getAddGroupBtn().click();
        return addGroupTab;
    }
}
