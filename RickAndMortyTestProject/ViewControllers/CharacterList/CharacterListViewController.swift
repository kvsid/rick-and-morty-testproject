//
//  CharacterListController.swift
//  RickAndMortyTestProject
//
//  Created by Xenia Sidorova on 04.04.2021.
//

import UIKit

class CharacterListViewController: UIViewController, UITableViewDataSource {
    
    var characters = [Result]()
    var azFilterIsPressed = false
    var networkService = NetwokService()

    @IBOutlet weak var characterListTableView: UITableView!
    @IBOutlet weak var azFilter: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters' list"
        characterListTableView.delegate = self
        characterListTableView.dataSource = self
        characterListTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "Cell")
        loadCharacters()
    }

    @IBAction func azFilterPressed(_ sender: Any) {
        azFilterIsPressed = !azFilterIsPressed
        if azFilterIsPressed {
            characters.sort(by: { $0.name < $1.name })
            self.characterListTableView.reloadData()
            azFilter.setTitle("by ID", for: .normal)
        } else {
            characters.sort(by: { $0.id < $1.id })
            self.characterListTableView.reloadData()
            azFilter.setTitle("A-Z", for: .normal)
        }
    }

    func loadCharacters() {
        networkService.charactersRequest { (results) in
            DispatchQueue.main.async {
                self.characters = results
                self.characterListTableView.reloadData()
            }
        }
    }

    deinit { debugPrint("\(type(of: self)) - deinited") }

}

extension CharacterListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomCell {
            cell.configure(with: characters[indexPath.row])
            cell.cellView.backgroundColor = UIColor(red: 45/255.0, green: 179/255.0, blue: 214/255.0, alpha: 1)
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomCell {
            cell.setSelected(true, animated: true)
        }
        let storyBoard : UIStoryboard = UIStoryboard(name: "CharacterDetailsViewController", bundle:nil)
            let detailsViewController = storyBoard.instantiateViewController(withIdentifier: "CharacterDetails") as! CharacterDetailsViewController
        detailsViewController.characterId = characters[indexPath.row].id
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }

}
