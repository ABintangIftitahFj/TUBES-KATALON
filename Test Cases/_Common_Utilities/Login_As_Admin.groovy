import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import internal.GlobalVariable as GlobalVariable

// 1. Open browser to base URL if not already open
if (WebUI.getWindowTitle() == '') {
    WebUI.openBrowser(GlobalVariable.G_URL_Web)
}

// 2. Navigate to /login
WebUI.navigateToUrl(GlobalVariable.G_URL_Web + '/login')

// 3. Set email
WebUI.setText(findTestObject('Object Repository/Page_Auth/input_email'), GlobalVariable.G_Admin_Email)

// 4. Set password
WebUI.setText(findTestObject('Object Repository/Page_Auth/input_password'), GlobalVariable.G_Admin_Pass)

// 5. Click login
WebUI.click(findTestObject('Object Repository/Page_Auth/btn_login'))

// 6. Verify Dashboard header present (login success)
WebUI.verifyElementPresent(findTestObject('Object Repository/Page_Admin_Dashboard/text_welcome_user'), GlobalVariable.G_Timeout)
