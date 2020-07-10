import Foundation
class Disease {
    var diseaseTitle: String = ""
    var descriptionText: String = ""
    var areasAffectedText: String = ""
    var peopleText: String = ""
    var inheritedBool: Bool = false
    var sourcesText: String = ""
    var keyFactsText: String = ""
    init (title: String, description: String, areasAffected: String, people: String, inherited: Bool, sources: String, keyFacts: String) {
        diseaseTitle = title
        descriptionText = description
        areasAffectedText = areasAffected
        peopleText = people
        inheritedBool = inherited
        sourcesText = sources
        keyFactsText = keyFacts
    }
    var getDiseaseTitle: String {
        return diseaseTitle
    }
    var getKeyFacts: String {
        return keyFactsText
    }
    var getDescriptionText: String {
        return descriptionText
    }
    var getAreasAffectedText: String {
        return areasAffectedText
    }
    var getPeopleText: String {
    return peopleText
    }
    var getInheritedBool: Bool {
        return inheritedBool
    }
    var getSourcesText: String {
    return sourcesText
    }
}
