package khppp.application.components;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

/**
 * Created by Serhii_Pirohov on 19.11.2014.
 */
public class AddUserTab extends Component {

	public AddUserTab(WebDriver driver) {
		super(driver);
	}

	public void enterFirstName(String firstName) {
		WebElement fName = waitFor(xpath("//*[@id='registration_table']//tr[1]/td[1]/input"));
		typeInto(fName, firstName);
	}

	public void enterLastName(String lastName) {
		WebElement lName = waitFor(xpath("//*[@id='registration_table']//tr[1]/td[2]/input"));
		typeInto(lName, lastName);
	}

	public void clickSave() {
		waitFor(xpath("//*[@id='registration_form']/div/form/button[1]"))
				.click();
	}

}
