package khppp.application.components;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import static org.openqa.selenium.By.*;

/**
 * Created by Serhii_Pirohov on 18.11.2014.
 */
public class UsersTab extends Component {

    public UsersTab(WebDriver driver) {
        super(driver);
    }

    public WebElement getAddUsersBtn(){
        return waitFor(xpath("//*[@id='wrap']//a[contains(.,'Add Users')]"));
    }

    public WebElement getExportBtn(){
        return waitFor(id("create_csv_button"));
    }

}
