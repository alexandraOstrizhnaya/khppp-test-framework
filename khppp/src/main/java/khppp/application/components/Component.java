package khppp.application.components;

import lombok.extern.slf4j.Slf4j;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.List;
import java.util.concurrent.TimeUnit;

import static java.lang.String.format;
import static org.openqa.selenium.support.ui.ExpectedConditions.*;

/**
 * Created by Sergey on 04.11.2014.
 */
@Slf4j
public abstract class Component {

	private static String windowHandler;
	public static final int TIME_OUT_IN_SECONDS = 30;
	private WebDriver driver;

	public Component(WebDriver driver) {
		this.driver = driver;
		driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
	}

	public WebDriver getDriver() {
		return driver;
	}

	public WebDriverWait getWait() {
		return new WebDriverWait(getDriver(), TIME_OUT_IN_SECONDS);
	}

	/**
	 * @deprecated
	 */
	@Deprecated
	public WebElement find(By locator) {
		log.info(format("Searching element %s", locator));
		return getDriver().findElement(locator);
	}

	public List<WebElement> findAll(By locator) {
		log.info(format("Searching elements %s", locator));
		return getDriver().findElements(locator);
	}

	public void typeInto(WebElement input, String value) {
		input.clear();
		input.sendKeys(value);
		log.info(format("Enter into %s value %s", input, value));
	}

	public void wait(ExpectedCondition condition) {
		log.info(format("Wait until %s", condition));
		getWait().until(condition);
	}

	public void waitUntilFrameLoad(By locator) {
		getWait().until(visibilityOfElementLocated(locator));
	}

	public WebElement waitFor(By by, int timeOut) {
		log.info(format("Wait for %s", by));
		WebDriverWait wait = new WebDriverWait(driver, timeOut);
		return wait.until(visibilityOfElementLocated(by));
	}

	public List<WebElement> waitForAll(By by) {
		log.info(format("Wait for %s", by));
		WebDriverWait wait = new WebDriverWait(driver, TIME_OUT_IN_SECONDS);
		return wait.until(visibilityOfAllElementsLocatedBy(by));
	}

	public WebElement waitFor(By by) {
		return waitFor(by, TIME_OUT_IN_SECONDS);
	}

	public boolean waitForInvisible(By locator) {
		return getWait().until(invisibilityOfElementLocated(locator));
	}

	public void switchToFrame(String nameOrId) {
		log.info(format("Switching into frame %s", nameOrId));
		getDriver().switchTo().frame(nameOrId);
	}

	protected void switchToFrame(WebElement el) {
		log.info(format("Switching into frame %s", el));
		getDriver().switchTo().frame(el);
	}

	protected boolean displayed(By locator) {
		return findAll(locator).isEmpty();
	}

	public void rememberMainWindowHandler() {
		windowHandler = getDriver().getWindowHandle();
		log.info("Main window was remembered " + windowHandler);
	}


	protected By xpath(String s, Object... args) {
		return By.xpath(String.format(s,args));
	}

	public static String getMainWindowHandler() {
		return windowHandler;
	}
}
