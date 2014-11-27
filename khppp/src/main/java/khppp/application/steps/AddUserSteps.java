package khppp.application.steps;

import khppp.application.components.AddUserTab;
import khppp.application.components.UsersTab;
import khppp.factory.PageFactory;
import ru.yandex.qatools.allure.annotations.Step;

/**
 * Created by Serhii_Pirohov on 19.11.2014.
 */
public class AddUserSteps {

	AddUserTab addUserTab;
	UsersTab usersTab;

	public AddUserSteps(PageFactory factory) {
		this.addUserTab = factory.createPage(AddUserTab.class);
		this.usersTab = factory.createPage(UsersTab.class);
	}

	@Step("When I add new user {0},{1}")
	public void addNewUser(String fName, String lName) {
		usersTab.getAddUsersBtn().click();
        addUserTab.enterFirstName(fName);
		addUserTab.enterLastName(lName);
		addUserTab.clickSave();
	}

}
