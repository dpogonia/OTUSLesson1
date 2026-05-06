//
//  ContentView.swift
//  OTUSLesson1
//
//  Created by Dmitrii Pogonia on 05.05.2026.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var selectedTab: Int = 1
    @State private var openRandom: Bool = false
    
    var body: some View {
        // 1. Добавить TabView.
        TabView(selection: $selectedTab) {
            FirstTab(selectedTab: $selectedTab, openRandom: $openRandom)
                .tabItem {
                    Label("First Tab", systemImage: "1.circle.fill")
                }
                .tag(1)
            SecondTab(selectedTab: $selectedTab, openRandom: $openRandom)
                .tabItem {
                    Label("Second Tab", systemImage: "2.circle.fill")
                }
                .tag(2)
            ThirdTab()
                .tabItem {
                    Label("Third Tab", systemImage: "3.circle.fill")
                }
                .tag(3)
        }
    }
}

struct FirstTab: View {
    @Binding var selectedTab: Int
    @Binding var openRandom: Bool
    
    var body: some View {
        // 4. На первом табе разместить кнопку, открывающую второй таб и один из пунктов в нем.
        Button("Open Second Tab Random View") {
            selectedTab = 2
            openRandom = true
        }
        .primaryButton()
    }
}

struct SecondTab: View {
    @Binding var selectedTab: Int
    @Binding var openRandom: Bool
    @State private var selectedAnimal: String?
    
    private let animals = ["dog", "cat", "hare", "tortoise", "ladybug"]
    
    var body: some View {
        NavigationStack {
            // 2. На втором табе создать List, обернутый в NavigationView.
            // Из списка должны быть переходы с использованием NavigationLink.
            List {
                ForEach(animals, id: \.self) { animal in
                    NavigationLink("Show \(animal.capitalized)") {
                        AnimalView(animal: animal)
                    }
                }
            }
            .navigationTitle("Animals")
            .navigationDestination(item: $selectedAnimal) { animal in
                AnimalView(animal: animal)
            }
        }
        .onAppear {
                    if openRandom {
                        selectedAnimal = animals.randomElement()
                        openRandom = false
                    }
                }
        .onChange(of: openRandom) { _, newValue in
            if newValue {
                selectedAnimal = animals.randomElement()
                openRandom = false
            }
        }
    }
}


struct ThirdTab: View {
    
    @State private var showModal: Bool = false
    
    var body: some View {
        // 3.  На третьем табе разместить кнопку, открывающую модальное окно.
        Button("To modal view", action: {
            showModal = true
        })
        .primaryButton()
        .sheet(isPresented: $showModal) {
            ModalView()
        }
    }
}

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
            // Карта от UIKit (через UIViewRepresentable)
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

struct AnimalView: View {
    let animal: String
    
    var body: some View {
        Image(systemName: animal)
            .font(.system(size: 100))
            .foregroundStyle(Color.orange)
    }
}

struct PrimaryButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(.blue)
    }
}

extension View {
    func primaryButton() -> some View {
        self.modifier(PrimaryButtonModifier())
    }
}

//*6. Добавить один компонент UIKit через UlViewRepresentable.

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


//5. Протестировать приложение на симуляторах iPad/iPhone с проверкой смены ориентации устройства.
    // Проверил, работает
#Preview {
    ContentView()
}
