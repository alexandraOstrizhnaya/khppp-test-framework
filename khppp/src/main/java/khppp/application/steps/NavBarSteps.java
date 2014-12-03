package khppp.application.steps;

import khppp.application.components.NavBar;
import khppp.factory.PageFactory;
import ru.yandex.qatools.allure.annotations.Step;

/**
 * Created by Serhii_Pirohov on 18.11.2014.
 */
public class NavBarSteps {

	NavBar navBar;

	public NavBarSteps(PageFactory factory) {
		this.navBar = factory.createPage(NavBar.class);
	}

	@Step("Then get logged user name")
	public String loggedUserName() {
		return navBar.getUserName().getText();
	}

	@Step("When I navigate to {0}")
	public void navigateTo(String tabName) {
		navBar.getTab(tabName).click();
	}

}
