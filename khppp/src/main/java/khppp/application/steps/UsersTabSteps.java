package khppp.application.steps;

import khppp.application.components.UsersTab;
import khppp.factory.PageFactory;

/**
 * Created by Serhii_Pirohov on 18.11.2014.
 */
public class UsersTabSteps {

    UsersTab usersTab;

    public UsersTabSteps(PageFactory factory){
        this.usersTab = factory.createPage(UsersTab.class);
    }

    public void addUser(String firstName,String lastName,String role){
        usersTab.getAddUsersBtn().click();
    }

}
