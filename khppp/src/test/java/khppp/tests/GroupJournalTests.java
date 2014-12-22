package khppp.tests;

import khppp.application.steps.*;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;
import ru.yandex.qatools.allure.annotations.Features;
import java.util.List;
import static khppp.application.Features.GROUP;
import static khppp.application.Features.GROUP_JOURNAL;
import static khppp.excel.utils.ExcelColumn.*;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;

/**
 * Created by Anastasiia_Borodaiev on 12/4/2014.
 */
public class GroupJournalTests extends BaseCase {
    LoginSteps loginSteps;
    NavBarSteps navBarSteps;
    GroupsTabSteps groupsTabSteps;
    AddGroupSteps addGroupSteps;
    GroupJournalSteps groupJournalSteps;
    AddUserSteps addUserSteps;

    @BeforeClass
    public void setUp() {
        loginSteps = new LoginSteps(pages);
        addGroupSteps = new AddGroupSteps(pages);
        navBarSteps = new NavBarSteps(pages);
        groupsTabSteps = new GroupsTabSteps(pages);
        groupJournalSteps = new GroupJournalSteps(pages);
        addUserSteps = new AddUserSteps(pages);
    }

    @Test(dataProvider = "testData", priority = 1)
    public void preConditions(List<String> data) {
        login(data);
    }

    @Test(dataProvider = "testData", priority = 3)
    public void forVerifyGUI() {
        groupsTabSteps.goToGroupJournalPAge();
    }

    @Test(dataProvider = "testData", dependsOnMethods = "preConditions", priority = 2)
    public void creationOfMentee(List<String> data) {
        navBarSteps.navigateTo("Users");
        addUserSteps.addUserDifferentRoles(data.get(NEW_USER_NAME), data.get(NEW_USER_SURNAME), data.get(NEW_USER_ROLE));
    }

    @Features(GROUP)
    @Test(dependsOnMethods = "creationOfMentee", priority = 2)
    public void availableMentees() {
        goToGroupsTab();
        goToAddGroupsTab();
        assertThat(addGroupSteps.isNameOfCreatedMenteeDisplayed(), is(true));
    }

    @Features(GROUP)
    @Test(dataProvider = "testData", dependsOnMethods = "availableMentees", priority = 2)
    public void createGroupWithMentee(List<String> data) {
        goToGroupsTab();
        goToAddGroupsTab();
        addGroupSteps.addNewGroupWithOneMentee(data.get(GROUP_NAME), data.get(DEPARTMENT_NAME), data.get(USER_NAME));
        assertThat(addGroupSteps.isNameOfChosenMenteeDisplayed(), is(true));
        addGroupSteps.clickSaveBtn();
    }

    @Features(GROUP_JOURNAL)
    @Test(dependsOnMethods = "forVerifyGUI", priority = 3)
    public void correctPageName() {
        assertThat(groupJournalSteps.isGroupJournalDisplayed(), is(true));
    }

    @Features(GROUP_JOURNAL)
    @Test(dependsOnMethods = "forVerifyGUI", priority = 3)
    public void correctGroupName() {
        assertThat(groupJournalSteps.isGroupDisplayed(), is(true));
    }

    @Features(GROUP_JOURNAL)
    @Test(dependsOnMethods = "forVerifyGUI", priority = 3)
    public void correctAddSubgroupBtnName() {
        assertThat(groupJournalSteps.isAddSubgroupDisplayed(), is(true));
    }

    @Features(GROUP_JOURNAL)
    @Test(dependsOnMethods = "forVerifyGUI", priority = 3)
    public void correctAssignBtnName() {
        assertThat(groupJournalSteps.isAssignDisplayed(), is(true));
    }

    @Features(GROUP_JOURNAL)
    @Test(dependsOnMethods = "forVerifyGUI", priority = 3)
    public void correctExportBtnName() {
        assertThat(groupJournalSteps.isExportDisplayed(), is(true));
    }

    @Features(GROUP_JOURNAL)
    @Test(dependsOnMethods = "forVerifyGUI", priority = 3)
    public void correctBackBtnName() {
        assertThat(groupJournalSteps.isBackDisplayed(), is(true));
    }

    @Features(GROUP_JOURNAL)
    @Test(dependsOnMethods = "forVerifyGUI", priority = 3)
    public void validGroupJournalTableHead() {
        assertThat(groupJournalSteps.groupJournalTableHeadDisplayed(), is(true));
    }

    @Features(GROUP_JOURNAL)
    @Test(priority = 4)
    public void validWithoutSubgroupTitle() {
        goToGroupsTab();
        groupsTabSteps.goToNotEmptyGroup();
        assertThat(groupJournalSteps.isTitleDisplayed(), is(true));
    }

    @Features(GROUP_JOURNAL)
    @Test(priority = 4)
    public void workOfBackButton() {
        goToGroupsTab();
        groupsTabSteps.goToGroupJournalPAge();
        assertThat(groupJournalSteps.isGroupJournalDisplayed(), is(true));
        groupJournalSteps.clickBackButton();
        assertThat(groupsTabSteps.isGroupTabDisplayed(), is(true));
    }

    @AfterClass
    public void logout() {
        navBarSteps.logout();
    }
}


