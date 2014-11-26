package khppp.tests;

import khppp.application.steps.NavBarSteps;
import khppp.excel.utils.ExcelReader;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import java.lang.reflect.Method;
import java.util.List;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.is;

/**
 * Created by Serhii_Pirohov on 18.11.2014.
 */
public class LoginTest extends BaseCase {
	NavBarSteps navBarSteps;

	@DataProvider(name = "authentication")
	public Object[][] credentials(Method method) throws Exception {
		ExcelReader excelReader = new ExcelReader();
		excelReader.setExcelFile("testData.xlsx", "Login");
		List<Integer> rowsNo = excelReader.getRowContains(method.getName(), 0);
		return excelReader.getTableArray(rowsNo);
	}

	@BeforeClass
	public void setUp() {
		navBarSteps = new NavBarSteps(pages);
	}

	@Test(dataProvider = "authentication")
	public void userLogin(String username, String password,
			String sExpectedResultName) {
		open();
		loginSteps.login(username, password);
		String loggedUserName = navBarSteps.loggedUserName();
		navBarSteps.navigateTo("Logout");
		assertThat(loggedUserName, equalTo(sExpectedResultName));
	}

	@Test(dataProvider = "authentication")
	public void userIncorrectLogin(String username, String password,
			String sExpectedResultName) {
		open();
		loginSteps.login(username, password);
		assertThat(loginSteps.errorMessage(), is(sExpectedResultName));
	}

}
