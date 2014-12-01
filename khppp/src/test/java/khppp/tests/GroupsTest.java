package khppp.tests;

import khppp.application.steps.*;
import org.aspectj.lang.annotation.After;
import org.testng.annotations.*;
import ru.yandex.qatools.allure.annotations.Features;

import static khppp.application.Features.GROUP;

import java.lang.reflect.Method;
import java.util.List;

import static khppp.excel.utils.ExcelColumn.USER_NAME;
import static khppp.excel.utils.ExcelColumn.USER_PASS;
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
    public void validTabNameTest(List<String> data) {
        login(data);
        navBarSteps.navigateTo("Groups");
        assertThat(groupsTabSteps.isGroupTabDisplayed(), is(true));
    }

    @Features(GROUP)
    @Test(dataProvider = "group")
    public void addGroupBtnNameTest(List<String> data) {
        login(data);
        navBarSteps.navigateTo("Groups");
        assertThat(groupsTabSteps.isBtnAddGroupDisplayed(), is(true));
    }

    @Features(GROUP)
    @Test(dataProvider = "group")
    public void addGroup(List<String> data) {
        login(data);
        navBarSteps.navigateTo("Groups");
        addGroupSteps.addNewGroup("OstrTestGroup5", "QA");
        assertThat(groupsTabSteps.groupDisplayed("OstrTestGroup5"), is(true));
    }

    @Features(GROUP)
    @Test(dataProvider = "group")
    public void addGroupWithoutName(List<String> data) {
        login(data);
        navBarSteps.navigateTo("Groups");
        addGroupSteps.addNewGroup("", "QA");
        assertThat(addGroupSteps.isErrorEmptyGroupNameDisplayed("Group name can not be empty"), is(true));
    }

    @Features(GROUP)
    @Test(dataProvider = "group")
    public void addGroupWithoutDep(List<String> data) {
        login(data);
        navBarSteps.navigateTo("Groups");
        addGroupSteps.addNewGroup("OstrTestWithoutDep", "Choose department");
        assertThat(addGroupSteps.isErrorNotSelectedDepDisplayed("Department must be specified"), is(true));
    }

    @AfterMethod
    public void logout() {
        navBarSteps.logout();
    }
}