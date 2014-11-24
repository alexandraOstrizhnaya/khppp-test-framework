
package khppp.tests;

import khppp.application.steps.NavBarSteps;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.equalTo;

/**
 * Created by Serhii_Pirohov on 18.11.2014.
 */
public class LoginTest extends BaseCase {
	private String sTestCaseName;
	private String sExpectedResultName;
	private int iTestCaseRow;
	private int iExpectedResultRow;
	NavBarSteps navBarSteps;

	@DataProvider(name = "Authentication")
	public Object[][] credentials() throws Exception {
		ExcelUtils.setExcelFile("loginUsers.xlsx", "loginUsers");
		sTestCaseName = this.toString();
		sTestCaseName = ExcelUtils.getTestCaseName(this.toString());
		iTestCaseRow = ExcelUtils.getRowContains(sTestCaseName, 0);
		sExpectedResultName = this.toString();
		sExpectedResultName = ExcelUtils.getExpectedResult(this.toString());
		iExpectedResultRow = ExcelUtils.getRowContains(sTestCaseName, 0);
		Object[][] testObArray = ExcelUtils.getTableArray("loginUsers.xlsx", "loginUsers", iTestCaseRow, iExpectedResultRow);
		return (testObArray);
	}

	@BeforeClass
	public void setUp() {
		navBarSteps = new NavBarSteps(pages);
	}

	@Test(dataProvider = "Authentication")
	public void userLogin(String username, String password, String sExpectedResultName) {
		open();
		loginSteps.login(username, password);
		assertThat(navBarSteps.loggedUserName(), equalTo(sExpectedResultName));
		navBarSteps.navigateTo("Logout");
	}

//    @Test
//    public void userIncorrectLogin() {
//        open();
//        loginSteps.login("Admin", "AdminPassword111");
//        assertThat(loginSteps.errorMessage(), is("Incorrect login or password"));
//    }

}
