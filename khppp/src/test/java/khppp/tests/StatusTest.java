package khppp.tests;

import khppp.application.steps.*;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;
import ru.yandex.qatools.allure.annotations.Features;

import java.lang.reflect.Method;
import java.util.List;

import static khppp.application.Features.STATUS;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;

/**
 * Created by Iryna_Perekhod on 11/28/2014.
 */
public class StatusTest extends BaseCase {

    LoginSteps loginSteps;
    AddUserSteps addUserSteps;
    NavBarSteps navBarSteps;
    UsersTabSteps usersTabSteps;
    StatusSteps statusSteps;

    @BeforeClass
    public void setUp() {
        loginSteps = new LoginSteps(pages);
        addUserSteps = new AddUserSteps(pages);
        navBarSteps = new NavBarSteps(pages);
        usersTabSteps = new UsersTabSteps(pages);
        statusSteps = new StatusSteps(pages);
    }

    @DataProvider(name = "status")
    public Object[][] credentials(Method method) throws Exception {
        return testData(method, "Status");
    }

    @Features(STATUS)
         @Test(dataProvider = "status")
         public void changeStatus(List<String> data) {
        login(data);
        navBarSteps.navigateTo("Users");
        usersTabSteps.getFirstUser().click();
        statusSteps.clickTaskNameStep();
        statusSteps.clickCloseBtnStep();
        assertThat(statusSteps.verifyStatusChanged("Closed"), is(true));
        statusSteps.clickTaskNameStep();
        statusSteps.clickInProgressBtnStep();
        assertThat(statusSteps.verifyStatusChanged("In progress"), is(true));
    }

}
