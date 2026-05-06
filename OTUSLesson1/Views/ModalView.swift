//
//  UIKitMapView.swift
//  OTUSLesson1
//
//  Created by Dmitrii Pogonia on 06.05.2026.
//

import SwiftUI
import MapKit

struct ModalView: View {
    private let region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 55.751244, longitude: 37.618423),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    var body: some View {
        VStack{
            Image(systemName: "hare.fill")
            Text("Modal View")
                .padding()
            UIKitMapView(region: region)
                .frame(height: 300)
                .cornerRadius(12)
                .padding(.horizontal)
            
            Text("Пример карты из MapKit (UIKit)")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .font(Font.largeTitle.bold())
    }
}

struct UIKitMapView: UIViewRepresentable {
    let region: MKCoordinateRegion
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.setRegion(region, animated: false)
        let annotation = MKPointAnnotation()
        annotation.coordinate = region.center
        annotation.title = "Заяц сейчас тут, лови его!"
        mapView.addAnnotation(annotation)
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(region, animated: true)
    }
}
