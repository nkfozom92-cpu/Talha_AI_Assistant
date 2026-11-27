package com.talha.aiassistant

import android.app.Activity
import android.os.Bundle
import android.webkit.WebChromeClient
import android.webkit.WebView
import android.webkit.WebViewClient
import android.webkit.WebSettings

class MainActivity : Activity() {
    private lateinit var web: WebView
    @Suppress("SetJavaScriptEnabled")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        web = WebView(this)
        web.settings.javaScriptEnabled = true
        web.settings.domStorageEnabled = true
        web.settings.cacheMode = WebSettings.LOAD_DEFAULT
        web.webChromeClient = WebChromeClient()
        web.webViewClient = WebViewClient()
        web.loadUrl("file:///android_asset/index.html")
        setContentView(web)
    }
    @Deprecated("Deprecated in Android")
    override fun onBackPressed() {
        if (web.canGoBack()) web.goBack() else super.onBackPressed()
    }
}
