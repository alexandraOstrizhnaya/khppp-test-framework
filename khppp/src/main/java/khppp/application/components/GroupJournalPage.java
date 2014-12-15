package khppp.application.components;

import khppp.application.entitites.Subgroup;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Iryna_Perekhod on 12/10/2014.
 */
public class GroupJournalPage extends Component {

    public GroupJournalPage(WebDriver driver) {
        super(driver);
    }

    public void clickAddSubgroupBtn(){
        WebElement addSubgroupBtn = waitFor(By.xpath("//div[@class='submenu']/a[text()='Add Subgroup']"));
        addSubgroupBtn.click();
    }

    public List<Subgroup> getAllSubgroups() {
        int numberOfRows = waitForAll(xpath("//*[@id='table_group_journal']//tr")).size();
        System.out.println("ROWS " + numberOfRows);
        List<Subgroup> subgroups = new ArrayList<>();
        for (int i = 3; i < numberOfRows - 1; i++) {
            List<WebElement> columns = findAll(xpath(
                    "//*[@id='table_group_journal']//tr[%s]//td", i));
            Subgroup subgroup = new Subgroup();
            subgroup.setSubName(columns.get(1).getText());
            subgroup.setSubMentor(columns.get(3).getText());
            subgroups.add(subgroup);
        }
        return subgroups;
    }

    public boolean isCreatedSubgroupDisplayed(String subName) {
        return displayed(xpath("//td[contains(.,'%s')][2]", subName));
    }

    public boolean isEmptySignDisplayed(String subName){
        return displayed(xpath("//td[contains(.,'%s')][2]/span[@class='badge']", subName));
    }

}
