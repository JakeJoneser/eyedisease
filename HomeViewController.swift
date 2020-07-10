import UIKit
class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    var diseaseTitle = ""
    var currentDisease: Disease?
    var diseaseArray = [Disease]()
    var indicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        diseaseArraySetup()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        indicator.center = view.center
    }
    func diseaseArraySetup() {
        diseaseArray.append(Disease(title: "巴德特·比德尔综合征",description: "巴德特·比德尔综合征是一种复杂的疾病,会影响包括视网膜在内的身体许多部位. 患有这种综合征的人的视网膜变性类似于色素性视网膜炎（RP）.",areasAffected: "视网膜",people: "140,000至160,000新生儿中有1名. 纽芬兰17,000名新生儿中有1名.",inherited: true,sources: "blindness.org, nih.org",keyFacts: "\u{2022} 缺乏周边视力"))
        diseaseArray.append(Disease(title: "白内障",description:"白内障是指眼内晶状体混浊,影响视力. 大多数白内障与衰老有关, 白内障在老年人中很常见. 到80岁时,超过一半的美国人患有白内障或进行过白内障手术.",areasAffected:"晶状体",people: "大于1千万人",inherited:false,sources: "NEI",keyFacts:"\u{2022} 视力模糊 \n\u{2022} 它对老年人的影响更大"))
        diseaseArray.append(Disease(title: "角膜营养不良", description: "角膜营养不良以不同方式影响视力.有些会导致严重的视力障碍,而另一些则不会导致视力问题,只能在常规的眼科检查中发现. 其他营养不良可能会引起反复发作的疼痛,而不会导致永久性视力丧失. 一些最常见的角膜营养不良包括圆锥角膜,Fuchs营养不良,晶格营养不良和地图-点inger-指纹营养不良.", areasAffected: "角膜", people: "8百万人",inherited: true, sources: "nih.gov, NEI", keyFacts: "\u{2022} 视力模糊"))
        diseaseArray.append(Disease(title: "糖尿病性视网膜病变", description: "在某些患有糖尿病性视网膜病的人中,血管可能会肿胀并渗出液体. 在其他人中,异常的新血管在视网膜表面生长.视网膜是眼睛后部的感光组织. 健康的视网膜对于良好的视力必不可少.", areasAffected: "视网膜", people: "约有800万人受影响",inherited: true, sources: "NEI", keyFacts: "\u{2022} 无法看到他们的视野随机部分 \n\u{2022} 影响糖尿病患者"))
        diseaseArray.append(Disease(title: "青光眼", description: "青光眼是一组损害眼睛的视神经并可能导致视力丧失和失明的疾病。（管视角）", areasAffected: "视神经", people: "每年超过1百万人患病",inherited: false, sources: "NEI", keyFacts: "\u{2022} 缺乏周边视力"))
        diseaseArray.append(Disease(title: "莱伯先天性阿玛特病", description: "莱伯先天性阿玛特病（LCA）是一种遗传性视网膜变性疾病,其特征是出生时视力严重丧失. 该疾病还伴有多种其他与眼有关的异常,包括眼动不畅,眼睛深陷和对强光敏感. 一些LCA患者也经历中枢神经系统异常.", areasAffected: "视网膜", people: "每10万新生儿中2至3",inherited: true, sources: "Blindness.org, Nih.gov", keyFacts: "\u{2022} 视力模糊"))
         diseaseArray.append(Disease(title: "莱伯遗传性视神经病变（LHON）", description: "莱伯遗传性视神经病变（LHON）是一种以视力丧失为特征的疾病. 视力丧失通常是LHON的唯一症状.据报道,一些具有其他体征和症状的家庭患有“ LHON plus”,包括视力丧失,震颤和控制心跳的电信号异常（心脏传导缺陷）. 一些受影响的个体发展出与多发性硬化症相似的特征. 治疗是支持性的,可能包括视觉辅助.", areasAffected: "视神经", people: "每100,000人中有3.22人",inherited: true, sources: "Nih.gov", keyFacts: "\u{2022} 失去中央视力"))
        diseaseArray.append(Disease(title: "黄斑变性", description: "与年龄有关的黄斑变性（AMD）是一种疾病,会模糊您进行“直截了当”的活动（例如阅读，缝纫和驾驶）所需的清晰的中央视力. AMD会影响黄斑,这是使您看到精细细节的眼睛部分.AMD不会造成痛苦.", areasAffected: "黄斑视网膜", people: "大于1千万人", inherited: false, sources: "NEI, Apollo Hospital", keyFacts: "\u{2022} 失去中央视力 \n\u{2022} 最常见的视力疾病之一"))
        diseaseArray.append(Disease(title: "视神经脊髓炎（Devic's Disease）", description: "Devic病又称为视神经脊髓炎,其特征是视神经炎（视神经发炎）和横贯性脊髓炎（脊髓发炎）. 这种病很少见,类似于多发性硬化症.", areasAffected: "视神经,脊柱", people: "每100,000人中有0.52至4.4人",inherited: false, sources: "NEI, nih.gov/, fundaciongaem.org", keyFacts: "\u{2022} 失去中央视力"))
        diseaseArray.append(Disease(title: "视神经发育不全", description: "视神经发育不全（ONH）是一种出生时出现的疾病,其特征为视神经发育不全或缺失（在眼睛和大脑之间传递信息的神经束）. 视神经发育不全的影响范围很广,取决于从眼睛到大脑的视觉信息是否充分,从很少或没有视觉障碍到几乎完全失明. 该病可能会影响一只或两只眼睛.", areasAffected: "视神经", people: "每100,000人中有10.9人",inherited: true, sources: "AFB, nih.gov", keyFacts: "\u{2022} 视力模糊"))
        diseaseArray.append(Disease(title: "视神经炎（神经病）", description: "视神经炎是视神经的炎症,可由感染和免疫相关疾病引起. 在许多情况下,医生无法确定神经炎的原因.", areasAffected: "视神经.", people: "15-20％的多发性硬化症患者",inherited: true, sources: "NEI", keyFacts: "\u{2022} 视力模糊"))
        diseaseArray.append(Disease(title: "视网膜脱离", description: "视网膜是组织在眼内的感光层,并通过视神经向大脑发送视觉信息. 视网膜脱离时,将其从正常位置提起或拉出. 如果不及时治疗,视网膜脱离会导致永久性视力丧失.", areasAffected: "视神经", people: "每年<100万例",inherited: false, sources: "NEI", keyFacts: "\u{2022} 视力丧失 \n\u{2022} 黑点可能会散布在他们的视线中"))
        diseaseArray.append(Disease(title: "色素性视网膜炎（RP）", description: "色素性视网膜炎是一组罕见的遗传性疾病,涉及视网膜细胞的破裂和丢失. 常见症状包括夜间看不清楚和侧视（周围）丧失.",areasAffected: "视网膜（感光细胞）", people: "> 100万人",inherited:true, sources: "http://healthresearchfunding.org/, NEI", keyFacts: "\u{2022} 缺乏周边视力"))
        diseaseArray.append(Disease(title: "斯塔加特病", description: "Stargardt病是遗传性青少年黄斑变性的最常见形式. 与Stargardt病相关的进行性视力丧失是由视网膜中央部分称为黄斑的感光细胞死亡引起的.", areasAffected: "黄斑", people: "每8千至1万人中有一个",inherited: true, sources: "NEI, Blindness.org", keyFacts: "\u{2022} 缺乏中央视野 \n\u{2022} 少年黄斑变性"))
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "disease") as? TableViewCell {
            cell.label.text = diseaseArray[indexPath.row].getDiseaseTitle
            cell.disease = diseaseArray[indexPath.row]
            cell.detail.text = diseaseArray[indexPath.row].getKeyFacts
            return cell
        }
        return UITableViewCell()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diseaseArray.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indicator.startAnimating()
        view.addSubview(indicator)
        let cell = tableView.cellForRow(at: indexPath) as? TableViewCell
        diseaseTitle = (cell?.label.text)!
        tableView.deselectRow(at: indexPath, animated: true)
        currentDisease = cell?.disease
        indicator.stopAnimating()
        self.performSegue(withIdentifier: "cameraView", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cameraView" {
            if let destination = segue.destination as? CameraViewController {
                destination.diseaseTitle = (currentDisease?.getDiseaseTitle)!
                destination.currentDisease = currentDisease
            }
        }
    }
}
