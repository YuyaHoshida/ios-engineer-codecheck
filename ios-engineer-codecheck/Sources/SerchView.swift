import SwiftUI
import ComposableArchitecture

struct SerchView: View {
    let store: StoreOf<SerchCore>

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            NavigationStack {
                VStack {
                    TextField("", text: viewStore.binding(get: \.serchKeywords, send: SerchCore.Action.inputSerchKeywords))
                        .overlay(RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.black, lineWidth: 1))
                        .padding(.horizontal, 10)
                    Spacer()
                }
                .navigationTitle("Root View Controller")
                .navigationBarTitleDisplayMode(.inline)
            }

        }
    }
}

struct SerchView_Previews: PreviewProvider {
    static var previews: some View {
        SerchView(store: Store(initialState: SerchCore.State(), reducer: SerchCore()))
    }
}
