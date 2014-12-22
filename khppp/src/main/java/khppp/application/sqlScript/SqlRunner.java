package khppp.application.sqlScript;


import com.ibatis.common.jdbc.ScriptRunner;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.Reader;
import java.sql.Connection;

public class SqlRunner implements Scripts {

    public static void runSQLScript(String scriptPath) {

        Connection connection = null;
        try {
            connection = ConnectorDB.getConnection();
            ScriptRunner sr = new ScriptRunner(connection, false, false);
            Reader reader = new BufferedReader(
                    new FileReader(scriptPath));
            sr.runScript(reader);

        } catch (Exception e) {
            System.err.println("Failed to Execute" + scriptPath
                    + " The error is " + e.getMessage());
        }
    }
}
