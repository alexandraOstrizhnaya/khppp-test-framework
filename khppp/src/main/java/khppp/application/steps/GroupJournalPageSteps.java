package khppp.application.steps;

import khppp.application.components.AddGroupTab;
import khppp.application.components.AddSubgroupTab;
import khppp.application.components.GroupJournalPage;
import khppp.factory.PageFactory;

/**
 * Created by Iryna_Perekhod on 12/10/2014.
 */
public class GroupJournalPageSteps {

    GroupJournalPage groupJournalPage;
    AddSubgroupTab addSubgroupTab;

    public GroupJournalPageSteps(PageFactory factory) {
        this.groupJournalPage = factory.createPage(GroupJournalPage.class);
        this.addSubgroupTab = factory.createPage(AddSubgroupTab.class);
    }

    public boolean isGroupJournalDisplayed() {
        return groupJournalPage.isCreatedSubgroupDisplayed("irenSubgroup");
    }

    public boolean isEmptyGroupJournalDisplayed() {
        return groupJournalPage.isEmptySignDisplayed("irenEmptySubgroup");
    }

}
