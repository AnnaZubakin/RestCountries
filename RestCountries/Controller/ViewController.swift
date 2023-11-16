//
//  ViewController.swift
//  RestCountries
//
//  Created by anna.zubakina on 15/11/2023.
//

import UIKit

class ViewController: UITableViewController {
    
    private let cellID = "cell"
    private let countryAllUrl = "https://restcountries.com/v3.1/all"
    private var countries: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupView()
        
        NetworkManager.fetchData(url: countryAllUrl){
            countries in
            self.countries = countries
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func setupView(){
        view.backgroundColor = .secondarySystemBackground
        tableView.register(UITableViewCell.self,forCellReuseIdentifier: cellID)
        setupNavigationBar()
        
    }
    
    private func setupNavigationBar(){
        
        self.title = "Countries"
        let titleImage = UIImage(systemName: "mappin.and.ellipse")
        let imageView = UIImageView(image:titleImage)
        self.navigationItem.titleView = imageView
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor:UIColor.label]
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:UIColor.label]
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.tintColor = .label
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID, for:indexPath  as IndexPath)
        cell = UITableViewCell(style:UITableViewCell.CellStyle.subtitle,reuseIdentifier: cellID)
        
        let country = self.countries[indexPath.row]
        cell.textLabel?.text = country.name.common
        cell.detailTextLabel?.text = country.name.official
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        cell.addGestureRecognizer(longPressRecognizer)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showCountryDetailsAlert(country: countries[indexPath.row])
    }
    
    private func showCountryDetailsAlert(country: Country) {
        let alertController = UIAlertController(title: "Country Details", message: nil, preferredStyle: .alert)
        
        let countryName = country.name.common
        let region = country.region
        let subregion = country.subregion 
        let flag = country.flag
            
        var areaString = String(country.area)
        var populationString = String(country.population)
            

        alertController.message = "Country: \(countryName)\n\(flag)\nRegion: \(region)\nSubregion: \(subregion ?? "")\nArea: \(areaString)\nPopulation: \(populationString)"


  
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)

        present(alertController, animated: true, completion: nil)
    }

    
    @objc private func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            if let indexPath = tableView.indexPathForRow(at: gestureRecognizer.location(in: tableView)) {
                let selectedCountry = countries[indexPath.row]
                showCountryDetailsAlert(country: selectedCountry)
            }
        }
    }

    
}
