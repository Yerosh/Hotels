//
//  DetailsViewController.swift
//  hotels
//
//  Created by Yernur Adilbek on 11/15/24.
//

import UIKit
import MapKit

class DetailsViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var hotel = Hotel()

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: hotel.imageName)
        nameLabel.text = hotel.name
        addressLabel.text = hotel.address
        
        // ______________ Метка на карте ______________
        // Новые координаты для метки на карте
        let lat:CLLocationDegrees = hotel.lat
        let long:CLLocationDegrees = hotel.long
        
        // Создаем координта передавая долготу и широту
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
        
        // Создаем метку на карте
        let annotation = MKPointAnnotation()
        
        // Задаем коортинаты метке
        annotation.coordinate = location
        // Задаем название метке
        annotation.title = "Title"
        // Задаем описание метке
        annotation.subtitle = "subtitle"
        
        mapView.addAnnotation(annotation)
        
        // Дельта - насколько отдалиться от координат пользователя по долготе и широте
        let latDelta:CLLocationDegrees = 0.01
        let longDelta:CLLocationDegrees = 0.01

        // Создаем область шириной и высотой по дельте
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        
        // Создаем регион на карте с моими координатоми в центре
        let region = MKCoordinateRegion(center: location, span: span)
        
        // Приближаем карту с анимацией в данный регион
        mapView.setRegion(region, animated: true)
    }

    @IBAction func mapPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MapVC") as! MapViewController
        vc.destination = CLLocationCoordinate2DMake(hotel.lat, hotel.long)
        navigationController?.show(vc, sender: self)
    }
}
