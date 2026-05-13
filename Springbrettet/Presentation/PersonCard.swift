import SwiftUI

enum PersonCardMode {
    case compactHorizontal
    case compactVertical
    case detail
}

struct PersonCard: View {
    let person: Person
    let mode: PersonCardMode
    @Environment(\.openURL) var openURL

    var body: some View {
        switch mode {
        case .compactHorizontal:
            compactHorizontalBody
        case .compactVertical:
            compactVerticalBody
        case .detail:
            detailBody
        }
    }

    private var compactHorizontalBody: some View {
        VStack {
            person.image
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 140)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.kdOrange, lineWidth: 3)
                )
                .shadow(radius: 5)

            Text(person.name)
                .font(.headline)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)

            Text(person.role)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.7))
                .multilineTextAlignment(.center)
        }
        .frame(width: 160)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.black.opacity(0.2))
        )
    }

    private var compactVerticalBody: some View {
        VStack {
            person.image
                .resizable()
                .aspectRatio(contentMode: .fill)

            VStack {
                Text(person.name)
                    .font(.kdHeading(20))
                    .foregroundColor(.kdOrange)
                Text(person.role)
                    .font(.kdHeading(15))
                Link(person.email, destination: URL(string: "mailto:\(person.email)")!)
                    .font(.kdHeading(15))
            }
        }
    }

    private var detailBody: some View {
        VStack(spacing: 20) {
            person.image
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10)

            VStack(spacing: 10) {
                Text(person.name)
                    .font(.title2.bold())
                    .foregroundColor(.kdOrange)

                Text(person.role)
                    .font(.headline)
                    .foregroundColor(.white)

                if let studie = person.studie, !studie.isEmpty {
                    Text(studie)
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.7))
                        .multilineTextAlignment(.center)
                }

                if !person.email.isEmpty {
                    Button(action: {
                        if let url = URL(string: "mailto:\(person.email)") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Text(person.email)
                            .font(.body)
                            .foregroundColor(.blue)
                            .underline()
                    }
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.black.opacity(0.2))
            )

            if let linkedin = person.linkedin, !linkedin.isEmpty {
                Button(action: {
                    if let url = URL(string: linkedin) {
                        openURL(url)
                    }
                }) {
                    HStack {
                        Image("linkedin")
                        Text("LinkedIn")
                    }
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 1)
                    )
                }
            }
        }
        .padding()
    }
}
