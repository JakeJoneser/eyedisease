import UIKit
import StoreKit
class AboutViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "About"
    }
    @IBAction func tapRateAppStoreAction(sender: Any) {
        if #available(iOS 10.3, *) {SKStoreReviewController.requestReview()}
                  else if let url = URL(string: "itms-apps://itunes.apple.com/app/id1522994196") {
                     if #available(iOS 10, *) {UIApplication.shared.open(url, options: [:], completionHandler: nil)}
                      else {UIApplication.shared.openURL(url)}
                 }
    }
}
