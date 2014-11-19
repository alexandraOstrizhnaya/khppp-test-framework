package khppp.tests;

import khppp.application.steps.NavBarSteps;

import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.*;

/**
 * Created by Serhii_Pirohov on 18.11.2014.
 */
public class LoginTest extends BaseCase {

	NavBarSteps navBarSteps;

	@BeforeClass
	public void setUp() {
		navBarSteps = new NavBarSteps(pages);
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
		assertThat(loginSteps.errorMessage(), is("Incorrect login or password"));
	}

}
