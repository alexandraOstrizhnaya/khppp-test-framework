package khppp.application.steps;

import khppp.application.components.GroupJournalPage;
import khppp.application.components.GroupsTab;
import khppp.factory.PageFactory;

/**
 * Created by Anastasiia_Borodaiev on 12/4/2014.
 */
public class GroupJournalSteps {
    GroupJournalPage groupJournalPage;
    GroupsTab groupsTab;

    public GroupJournalSteps(PageFactory factory) {
        this.groupJournalPage = factory.createPage(GroupJournalPage.class);
        this.groupsTab = factory.createPage(GroupsTab.class);
    }

    public void goToGroupJournalPAge(){
        groupsTab.clickFirstGroup();
    }

    public boolean isGroupJournalDisplayed() {
        return groupJournalPage.isPageNameDisplayed();
    }
    public boolean isGroupDisplayed(){
        return groupJournalPage.isGroupNameDisplayed();
    }
    //------------------Conflict--with--Iren-------------------------------------------
    /*  public void clickAddSubgroup() {
        groupJournalPage.getAddSubgroupBtn().click();
    }*/
//---------------------------------------------------------------------------------
    public boolean isAddSubgroupDisplayed() {
        return groupJournalPage.isBtnAddSubgroupDisplayed();
    }
    public boolean isAssignDisplayed() {
        return groupJournalPage.isBtnAssignDisplayed();
    }
    public boolean isExportDisplayed() {
        return groupJournalPage.isBtnExportDisplayed();
    }
    public boolean isBackDisplayed() {
        return groupJournalPage.isBtnBackDisplayed();
    }
}
