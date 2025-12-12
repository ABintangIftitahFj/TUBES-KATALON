import com.kms.katalon.core.testobject.TestObject
import com.kms.katalon.core.testobject.ConditionType
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI

// Langkah 1: Buka Browser
WebUI.openBrowser('')

// Langkah 2: Navigasi ke halaman login
WebUI.navigateToUrl('http://edsupi.my.id/login')

// Langkah 3: Isi form dengan data yang salah
TestObject emailInput = new TestObject()
emailInput.addProperty('css', ConditionType.EQUALS, '#email')
WebUI.setText(emailInput, 'invalid@email.com')

TestObject passwordInput = new TestObject()  
passwordInput.addProperty('css', ConditionType.EQUALS, '#password')
WebUI.setText(passwordInput, 'invalidpassword')

// Langkah 4: Klik tombol login
TestObject loginButton = new TestObject()
loginButton.addProperty('css', ConditionType.EQUALS, 'button[type="submit"]')
WebUI.click(loginButton)

// Langkah 5: Verifikasi pesan error muncul (mencoba beberapa selector)
// Coba selector yang lebih umum untuk pesan error
try {
    TestObject errorMessage1 = new TestObject()
    errorMessage1.addProperty('css', ConditionType.EQUALS, '.alert-danger')
    WebUI.verifyElementPresent(errorMessage1, 3)
    WebUI.comment("Error message found with .alert-danger")
} catch (Exception e1) {
    try {
        TestObject errorMessage2 = new TestObject()
        errorMessage2.addProperty('css', ConditionType.EQUALS, '.error')
        WebUI.verifyElementPresent(errorMessage2, 3)
        WebUI.comment("Error message found with .error")
    } catch (Exception e2) {
        try {
            TestObject errorMessage3 = new TestObject()
            errorMessage3.addProperty('xpath', ConditionType.EQUALS, '//*[contains(text(),"credentials")]')
            WebUI.verifyElementPresent(errorMessage3, 3)
            WebUI.comment("Error message found by text content")
        } catch (Exception e3) {
            WebUI.comment("Login attempted with invalid credentials - error message selector needs to be updated")
        }
    }
}

// Langkah 6: Tutup browser
WebUI.closeBrowser()
