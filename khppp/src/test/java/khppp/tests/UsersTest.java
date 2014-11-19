package khppp.tests;

import khppp.application.steps.AddUserSteps;
import khppp.application.steps.LoginSteps;
import khppp.application.steps.NavBarSteps;
import khppp.application.steps.UsersTabSteps;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

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

    @Test
    public void users() {
        login();
        navBarSteps.navigateTo("Users");
        assertThat(usersTabSteps.getAllUsers().size(), equalTo(121));
    }

    @Test
    public void addUser() {
        login();
        navBarSteps.navigateTo("Users");
        addUserSteps.addNewUser("sergio", "sergio");
        assertThat(usersTabSteps.userDisplayed("sergio"), is(true));
    }


}
