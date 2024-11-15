//
//  TableViewController.swift
//  hotels
//
//  Created by Yernur Adilbek on 11/15/24.
//

import UIKit

class TableViewController: UITableViewController {
    
    var arrayHotels = [Hotel(name: "Residence Inn by Marriott San Jose Cupertino", address: "19429 Stevens Creek Blvd, Cupertino, CA 95014", imageName: "residenceINN", lat: 37.3242043, long: -122.0099213),
                       Hotel(name: "Hyatt House San Jose / Cupertino", address: "10380 Perimeter Rd, Cupertino, CA 95014", imageName: "hyatt", lat: 37.3292693, long: -122.0134101),
                       Hotel(name: "Wild Palms Hotel - JDV by Hyatt", address: "910 E Fremont Ave, Sunnyvale, CA 94087", imageName: "wildPalms", lat: 37.3512888, long: -122.0134309)]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayHotels.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let imageView = cell.viewWithTag(10) as! UIImageView
        imageView.image = UIImage(named: arrayHotels[indexPath.row].imageName)
        
        let label = cell.viewWithTag(11) as! UILabel
        label.text = arrayHotels[indexPath.row].name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsViewController
        vc.hotel = arrayHotels[indexPath.row]
        navigationController?.show(vc, sender: self)
    }
    

}
