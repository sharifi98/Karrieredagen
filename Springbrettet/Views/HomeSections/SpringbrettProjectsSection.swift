import SwiftUI

struct SpringbrettProjectsSection: View {
    var body: some View {
        Section {
            Text("Springbrettets prosjekter")
                .foregroundColor(.white)
                .font(.headline)
                .listRowBackground(.kdOrange)

            NavigationLink(destination: SpringbrettfondetView()) {
                Label {
                    Text("Springbrettfondet")
                } icon: {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                        .foregroundColor(.green)
                }
            }

            NavigationLink(destination: DiTView()) {
                Label {
                    Text("Damer i toppen")
                } icon: {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }

            NavigationLink(destination: Karrierestudio()) {
                Label {
                    Text("Karrierestudio")
                } icon: {
                    Image(systemName: "music.mic")
                        .foregroundColor(.purple)
                }
            }

            NavigationLink(destination: SalmonCityView()) {
                Label {
                    Text("Salmon City")
                } icon: {
                    Image(systemName: "fish")
                        .foregroundColor(.blue)
                }
            }
        }
    }
}
