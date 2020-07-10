import UIKit
import Crashlytics
class DetailsViewController: UIViewController {
    @IBOutlet var descriptionText: UILabel!
    @IBOutlet var peopleAffectedText: UILabel!
    @IBOutlet var inheritedText: UILabel!
    @IBOutlet var sourcesText: UILabel!
    @IBOutlet var keyFactsText: UILabel!
    @IBOutlet var areasAffectedText: UILabel!
    var currentDisease: Disease?
    override func viewDidLoad() {
        super.viewDidLoad()
        if currentDisease?.getDiseaseTitle == "莱伯遗传性视神经病变（LHON）" {
            self.title = "LHON"
        } else if currentDisease?.getDiseaseTitle == "视神经脊髓炎（Devic's Disease）" {
            self.title = "Devic's Disease"
        } else {
            self.title = currentDisease?.getDiseaseTitle
        }
        descriptionText.text = currentDisease?.getDescriptionText
        areasAffectedText.text = currentDisease?.getAreasAffectedText
        peopleAffectedText.text = currentDisease?.getPeopleText
        keyFactsText.text = currentDisease?.getKeyFacts
        if currentDisease?.getInheritedBool == false {
            inheritedText.text = "不会遗传"
        } else {
            inheritedText.text = "会遗传"
        }
        sourcesText.text = "数据来源: " + (currentDisease?.getSourcesText)!
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "camView" {
            if let destination = segue.destination as? CameraViewController {
                destination.currentDisease = currentDisease
            }
        }
    }
}
