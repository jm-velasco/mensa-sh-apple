enum City: String, Codable, CaseIterable {
    case Flensburg = "Flensburg"
    case Heide = "Heide"
    case Kiel = "Kiel"
    case Lübeck = "Lübeck"
    case Osterrönfeld = "Osterrönfeld"
    case Wedel = "Wedel"
}

extension City: Identifiable {
    var id: String {
        self.rawValue
    }
}

extension City {
    var locations: [MensaLocation] {
        let entries: [(Location, String)]
        switch self {
        case .Flensburg:
            entries = [
                (.MensaFlensburg, "Mensa"),
                (.CafeteriaAFlensburg, "Cafeteria A"),
                (.CafeteriaBFlensburg, "Cafeteria B"),
            ]
        case .Heide:
            entries = [(.MensaHeide, "Mensa")]
        case .Kiel:
            entries = [
                (.Mensa1Kiel, "Mensa I"),
                (.Cafeteria1Kiel, "Cafeteria I"),
                (.Mensa2Kiel, "Mensa II"),
                (.Cafeteria2Kiel, "Cafeteria II"),
                (.KesselhausKiel, "Kesselhaus"),
                (.SchwentineMensaKiel, "Schwentine Mensa"),
                (.AmericanDinerKiel, "American Diner"),
                (.MensaDocksideKiel, "Mensa Dockside"),
            ]
        case .Lübeck:
            entries = [
                (.MensaLuebeck, "Mensa"),
                (.CafeteriaLuebeck, "Cafeteria"),
                (.BitsAndBytes, "Bits + Bytes"),
            ]
        case .Osterrönfeld:
            entries = [(.MensaOsterroenfeld, "Mensa")]
        case .Wedel:
            entries = [(.CafeteriaWedel, "Cafeteria")]
        }
        return entries.map { location, name in
            MensaLocation(code: location.rawValue, name: name, city: rawValue)
        }
    }
}
