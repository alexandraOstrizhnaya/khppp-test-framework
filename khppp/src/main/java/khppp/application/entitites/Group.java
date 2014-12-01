package khppp.application.entitites;

/**
 * Created by Oleksandra_Ostrizhna on 11/28/2014.
 */
public class Group {

    private String groupName;
    private String depName;
    private String labManName;

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String firstName) {
        this.groupName = groupName;
    }

    public String getDepName() {
        return depName;

    }public void setDepName(String lastName) {
        this.depName = depName;
    }

    public String getLabManName() {
        return labManName;
    }

    public void setLabManName(String labManName) {
        this.labManName = labManName;
    }

    @Override
    public String toString() {
        return "Group{" +
                "groupName='" + groupName + '\'' +
                ", depName='" + depName + '\'' +
                ", labManName='" + labManName + '\'' +
                '}';
    }
}
