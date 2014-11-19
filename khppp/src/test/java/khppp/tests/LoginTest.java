package khppp.tests;

import khppp.application.steps.LoginSteps;
import khppp.application.steps.NavBarSteps;
import khppp.application.steps.UsersTabSteps;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import static org.hamcrest.MatcherAssert.*;
import static org.hamcrest.Matchers.*;

/**
 * Created by Serhii_Pirohov on 18.11.2014.
 */
public class LoginTest extends BaseCase {

	LoginSteps loginSteps;
	NavBarSteps navBarSteps;
	UsersTabSteps usersTabSteps;

	@BeforeClass
	public void setUp() {
		loginSteps = new LoginSteps(pages);
		navBarSteps = new NavBarSteps(pages);
		usersTabSteps = new UsersTabSteps(pages);
	}

	@Test
	public void userLogin() {
		open();
		loginSteps.login("Admin_Admin", "Admin111");
		assertThat(navBarSteps.loggedUserName(), equalTo("AdminAdmin (ADMIN)"));
	}

	@Test
	public void userIncorrectLogin() {
		open();
		loginSteps.login("Admin", "AdminPassword111");
		assertThat(loginSteps.errorMessage(),is("Incorrect login or password"));
	}



}
