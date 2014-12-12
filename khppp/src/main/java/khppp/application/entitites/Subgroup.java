package khppp.application.entitites;

import org.openqa.selenium.WebElement;

/**
 * Created by Anastasiia_Borodaiev on 12/12/2014.
 */
public class Subgroup {
    private String subName;
    private String subMentor;
    private WebElement editBtn;
    private WebElement removeBtn;

    public String getSubMentor() {
        return subMentor;
    }

    public void setSubMentor(String subMentor) {
        this.subMentor = subMentor;
    }

    public WebElement getEditBtn() {
        return editBtn;
    }

    public void setEditBtn(WebElement editBtn) {
        this.editBtn = editBtn;
    }

    public WebElement getRemoveBtn() {
        return removeBtn;
    }

    public void setRemoveBtn(WebElement removeBtn) {
        this.removeBtn = removeBtn;
    }

    public String getSubName() {
        return subName;
    }

    public void setSubName(String subName) {
        this.subName = subName;
    }
}

