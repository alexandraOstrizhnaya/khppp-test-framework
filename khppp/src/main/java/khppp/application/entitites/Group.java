package khppp.application.entitites;

import org.openqa.selenium.WebElement;

/**
 * Created by Oleksandra_Ostrizhna on 11/28/2014.
 */
public class Group {

    private String groupName;
    private String depName;
    private String labManName;
    private String numOfMentees;
    private WebElement editGroupBtn;

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getDepName() {
        return depName;

    }

    public void setDepName(String depName) {
        this.depName = depName;
    }

    public String getLabManName() {
        return labManName;
    }

    public void setLabManName(String labManName) {
        this.labManName = labManName;
    }

    public String getNumOfMentees() {
        return numOfMentees;
    }

    public void setNumOfMentees(String numOfMentees) {
        this.numOfMentees = numOfMentees;
    }

    public WebElement getEditGroupBtn() {
        return editGroupBtn;
    }

    public void setEditGroupBtn(WebElement editGroupBtn) {
        this.editGroupBtn = editGroupBtn;
    }

    @Override
    public String toString() {
        return "Group{" +
                "groupName='" + groupName + '\'' +
                ", number of mentees='" + numOfMentees + '\'' +
                ", depName='" + depName + '\'' +
                ", labManName='" + labManName + '\'' +
                '}';
    }
}
