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

    /*LoginSteps loginSteps;
    AddGroupSteps addGroupSteps;
    NavBarSteps navBarSteps;
    GroupsTabSteps groupsTabSteps;

    @BeforeClass
    public void setUp() {
        loginSteps = new LoginSteps(pages);
        addGroupSteps = new AddGroupSteps(pages);
        navBarSteps = new NavBarSteps(pages);
        groupsTabSteps = new GroupsTabSteps(pages);
    }

    @DataProvider(name = "group")
    public Object[][] credentials(Method method) throws Exception {
        return testData(method, "Groups");
    }

    @Features(GROUP)
    @Test(dataProvider = "group")
    public void validTabName(List<String> data) {
        login(data);
        assertThat(groupsTabSteps.isGroupTabDisplayed(), is(true));
    }

    @Features(GROUP)
    @Test(dataProvider = "group")
    public void addGroupBtnName(List<String> data) {
        goToGroupsTab(data);
        assertThat(groupsTabSteps.isBtnAddGroupDisplayed(), is(true));
    }

    @Features(GROUP)
    @Test(dataProvider = "group")
    public void exportBtnName(List<String> data) {
        goToAddGroupsTab(data);
        assertThat(groupsTabSteps.isBtnExportDisplayed(), is(true));
    }

    @Features(GROUP)
    @Test(dataProvider = "group")
    public void addEmptyGroup(List<String> data) {
        //goToAddGroupsTab(data);
        //addGroupSteps.addNewEmptyGroup(data.get(GROUP_NAME), data.get(DEPARTMENT_NAME));
        goToGroupsTab(data);
        assertThat(groupsTabSteps.emptyGroupCreated(data.get(GROUP_NAME)), is(true));
    }

    @Features(GROUP)
    @Test(dataProvider = "group")
    public void addGroupWithoutName(List<String> data) {
        goToAddGroupsTab(data);
        addGroupSteps.addNewEmptyGroupWithoutName(data.get(DEPARTMENT_NAME));
        assertThat(addGroupSteps.isErrorEmptyGroupNameDisplayed(), is(true));
    }

    @Features(GROUP)
    @Test(dataProvider = "group")
    public void addGroupWithoutDep(List<String> data) {
        goToAddGroupsTab(data);
        addGroupSteps.addNewEmptyGroup(data.get(GROUP_NAME), data.get(DEPARTMENT_NAME));
        assertThat(addGroupSteps.isErrorNotSelectedDepDisplayed(), is(true));
    }

    /*//************************AddGroup Tab Tests***************************

    @Features(GROUP)
    @Test(dataProvider = "group")
    public void validAddGroupTabName(List<String> data) {
        goToAddGroupsTab(data);
        assertThat(addGroupSteps.isAddGroupTabDisplayed(), is(true));
    }

    @Features(GROUP)
    @Test(dataProvider = "group")
    public void verifyLabels(List<String> data) {
        goToAddGroupsTab(data);
        assertThat(addGroupSteps.allLabelsAreCorrect(), is(true));
    }

    @Features(GROUP)
    @Test(dataProvider = "group")
    public void verifyButtonsDisplayed(List<String> data) {
        goToAddGroupsTab(data);
        assertThat(addGroupSteps.allButtonsAreDisplayed(), is(true));
    }

    @Features(GROUP)
    @Test(dataProvider = "group")
    public void verifyGroupNameField(List<String> data) {
        goToAddGroupsTab(data);
        assertThat(addGroupSteps.isGroupNameFieldDisplayed(), is(true));
    }

    @Features(GROUP)
    @Test(dataProvider = "group")
    public void groupNameFieldDoesNotContainOneSymbol(List<String> data) {
        goToAddGroupsTab(data);
        addGroupSteps.addNewEmptyGroup(data.get(GROUP_NAME), data.get(DEPARTMENT_NAME));
        assertThat(addGroupSteps.isErrorIncorrectlyGroupNameDisplayed(), is(true));
    }

    @Features(GROUP)
    @Test(dataProvider = "group")
    public void groupNameFieldMustStartsNotFromSpecialSymbol(List<String> data) {
        goToAddGroupsTab(data);
        addGroupSteps.addNewEmptyGroup(data.get(GROUP_NAME), data.get(DEPARTMENT_NAME));
        assertThat(addGroupSteps.isErrorIncorrectlyGroupNameDisplayed(), is(true));
    }

    @AfterMethod
    public void logout() {
        navBarSteps.logout();
    }*/
}