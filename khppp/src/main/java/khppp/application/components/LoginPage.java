package khppp.application.components;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import static org.openqa.selenium.By.id;

/**
 * Created by Serhii_Pirohov on 18.11.2014.
 */
public class LoginPage extends Component {

	public LoginPage(WebDriver driver) {
		super(driver);
	}

	public void enterLogin(String name) {
		WebElement email = waitFor(id("exampleInputEmail1"));
		typeInto(email, name);
	}

	public void enterPassword(String pass) {
		WebElement password = waitFor(id("exampleInputPassword1"));
		typeInto(password, pass);
	}

	public void clickLoginBtn() {
		WebElement loginBtn = waitFor(id("login_button"));
		loginBtn.click();
	}
}
