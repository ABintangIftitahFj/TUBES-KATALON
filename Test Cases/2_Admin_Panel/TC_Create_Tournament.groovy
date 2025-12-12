import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import internal.GlobalVariable as GlobalVariable
import com.kms.katalon.core.testcase.TestCaseFactory as TestCaseFactory

// First, login as admin
WebUI.callTestCase(TestCaseFactory.findTestCase('Test Cases/_Common_Utilities/Login_As_Admin'), [:], FailureHandling.STOP_ON_FAILURE)

// Navigate to tournaments page
WebUI.click(findTestObject('Object Repository/Page_Admin_Dashboard/menu_tournaments'))

// Click create new tournament
WebUI.click(findTestObject('Object Repository/Page_Tournament_Mgmt/btn_create_new'))

// Verify on create page by checking for the name input
WebUI.verifyElementPresent(findTestObject('Object Repository/Page_Tournament_Mgmt/input_tournament_name'), GlobalVariable.G_Timeout)

// Fill in the form
def tournamentName = 'Katalon Auto-Test Tournament ' + System.currentTimeMillis()
WebUI.setText(findTestObject('Object Repository/Page_Tournament_Mgmt/input_tournament_name'), tournamentName)
WebUI.selectOptionByValue(findTestObject('Object Repository/Page_Tournament_Mgmt/select_format'), 'Asian', true)

// Click Save
WebUI.click(findTestObject('Object Repository/Page_Tournament_Mgmt/btn_save'))

// Verify that we are redirected back to the tournament list
WebUI.verifyElementPresent(findTestObject('Object Repository/Page_Tournament_Mgmt/btn_create_new'), GlobalVariable.G_Timeout)

// Optional: Verify the new tournament exists in the table
// WebUI.verifyElementPresent(findTestObject('path/to/table/cell/with/new/tournament/name'), 10)

WebUI.closeBrowser()
