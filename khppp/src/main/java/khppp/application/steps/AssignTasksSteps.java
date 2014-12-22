package khppp.application.steps;

import khppp.application.components.AssignTasksTab;
import khppp.application.components.GroupJournalPage;
import khppp.application.components.GroupsTab;
import khppp.application.dialogs.AssignTaskDialog;
import khppp.factory.PageFactory;

import javax.lang.model.element.Name;

/**
 * Created by Oleksandra_Ostrizhna on 12/18/2014.
 */
public class AssignTasksSteps {

    AssignTasksTab assignTasksTab;
    GroupsTab groupsTab;
    GroupJournalPage groupJournalPage;
    AssignTaskDialog assignTaskDialog;

    public AssignTasksSteps(PageFactory factory) {
        this.assignTasksTab = factory.createPage(AssignTasksTab.class);
        this.groupsTab = factory.createPage(GroupsTab.class);
        this.groupJournalPage = factory.createPage(GroupJournalPage.class);
        this.assignTaskDialog = factory.createPage(AssignTaskDialog.class);
    }

    public void assignTaskToOneMentee() {
        groupJournalPage.clickFirstSubGroup();
        groupJournalPage.selectFirstCheckboxInSubGroup();
        groupJournalPage.clickAssignBtn();
    }

    public void popUpWindowAssignTaskAppears(String taskType, String taskDepartment, String assignTask, String dialogUrl) {
        assignTasksTab.selectTaskType(taskType);
        assignTasksTab.selectTaskDepartment(taskDepartment);
        assignTasksTab.selectAssignTasks(assignTask);
        assignTasksTab.getAddBtn().click();
        assignTaskDialog.switchToDialog(dialogUrl);
    }

    public boolean menteeIsDisplayedInSelectedMenteesField(String menteeName) {
        return assignTasksTab.selectedMenteesFieldContainsCorrectlyInf(menteeName);
    }

    public boolean assignTaskTabContainsAllElements() {
        return assignTasksTab.isAssignTasksTabNameDisplayed() && assignTasksTab.getAllSelectsFromAssignTaskTab() && assignTasksTab.labelsDisplayedCorrectly() && assignTasksTab.buttonsDisplayedCorrectly();
    }


}
