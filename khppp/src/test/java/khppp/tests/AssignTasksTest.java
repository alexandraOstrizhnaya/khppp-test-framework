package khppp.tests;

import khppp.application.steps.*;
import khppp.excel.utils.ExcelColumn;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;
import ru.yandex.qatools.allure.annotations.Features;

import java.util.List;

import static khppp.excel.utils.ExcelColumn.*;
import static khppp.application.Features.ASSIGN_TASK;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;

/**
 * Created by Oleksandra_Ostrizhna on 12/17/2014.
 */
public class AssignTasksTest extends BaseCase {

    LoginSteps loginSteps;
    NavBarSteps navBarSteps;
    GroupsTabSteps groupsTabSteps;
    GroupJournalSteps groupJournalSteps;
    AssignTasksSteps assignTasksSteps;

    @BeforeClass
    public void setUp() {
        loginSteps = new LoginSteps(pages);
        navBarSteps = new NavBarSteps(pages);
        groupsTabSteps = new GroupsTabSteps(pages);
        groupJournalSteps = new GroupJournalSteps(pages);
        assignTasksSteps = new AssignTasksSteps(pages);
    }


    @Test(dataProvider = "testData", priority = 1)
    public void preConditions(List<String> data) {
        login(data);
        goToGroupsTab();
        groupsTabSteps.goToNotEmptyGroup();
        assignTasksSteps.assignTaskToOneMentee();
    }

    @Features(ASSIGN_TASK)
    @Test(dependsOnMethods = "preConditions")
    public void allElementsAreDisplayed() {
        assertThat(assignTasksSteps.assignTaskTabContainsAllElements(), is(true));
    }

    @Features(ASSIGN_TASK)
    @Test(dataProvider = "testData", dependsOnMethods = "preConditions")
    public void menteesAreDisplayedInSelectedMenteesField(List<String> data) {
        assertThat(assignTasksSteps.menteeIsDisplayedInSelectedMenteesField(data.get(MENTEE_NAME)), is(true));
    }


    @Features(ASSIGN_TASK)
    @Test(dataProvider = "testData", dependsOnMethods = "preConditions")
    public void correctlyAssignTaskToOneMentee(List<String> data) {
        assignTasksSteps.popUpWindowAssignTaskAppears(data.get(TASK_TYPE), data.get(DEPARTMENT_NAME), data.get(TASK_NAME), data.get(ASSIGN_TASK_DIALOG));
    }

    @AfterClass
    public void logout() {
        navBarSteps.logout();
    }
}
