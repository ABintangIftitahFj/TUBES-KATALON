import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import com.kms.katalon.core.model.FailureHandling

// This test case now calls the reusable login script
WebUI.callTestCase(findTestCase('Test Cases/_Common_Utilities/Login_As_Admin'), [:], FailureHandling.STOP_ON_FAILURE)

// The verification is already in the common script, but we can add another one here if needed.
WebUI.comment("Admin login successful.")

// Close browser at the end of the smoke test
WebUI.closeBrowser()
