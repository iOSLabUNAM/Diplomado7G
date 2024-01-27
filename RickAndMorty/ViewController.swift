

import UIKit

class ViewController: UIViewController {
    
    var actualPage: Int = 1
    
    let restClient = RESTClient<PaginaterResponse<Character>>(client: Client("https://rickandmortyapi.com"))
    
    var characters: [Character]? {
        didSet {
            tableView.reloadData()
        }
    }

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        restClient.show("/api/character/", page: "1") { response in
            self.characters = response.results
        }
    }
    

    @IBAction func nextPageButton(_ sender: Any) {
        actualPage += 1
        let page = String(actualPage)
        restClient.show("/api/character", page: page) { response in
            self.characters = response.results
        }

    }
    
    @IBAction func beforePageButton(_ sender: Any) {
        actualPage = max(actualPage - 1, 1)
        let page = String(actualPage)
        restClient.show("/api/character", page: page) { response in
            self.characters = response.results
        }

    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = characters?[indexPath.row].name
        cell.detailTextLabel?.text = characters?[indexPath.row].species
        return cell
    }
    
    
}

