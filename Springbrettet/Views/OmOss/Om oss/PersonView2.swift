import SwiftUI

struct PersonView2: View {
    let leder: Person

    var body: some View {
        List {
            PersonCard(person: leder, mode: .compactVertical)
        }
    }
}

struct PersonView2_Previews: PreviewProvider {
    static var previews: some View {
        PersonView2(leder: ContentStore().leaders[4])
    }
}
