package khppp.application.steps;

import khppp.application.components.NavBar;
import khppp.factory.PageFactory;

/**
 * Created by Serhii_Pirohov on 18.11.2014.
 */
public class NavBarSteps {

	NavBar navBar;

	public NavBarSteps(PageFactory factory) {
		this.navBar = factory.createPage(NavBar.class);
	}

	public String loggedUserName() {
		return navBar.getUserName().getText();
	}

	public void navigateTo(String tabName) {
		navBar.getTab(tabName).click();
	}

}
