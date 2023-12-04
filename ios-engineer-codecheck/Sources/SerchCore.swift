import Foundation
import ComposableArchitecture

struct SerchCore: ReducerProtocol {
    struct State: Equatable {
        var serchKeywords: String = ""
    }

    enum Action: Equatable {
        case inputSerchKeywords(String)
    }

    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .inputSerchKeywords(let keyWords):
                state.serchKeywords = keyWords
                return .none
            }
        }
    }
}
