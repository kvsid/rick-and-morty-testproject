//
//  CharacterDetailsViewController.swift
//  RickAndMortyTestProject
//
//  Created by Xenia Sidorova on 04.04.2021.
//

import UIKit

class CharacterDetailsViewController: UIViewController, UITableViewDataSource {

    var infoRows : Details? = nil
    var characterId : Int?
    private var fieldsToDisplay : [[String: Any]]? {
        get {
            guard let model = infoRows else { return nil }

            return model.fieldsToDisplay()
        }
    }
    var networkService = NetwokService()

    @IBOutlet weak var characterDetailsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Character's information"
        characterDetailsTableView.delegate = self
        characterDetailsTableView.dataSource = self
        characterDetailsTableView.register(UINib(nibName: "DetailsCell", bundle: nil), forCellReuseIdentifier: "DetailsCell")
        loadDetails()
    }

    func loadDetails() {
        if let id = characterId {
            networkService.characterByIdRequest(id: id) { (results) in
                DispatchQueue.main.async {
                    self.infoRows = results
                    self.characterDetailsTableView.reloadData()
                }
            }
        }
    }

    deinit { debugPrint("\(type(of: self)) - deinited") }

}

extension CharacterDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let fields = fieldsToDisplay else { return 0 }

        return fields.count
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsCell", for: indexPath) as? DetailsCell {

            if let fields = fieldsToDisplay {
                cell.configure(fields[indexPath.row])
                return cell
            }

        }
        return UITableViewCell()
    }
    
}
