package khppp.tests;

import khppp.core.CoreTest;
import khppp.custom.listeners.CustomListener;
import khppp.custom.reporter.CustomReport;
import khppp.factory.PageFactory;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Listeners;
import ru.yandex.qatools.allure.annotations.Step;

import java.io.IOException;

/**
 * Created by Sergey on 02.11.2014.
 */
@Listeners(value = {CustomListener.class, CustomReport.class})
public abstract class BaseCase {

	public static final String DEFAULT_BROWSER = "firefox";
	CoreTest coreTest;
	PageFactory pages;

	@BeforeClass
	@Step("Start test run at {0}")
	public void configure() throws IOException {
		coreTest = new CoreTest();
		coreTest.setUpDriver(System.getProperty("browser", DEFAULT_BROWSER));
		pages = coreTest.getFactory();
	}

	@AfterClass
	public void shutDown() {
		coreTest.shutDown();
	}

	// @DataProvider
	// public Object[][] TestData(Method testMethod) throws Exception {
	// return coreTest.getTestData(testMethod);
	// }

	protected void open() {
		coreTest.open();
	}

}
