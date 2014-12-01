package khppp.tests;

import khppp.application.steps.AddUserSteps;
import khppp.application.steps.LoginSteps;
import khppp.application.steps.NavBarSteps;
import khppp.application.steps.UsersTabSteps;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import java.lang.reflect.Method;
import java.util.List;

import static khppp.excel.utils.ExcelColumn.EXPECTED;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.is;

/**
 * Created by Serhii_Pirohov on 19.11.2014.
 */
public class UsersTest extends BaseCase {

    LoginSteps loginSteps;
    AddUserSteps addUserSteps;
    NavBarSteps navBarSteps;
    UsersTabSteps usersTabSteps;

    @BeforeClass
    public void setUp() {
        loginSteps = new LoginSteps(pages);
        addUserSteps = new AddUserSteps(pages);
        navBarSteps = new NavBarSteps(pages);
        usersTabSteps = new UsersTabSteps(pages);
    }

    @DataProvider(name = "users")
    public Object[][] credentials(Method method) throws Exception {
        return testData(method, "Users");
    }

  /*  @Test(dataProvider = "users")
    public void users(List<String> data) {
        login(data);
        navBarSteps.navigateTo("Users");
        assertThat(usersTabSteps.getAllUsers().size(),
                equalTo(Double.valueOf(data.get(EXPECTED)).intValue()));
    }

    @Test(dataProvider = "users")
    public void addUser(List<String> data) {
        login(data);
        navBarSteps.navigateTo("Users");
        addUserSteps.addNewUser("sashaa", "sashaa");
        assertThat(usersTabSteps.userDisplayed("sashaa"), is(true));
    }*/

}
