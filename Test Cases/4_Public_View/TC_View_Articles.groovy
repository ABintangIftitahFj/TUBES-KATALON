import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import internal.GlobalVariable as GlobalVariable

WebUI.openBrowser('')
WebUI.navigateToUrl(GlobalVariable.G_URL_Web)
WebUI.verifyElementPresent(findTestObject('Object Repository/Page_Public/link_article_title'), 10)
WebUI.click(findTestObject('Object Repository/Page_Public/link_article_title'))
WebUI.verifyUrl(contains: '/posts/')
WebUI.closeBrowser()
