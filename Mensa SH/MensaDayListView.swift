import SwiftUI

struct MensaDayListView: View {
    @State var mensaDays: [MensaDay] = []
    
    @AppStorage(wrappedValue: .Lübeck, MensaSettings.city) private var city: City

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 12) {
                ForEach(mensaDays, id: \.date) { day in
                    Section(header: Text(day.date)) {
                        MealListView(meals: day.meals)
                    }
                }
            }
            .padding(20)
        }
        .task(id: city) {
            mensaDays = []
            requestMensaDays(
                locations: city.locations,
                date: Date.now,
                lang: Language.German,
                completion: { apiResponse in
                    self.mensaDays = apiResponse.toMensaDays()
                }
            )
        }
    }
}
