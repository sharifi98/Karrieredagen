import SwiftUI

struct CareerDaySection: View {
    var body: some View {
        Section {
            Text("Karrieredagen")
                .foregroundColor(.white)
                .font(.headline)
                .listRowBackground(.kdOrange)

            NavigationLink(destination: SponsorView()) {
                Label {
                    Text("Karrieredagens sponsorer")
                } icon: {
                    Image(systemName: "trophy.fill")
                        .foregroundStyle(.kdOrange)
                }
            }

            NavigationLink(destination: CompanyList()) {
                Label {
                    Text("Se bedriftene")
                } icon: {
                    Image(systemName: "suitcase.fill")
                        .foregroundColor(.kdOrange)
                }
            }

            NavigationLink(destination: ScheduleList()) {
                Label {
                    Text("Timeplan")
                } icon: {
                    Image(systemName: "calendar")
                        .foregroundColor(.kdOrange)
                }
            }

            NavigationLink(destination: GrieghallenView()) {
                Label {
                    Text("Kart")
                } icon: {
                    Image(systemName: "map")
                        .foregroundColor(.kdOrange)
                }
            }

            NavigationLink(destination: CVTipsView()) {
                Label {
                    Text("Tips til jobbsøknad")
                } icon: {
                    Image(systemName: "pencil")
                        .foregroundColor(.kdOrange)
                }
            }
        }
    }
}
