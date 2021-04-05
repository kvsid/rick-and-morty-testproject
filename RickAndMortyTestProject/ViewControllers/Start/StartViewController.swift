//
//  StartViewController.swift
//  RickAndMortyTestProject
//
//  Created by Xenia Sidorova on 04.04.2021.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func startButtonPressed(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "CharacterListViewController", bundle:nil)
            let characterListViewController = storyBoard.instantiateViewController(withIdentifier: "CharacterList") as! CharacterListViewController
        self.navigationController?.pushViewController(characterListViewController, animated: true)
    }

}
