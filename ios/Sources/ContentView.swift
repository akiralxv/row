import SwiftUI
import WebKit

// A full-screen web view that loads the dashboard's HTML/JS straight from
// the app bundle (the "Web" folder). Everything runs locally on the phone;
// data is stored in the web view's own on-device storage (localStorage),
// so it persists between launches. No server, no account, private to you.
struct WebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        // .default() persists localStorage on the device between app launches.
        config.websiteDataStore = .default()

        let webView = WKWebView(frame: .zero, configuration: config)
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        webView.isOpaque = false
        webView.backgroundColor = .black
        webView.scrollView.backgroundColor = .black
        // Let the page's own CSS safe-area padding handle the notch / home bar.
        loadDashboard(into: webView)
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {}

    private func loadDashboard(into webView: WKWebView) {
        // "Web" is a blue folder reference in the Xcode project, so its
        // structure is preserved in the bundle and relative links + the
        // water iframe all resolve correctly.
        guard let indexURL = Bundle.main.url(
            forResource: "index",
            withExtension: "html",
            subdirectory: "Web"
        ) else {
            return
        }
        let webRoot = indexURL.deletingLastPathComponent()
        webView.loadFileURL(indexURL, allowingReadAccessTo: webRoot)
    }
}

struct ContentView: View {
    var body: some View {
        WebView()
            .ignoresSafeArea()          // full-bleed; the web CSS insets the content
            .background(Color.black)
    }
}
