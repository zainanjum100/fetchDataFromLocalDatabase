//
//  ViewController.swift
//  fetchDataFromLocalDatabase
//
//  Created by ZainAnjum on 15/12/2017.
//  Copyright © 2017 ZainAnjum. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var MyData : [Data]?
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "http://localhost/projects/service.php"
        fetchData(urlString: url)
        // Do any additional setup after loading the view, typically from a nib.
    }
    func fetchData(urlString: String) {
        
        let jsonUrlString = urlString
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do {
                let fetchedData = try JSONDecoder().decode([Data].self, from: data)
                
                //*********
                self.MyData = fetchedData
                //********
                
                DispatchQueue.main.async { // Correct
                        print(fetchedData)
                }
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
            
            }.resume()
    }

}

