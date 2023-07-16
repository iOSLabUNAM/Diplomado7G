import Foundation

struct Entry: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let category: String
    let commonLocations: [String]?
    let dlc: Bool
    let edible: Bool?
    let drops: [String]?
    let image: String
}

struct ApiResponse<T: Codable>: Codable {
    let data: [T]
}

struct Api {
    let baseUrl = "https://botw-compendium.herokuapp.com/"
    let session = URLSession.shared
    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    func entries(type: String = "all", complete: @escaping ([Entry]) -> Void ) {
        let url = URL(string: "\(baseUrl)api/v3/compendium/\(type)")!
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                debugPrint(error)
                return
            }
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                print("Unsuccessful response:")
                debugPrint(response)
                return
            }
            guard let data = data else {
                complete([])
                return
            }
            do {
                print("lets decode")
                let res = try self.decoder.decode(ApiResponse<Entry>.self, from: data)
                complete(res.data)
            } catch {
                print(error)
            }
        }.resume()
    }
}

let api = Api()
api.entries { entries in
    DispatchQueue.main.async {
        print(entries)
    }
}
