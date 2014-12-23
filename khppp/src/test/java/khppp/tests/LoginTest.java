package khppp.tests;

import khppp.application.steps.NavBarSteps;
import lombok.extern.slf4j.Slf4j;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;
import ru.yandex.qatools.allure.annotations.Features;

import java.util.List;

import static khppp.application.Features.LOGIN;
import static khppp.excel.utils.ExcelColumn.*;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.is;

/**
 * Created by Serhii_Pirohov on 18.11.2014.
 */
@Slf4j
public class LoginTest extends BaseCase {

    @BeforeClass
    public void setUp() {
        navBarSteps = new NavBarSteps(pages);
    }

    @Features(LOGIN)
    @Test(dataProvider = "testData")
    public void userLogin(List<String> data) {
        open();
        loginSteps.login(data.get(USER_NAME), data.get(USER_PASS));
        String loggedUserName = navBarSteps.loggedUserName();
        navBarSteps.navigateTo("Logout");
        assertThat(loggedUserName, equalTo(data.get(EXPECTED)));
    }

    @Features(LOGIN)
    @Test(dataProvider = "testData")
    public void userIncorrectLogin(List<String> data) {
        open();
        loginSteps.login(data.get(USER_NAME), data.get(USER_PASS));
        assertThat(loginSteps.incorrectLoginPassword(), is(data.get(EXPECTED)));
    }

    @Features(LOGIN)
    @Test(dataProvider = "testData")
    public void userEmptyLogin(List<String> data) {
        open();
        loginSteps.login(" ", data.get(USER_PASS));
        assertThat(loginSteps.incorrectLoginPassword(), is(data.get(EXPECTED)));
    }

    @Features(LOGIN)
    @Test(dataProvider = "testData")
    public void userEmptyPassword(List<String> data) {
        open();
        loginSteps.login(data.get(USER_NAME), " ");
        assertThat(loginSteps.incorrectLoginPassword(), is(data.get(EXPECTED)));
    }
}
