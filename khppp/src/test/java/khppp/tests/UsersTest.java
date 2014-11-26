package khppp.tests;

import khppp.application.steps.AddUserSteps;
import khppp.application.steps.LoginSteps;
import khppp.application.steps.NavBarSteps;
import khppp.application.steps.UsersTabSteps;
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
        ExcelReader excelReader = new ExcelReader();
        excelReader.setExcelFile("testData.xlsx", "Users");
        List<Integer> rowsNo = excelReader.getRowContains(method.getName(), 0);
        return excelReader.getTableArray(rowsNo);
    }

    @Test(dataProvider = "users")
    public void users(String username, String password,
                     String sExpectedResultName) {
        login(username,password);
        navBarSteps.navigateTo("Users");
        assertThat(usersTabSteps.getAllUsers().size(), equalTo(Double.valueOf(sExpectedResultName).intValue()));
    }

    @Test(dataProvider = "users")
    public void addUser(String username, String password,String newUserName,String newUser) {
        login(username, password);
        navBarSteps.navigateTo("Users");
        addUserSteps.addNewUser("sergio", "sergio");
        assertThat(usersTabSteps.userDisplayed("sergio"), is(true));
    }


}
