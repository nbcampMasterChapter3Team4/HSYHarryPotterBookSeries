import Foundation

class SummaryStateModel {
    private let key = "summaryExpanded"

    var isExpanded: Bool {
        get {
            return UserDefaults.standard.bool(forKey: key)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}
