struct AppUtility {
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation: UIInterfaceOrientation) {
        self.lockOrientation(orientation)
        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
    }
}
import UIKit
class CameraViewController: UIViewController {
    @IBOutlet var overlayView: UIImageView!
    @IBOutlet var cameraView: UIView!
    var diseaseTitle: String = ""
    var currentDisease: Disease?
    var blur = UIBlurEffect(style: UIBlurEffectStyle.light)
    var blurView = UIVisualEffectView()
    @IBAction func back(_ sender: Any) {
        self.performSegue(withIdentifier: "diseaseList", sender: nil)
    }
    @IBAction func details(_ sender: Any) {
        self.performSegue(withIdentifier: "details", sender: nil)
    }
    @IBOutlet var sliderControl: UISlider!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBAction func segmentedControl(_ sender: Any) {
        switch diseaseTitle {
        case "青光眼":
            switch segmentedControl.selectedSegmentIndex {
            case 0:
                overlayView.image = UIImage(named: "glaucoma_early")
            case 1:
                overlayView.image = UIImage(named: "glaucoma_middle")
            case 2:
                overlayView.image = UIImage(named: "glaucoma_late")
            default:
                overlayView.image = UIImage(named: "glaucoma_early")
            }
        case "黄斑变性":
            switch segmentedControl.selectedSegmentIndex {
            case 0:
                overlayView.image = UIImage(named: "mac_early")
            case 1:
                overlayView.image = UIImage(named: "mac_middle")
            case 2:
                overlayView.image = UIImage(named: "mac_late")
            default:
                overlayView.image = UIImage(named: "mac_early")
                break
            }
        case "视网膜脱离":
            switch segmentedControl.selectedSegmentIndex {
            case 0:
                overlayView.image = UIImage(named: "rd")
            case 1:
                overlayView.image = UIImage(named: "retinal_detachment1")
            case 2:
                overlayView.image = UIImage(named: "retinal_detachment2")
            default:
                overlayView.image = UIImage(named: "rd")
                break
            }
        case "斯塔加特病":
            switch segmentedControl.selectedSegmentIndex {
            case 0:
                overlayView.image = UIImage(named: "mac_early")
            case 1:
                overlayView.image = UIImage(named: "mac_middle")
            case 2:
                overlayView.image = UIImage(named: "mac_late")
            default:
                overlayView.image = UIImage(named: "mac_early")
                break
            }
        case "莱伯遗传性视神经病变（LHON）":
            switch segmentedControl.selectedSegmentIndex {
            case 0:
                overlayView.image = UIImage(named: "mac_early")
            case 1:
                overlayView.image = UIImage(named: "mac_middle")
            case 2:
                overlayView.image = UIImage(named: "mac_late")
            default:
                overlayView.image = UIImage(named: "mac_early")
                break
            }
        case "糖尿病性视网膜病变":
            switch segmentedControl.selectedSegmentIndex {
            case 0:
                overlayView.image = UIImage(named: "DR")
            case 1:
                overlayView.image = UIImage(named: "rd2")
            default:
                overlayView.image = UIImage(named: "DR")
            }
        case "色素性视网膜炎（RP）":
            switch segmentedControl.selectedSegmentIndex {
            case 0:
                overlayView.image = UIImage(named: "glaucoma_early")
            case 1:
                overlayView.image = UIImage(named: "glaucoma_middle")
            case 2:
                overlayView.image = UIImage(named: "glaucoma_late")
            default:
                overlayView.image = UIImage(named: "glaucoma_early")
            }
        case "巴德特·比德尔综合征":
            switch segmentedControl.selectedSegmentIndex {
            case 0:
                overlayView.image = UIImage(named: "glaucoma_early")
            case 1:
                overlayView.image = UIImage(named: "glaucoma_middle")
            case 2:
                overlayView.image = UIImage(named: "glaucoma_late")
            default:
                overlayView.image = UIImage(named: "glaucoma_early")
            }
        case "视神经脊髓炎（Devic's Disease）":
            switch segmentedControl.selectedSegmentIndex {
            case 0:
                overlayView.image = UIImage(named: "mac_early")
            case 1:
                overlayView.image = UIImage(named: "mac_middle")
            case 2:
                overlayView.image = UIImage(named: "Devic")
            default:
                overlayView.image = UIImage(named: "mac_early")
            }
        default:
            break
        }
    }
    @IBAction func sliderControl(_ sender: Any) {
        blurView.alpha = CGFloat(sliderControl.value)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraView.addCameraBackground()
        blurView.effect = blur
        if currentDisease?.getDiseaseTitle == "莱伯遗传性视神经病变（LHON）" {
            self.title = "LHON"
        } else if currentDisease?.getDiseaseTitle == "视神经脊髓炎（Devic's Disease）" {
            self.title = "Devic's Disease"
        } else {
            self.title = currentDisease?.getDiseaseTitle
        }
        segmentedControl.tintColor = hexStringToUIColor(hex: "#21BECE")
        segmentedControl.backgroundColor = UIColor.white
        segmentedControl.layer.cornerRadius = 5
        diseaseTitle = (currentDisease?.getDiseaseTitle)!
        applyFilter()
    }
    func applyFilter() {
        switch diseaseTitle {
            case "青光眼":
                print(diseaseTitle)
                overlayView.image = UIImage(named: "glaucoma_early")
                sliderControl.isHidden = true
            case "视网膜脱离":
                overlayView.image = UIImage(named: "rd")
                sliderControl.isHidden = true
                segmentedControl.setTitle("Ex 1", forSegmentAt: 0)
                segmentedControl.setTitle("Ex 2", forSegmentAt: 1)
                segmentedControl.setTitle("Ex 3", forSegmentAt: 2)
            case "视神经炎（神经病）":
                blurView.alpha = 0.5
                blurView.frame = cameraView.bounds
                cameraView.addSubview(blurView)
                segmentedControl.isHidden = true
            case "白内障":
                blurView.alpha = 0.5
                blurView.frame = cameraView.bounds
                cameraView.addSubview(blurView)
                segmentedControl.isHidden = true
            case "角膜营养不良":
                blurView.alpha = 0.5
                blurView.frame = cameraView.bounds
                cameraView.addSubview(blurView)
                segmentedControl.isHidden = true
            case "视神经脊髓炎（Devic's Disease）":
                overlayView.image = UIImage(named: "mac_early")
                sliderControl.isHidden = true
            case "色素性视网膜炎（RP）":
                overlayView.image = UIImage(named: "glaucoma_early")
                sliderControl.isHidden = true
            case "黄斑变性":
                overlayView.image = UIImage(named: "mac_early")
                blurView.frame = cameraView.bounds
                blurView.alpha = 0.5
                cameraView.addSubview(blurView)
                sliderControl.isHidden = true
            case "糖尿病性视网膜病变":
                overlayView.image = UIImage(named: "DR")
                sliderControl.isHidden = true
                segmentedControl.removeSegment(at: 2, animated: false)
                segmentedControl.setTitle("Ex 1", forSegmentAt: 0)
                segmentedControl.setTitle("Ex 2", forSegmentAt: 1)
            case "莱伯先天性阿玛特病":
                blurView.frame = cameraView.bounds
                blurView.alpha = 0.5
                cameraView.addSubview(blurView)
                segmentedControl.isHidden = true
            case "莱伯遗传性视神经病变（LHON）":
                overlayView.image = UIImage(named: "mac_early")
                blurView.frame = cameraView.bounds
                blurView.alpha = 0.5
                cameraView.addSubview(blurView)
                sliderControl.isHidden = true
            case "斯塔加特病":
                overlayView.image = UIImage(named: "mac_early")
                blurView.frame = cameraView.bounds
                blurView.alpha = 0.5
                cameraView.addSubview(blurView)
                sliderControl.isHidden = true
            case "视神经发育不全":
                blurView.frame = cameraView.bounds
                blurView.alpha = 0.5
                cameraView.addSubview(blurView)
                segmentedControl.isHidden = true
            case "巴德特·比德尔综合征":
                overlayView.image = UIImage(named: "glaucoma_early")
                sliderControl.isHidden = true
            default:
                print("None")
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AppUtility.lockOrientation(.portrait)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AppUtility.lockOrientation(.all)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            if let destination = segue.destination as? DetailsViewController {
                destination.currentDisease = currentDisease
            }
        }
    }
}
extension UIViewController {
    func hexStringToUIColor (hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        if (cString.characters.count) != 6 {
            return UIColor.gray
        }
        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
