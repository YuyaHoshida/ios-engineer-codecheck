import Foundation
import ComposableArchitecture
import Combine

struct SerchCore: ReducerProtocol {
    struct State: Equatable {
        var serchKeywords: String = ""
        var repositories: [Repository] = []
        var page = 1
        var isFetching = false
        var subscription = Set<AnyCancellable>()
        var alertState: AlertState<Action>?
        var errorMessage = ""
    }

    enum Action: Equatable {
        case inputSerchKeywords(String)
        case showAlert
        case alertDismissed
        case fetchRepositories
    }

    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .inputSerchKeywords(let keyWords):
                state.serchKeywords = keyWords
                return .none
            case .showAlert:
                state.alertState = AlertState(title: TextState("Error"), message: TextState(state.errorMessage), dismissButton: .default(TextState("close")))
                return .none
            case .alertDismissed:
                state.alertState = nil
                return .none
            case .fetchRepositories:
                guard !state.isFetching else { return .none }
                state.isFetching = true
                // TODO: APIを叩いた処理を行う
                return .none
            }
        }
    }
}
