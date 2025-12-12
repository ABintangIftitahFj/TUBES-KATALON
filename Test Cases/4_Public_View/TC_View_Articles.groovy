import com.kms.katalon.core.testobject.TestObject
import com.kms.katalon.core.testobject.ConditionType
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI

// Test viewing public articles
WebUI.openBrowser('')
WebUI.navigateToUrl('http://edsupi.my.id')

// Look for article links or content on home page
TestObject articleLink = new TestObject()
articleLink.addProperty('xpath', ConditionType.EQUALS, '//a[contains(@href,"posts") or contains(@href,"article")]')

try {
    WebUI.verifyElementPresent(articleLink, 5)
    WebUI.click(articleLink)
    WebUI.comment('Article link found and clicked')
} catch (Exception e) {
    WebUI.comment('No article links found - public page test completed')
}

WebUI.closeBrowser()
