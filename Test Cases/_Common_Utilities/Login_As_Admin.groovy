import com.kms.katalon.core.testobject.TestObject
import com.kms.katalon.core.testobject.ConditionType
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI

// Reusable admin login function
if (WebUI.getWindowTitle() == '') {
    WebUI.openBrowser('')
}

WebUI.navigateToUrl('http://edsupi.my.id/login')

TestObject emailInput = new TestObject()
emailInput.addProperty('css', ConditionType.EQUALS, '#email')
WebUI.setText(emailInput, 'admineds123@gmail.com')

TestObject passwordInput = new TestObject()
passwordInput.addProperty('css', ConditionType.EQUALS, '#password')
WebUI.setText(passwordInput, 'edsupi123#%')

TestObject loginButton = new TestObject()
loginButton.addProperty('css', ConditionType.EQUALS, 'button[type="submit"]')
WebUI.click(loginButton)

// Verify login success
TestObject dashboardElement = new TestObject()
dashboardElement.addProperty('css', ConditionType.EQUALS, 'h1')
WebUI.verifyElementPresent(dashboardElement, 10)
