package khppp.tests;

import khppp.application.steps.*;
import org.aspectj.lang.annotation.After;
import org.testng.annotations.*;
import ru.yandex.qatools.allure.annotations.Features;

import static khppp.application.Features.GROUP;

import java.lang.reflect.Method;
import java.util.List;

import static khppp.excel.utils.ExcelColumn.*;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;

/**
 * Created by Oleksandra_Ostrizhna on 11/28/2014.
 */
public class GroupsTest extends BaseCase {

    LoginSteps loginSteps;
    AddGroupSteps addGroupSteps;
    NavBarSteps navBarSteps;
    GroupsTabSteps groupsTabSteps;
    AddUserSteps addUserSteps;
    UsersTabSteps usersTabSteps;

    @BeforeClass
    public void setUp() {
        loginSteps = new LoginSteps(pages);
        addGroupSteps = new AddGroupSteps(pages);
        navBarSteps = new NavBarSteps(pages);
        groupsTabSteps = new GroupsTabSteps(pages);
        addUserSteps = new AddUserSteps(pages);
        usersTabSteps = new UsersTabSteps(pages);
    }


    @Test(dataProvider = "testData")
    public void preConditions(List<String> data) {
        login(data);
    }


    @Test(dataProvider = "testData", dependsOnMethods = "preConditions")
    public void creationOfMentee(List<String> data) {
        navBarSteps.navigateTo("Users");
        addUserSteps.addUserDifferentRoles(data.get(NEW_USER_NAME), data.get(NEW_USER_SURNAME), data.get(NEW_USER_ROLE));
        assertThat(usersTabSteps.userDisplayed(data.get(NEW_USER_SURNAME)), is(true));
    }


    @Features(GROUP)
    @Test(dependsOnMethods = "preConditions")
    public void validTabName() {
        goToGroupsTab();
        assertThat(groupsTabSteps.isGroupTabDisplayed(), is(true));
    }

    @Features(GROUP)
    @Test(dependsOnMethods = "preConditions")
    public void addGroupBtnName() {
        goToGroupsTab();
        assertThat(groupsTabSteps.isBtnAddGroupDisplayed(), is(true));
    }

    @Features(GROUP)
    @Test(dependsOnMethods = "preConditions")
    public void exportBtnName() {
        goToGroupsTab();
        assertThat(groupsTabSteps.isBtnExportDisplayed(), is(true));
    }

    //************************AddGroup Tab Tests***************************

    @Features(GROUP)
    @Test(dataProvider = "testData", dependsOnMethods = "preConditions")
    public void addEmptyGroup(List<String> data) {
        goToGroupsTab();
        //goToAddGroupsTab(data);
        //addGroupSteps.addNewEmptyGroup(data.get(GROUP_NAME), data.get(DEPARTMENT_NAME));
        assertThat(groupsTabSteps.emptyGroupCreated(data.get(GROUP_NAME)), is(true));
    }

/*    @Features(GROUP)
    @Test(dataProvider = "testData", dependsOnMethods = "creationOfMentee")
    public void addGroupWithMentee(List<String> data) {
        goToGroupsTab();
        goToAddGroupsTab();
        addGroupSteps.addNewGroupWithMentees(data.get(GROUP_NAME), data.get(DEPARTMENT_NAME), data.get(GROUP_MENTEE));
        assertThat(groupsTabSteps.groupWithMenteeCreated(data.get(GROUP_NAME), data.get(NUM_OF_MENTEES)), is(true));
    }*/

    @Features(GROUP)
    @Test(dataProvider = "testData", dependsOnMethods = "preConditions")
    public void addGroupWithoutName(List<String> data) {
        goToGroupsTab();
        goToAddGroupsTab();
        addGroupSteps.addNewEmptyGroupWithoutName(data.get(DEPARTMENT_NAME));
        assertThat(addGroupSteps.isErrorEmptyGroupNameDisplayed(), is(true));
    }

    @Features(GROUP)
    @Test(dataProvider = "testData", dependsOnMethods = "preConditions")
    public void addGroupWithoutDep(List<String> data) {
        goToGroupsTab();
        goToAddGroupsTab();
        addGroupSteps.addNewEmptyGroup(data.get(GROUP_NAME), data.get(DEPARTMENT_NAME));
        assertThat(addGroupSteps.isErrorNotSelectedDepDisplayed(), is(true));
    }

    @Features(GROUP)
    @Test(dependsOnMethods = "preConditions")
    public void validAddGroupTabName() {
        goToGroupsTab();
        goToAddGroupsTab();
        assertThat(addGroupSteps.isAddGroupTabDisplayed(), is(true));
    }

    @Features(GROUP)
    @Test(dependsOnMethods = "preConditions")
    public void verifyLabels() {
        goToGroupsTab();
        goToAddGroupsTab();
        assertThat(addGroupSteps.allLabelsAreCorrect(), is(true));
    }

    @Features(GROUP)
    @Test(dependsOnMethods = "preConditions")
    public void verifyButtonsDisplayed() {
        goToGroupsTab();
        goToAddGroupsTab();
        assertThat(addGroupSteps.allButtonsAreDisplayed(), is(true));
    }

    @Features(GROUP)
    @Test(dependsOnMethods = "preConditions")
    public void verifyGroupNameField() {
        goToGroupsTab();
        goToAddGroupsTab();
        assertThat(addGroupSteps.isGroupNameFieldDisplayed(), is(true));
    }

    @Features(GROUP)
    @Test(dataProvider = "testData", dependsOnMethods = "preConditions")
    public void groupNameFieldOneSymbol(List<String> data) {
        goToGroupsTab();
        goToAddGroupsTab();
        addGroupSteps.addNewEmptyGroup(data.get(GROUP_NAME), data.get(DEPARTMENT_NAME));
        assertThat(addGroupSteps.isErrorIncorrectlyGroupNameDisplayed(), is(true));
    }

    @Features(GROUP)
    @Test(dataProvider = "testData", dependsOnMethods = "preConditions")
    public void groupNameFieldFromSpecialSymbol(List<String> data) {
        goToGroupsTab();
        goToAddGroupsTab();
        addGroupSteps.addNewEmptyGroup(data.get(GROUP_NAME), data.get(DEPARTMENT_NAME));
        assertThat(addGroupSteps.isErrorIncorrectlyGroupNameDisplayed(), is(true));
    }

    @AfterClass
    public void logout() {
        navBarSteps.logout();
    }
}