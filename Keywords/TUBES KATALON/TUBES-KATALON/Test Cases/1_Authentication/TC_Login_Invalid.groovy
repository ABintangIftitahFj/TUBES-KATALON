import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import internal.GlobalVariable as GlobalVariable

// Langkah 1: Buka Browser
WebUI.openBrowser('')

// Langkah 2: Navigasi ke halaman login
WebUI.navigateToUrl(GlobalVariable.G_URL_Web + '/login')

// Langkah 3: Isi form dengan data yang salah
WebUI.setText(findTestObject('Object Repository/Page_Auth/input_email'), 'invalid@email.com')
WebUI.setText(findTestObject('Object Repository/Page_Auth/input_password'), 'invalidpassword')

// Langkah 4: Klik tombol login
WebUI.click(findTestObject('Object Repository/Page_Auth/btn_login'))

// Langkah 5: Verifikasi pesan error muncul
WebUI.verifyElementPresent(findTestObject('Object Repository/Page_Auth/msg_error_credentials'), 10)

// Langkah 6: Tutup browser
WebUI.closeBrowser()
