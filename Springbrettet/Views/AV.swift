import SwiftUI

// MARK: - Models
struct Consultation: Identifiable {
    let id = UUID()
    let date: Date
    let title: String
    let duration: String
    var isActive: Bool = false
}

struct MedicalNote: Identifiable {
    let id = UUID()
    var anamnese: String
    var funn: String
    var vurdering: String
    var tiltak: String
}

// MARK: - Main App
struct NotelessApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// MARK: - Main Content View
struct ContentView1: View {
    @State private var selectedTab = 0
    @State private var selectedConsultation: Consultation?
    @State private var consultations = [
        Consultation(date: Date(), title: "Lumbago", duration: "00:00", isActive: true),
        Consultation(date: Date().addingTimeInterval(-86400), title: "hypertyreose", duration: "00:00"),
        Consultation(date: Date().addingTimeInterval(-172800), title: "Pneumoni", duration: "00:00"),
        Consultation(date: Date().addingTimeInterval(-259200), title: "Nakkesmerter", duration: "00:00")
    ]
    
    @State private var currentNote = MedicalNote(
        anamnese: "45 år gammel mann, tidligere frisk, bruker ingen faste medisiner. Kommer grunnet smerter i nedre del av ryggen som har vart i to uker. Smertene oppsto plutselig etter å ha løftet et tungt objekt på jobb. Beskriver smerten som konstant NRS 6, forverres ved bevegelse og lindres noe ved hvile. Har prøvd Paracet uten betydelig effekt. Ingen nummenhet eller kraftsvikt i bena.",
        funn: """
        Inspeksjon: Ingen synlig hevelse eller rødhet i lumbalregionen
        Palpasjon: Ømhet over lumbal muskulatur
        Mobilitet: Redusert fleksjon og ekstensjon i lumbalcolumna
        Nevrologi: Normal kraft, sensibilitet og reflekser i underekstremitetene
        """,
        vurdering: "Lumbago, uten tegn til nevrologisk utfall.",
        tiltak: """
        - Informert om røde flagg
        - Anbefale hvile og unngå tunge løft
        - Forsøke NSAIDs ved behov for smertelindring
        - Kontrolltime om to uker for vurdering av effekt og videre plan
        """
    )
    
    var body: some View {
        NavigationSplitView {
            SidebarView(consultations: $consultations, selectedConsultation: $selectedConsultation)
        } detail: {
            MainContentView(selectedTab: $selectedTab, currentNote: currentNote)
        }
    }
}

// MARK: - Sidebar View
struct SidebarView: View {
    @Binding var consultations: [Consultation]
    @Binding var selectedConsultation: Consultation?
    @State private var showingSettings = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Image(systemName: "stethoscope")
                    .foregroundColor(.blue)
                Text("noteless")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            
            // Action Buttons
            HStack(spacing: 12) {
                Button(action: {}) {
                    HStack {
                        Image(systemName: "mic.fill")
                        Text("Ny konsultasjon")
                    }
                    .font(.system(size: 14))
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                }
                
                Button(action: {}) {
                    HStack {
                        Image(systemName: "waveform")
                        Text("Ny diktering")
                    }
                    .font(.system(size: 14))
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
            
            // Date sections
            VStack(alignment: .leading, spacing: 16) {
                DateSection(title: "I dag", consultations: todayConsultations)
                DateSection(title: "I går", consultations: yesterdayConsultations)
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Bottom menu
            VStack(spacing: 16) {
                Button(action: { showingSettings = true }) {
                    HStack {
                        Image(systemName: "gearshape")
                        Text("Innstillinger")
                        Spacer()
                    }
                    .foregroundColor(.primary)
                }
                
                Button(action: {}) {
                    HStack {
                        Image(systemName: "questionmark.circle")
                        Text("Hjelp")
                        Spacer()
                        Image(systemName: "arrow.up.forward.square")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .foregroundColor(.primary)
                }
                
                Button(action: {}) {
                    HStack {
                        Image(systemName: "arrow.right.square")
                        Text("Logg ut")
                        Spacer()
                    }
                    .foregroundColor(.primary)
                }
            }
            .padding()
            .font(.system(size: 14))
        }
        .frame(width: 280)
        .background(Color.gray.opacity(0.05))
    }
    
    var todayConsultations: [Consultation] {
        consultations.filter { Calendar.current.isDateInToday($0.date) }
    }
    
    var yesterdayConsultations: [Consultation] {
        consultations.filter { Calendar.current.isDateInYesterday($0.date) }
    }
}

// MARK: - Date Section Component
struct DateSection: View {
    let title: String
    let consultations: [Consultation]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
            
            ForEach(consultations) { consultation in
                ConsultationRow(consultation: consultation)
            }
        }
    }
}

// MARK: - Consultation Row
struct ConsultationRow: View {
    let consultation: Consultation
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(consultation.title)
                    .font(.system(size: 14))
                Text(consultation.duration)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            if consultation.isActive {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 6, height: 6)
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(consultation.isActive ? Color.blue.opacity(0.1) : Color.clear)
        .cornerRadius(8)
    }
}

// MARK: - Main Content View
struct MainContentView: View {
    @Binding var selectedTab: Int
    let currentNote: MedicalNote
    @State private var showingCopyAlert = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Text("10:20 / 04.10.2024")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                // Tab buttons
                HStack(spacing: 0) {
                    TabButton(title: "Notat", isSelected: selectedTab == 0) {
                        selectedTab = 0
                    }
                    TabButton(title: "Henvisning", isSelected: selectedTab == 1) {
                        selectedTab = 1
                    }
                    TabButton(title: "Transkripsjon", isSelected: selectedTab == 2) {
                        selectedTab = 2
                    }
                }
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
            }
            .padding()
            
            // Content
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    if selectedTab == 0 {
                        NoteView(note: currentNote)
                    } else if selectedTab == 1 {
                        Text("Henvisning innhold")
                            .foregroundColor(.secondary)
                            .padding()
                    } else {
                        Text("Transkripsjon innhold")
                            .foregroundColor(.secondary)
                            .padding()
                    }
                }
                .padding()
            }
            
            // Bottom actions
            HStack(spacing: 12) {
                Text("Noteless kan gjøre feil. Sjekk viktig informasjon.")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Button(action: { showingCopyAlert = true }) {
                    Label("Kopier alt", systemImage: "doc.on.doc")
                        .font(.system(size: 14))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: {}) {
                    Label("Gjenoppta konsultasjon", systemImage: "play.fill")
                        .font(.system(size: 14))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.gray.opacity(0.1))
                        .foregroundColor(.primary)
                        .cornerRadius(8)
                }
                
                Button(action: {}) {
                    Label("Regenerer notat", systemImage: "arrow.clockwise")
                        .font(.system(size: 14))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.gray.opacity(0.1))
                        .foregroundColor(.primary)
                        .cornerRadius(8)
                }
            }
            .padding()
            .background(Color.gray.opacity(0.05))
        }
        .alert("Kopiert", isPresented: $showingCopyAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Notatet er kopiert til utklippstavlen")
        }
    }
}

// MARK: - Tab Button
struct TabButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 14))
                .padding(.horizontal, 16)
                .padding(.vertical, 6)
                .background(isSelected ? Color.white : Color.clear)
                .foregroundColor(isSelected ? .primary : .secondary)
                .cornerRadius(6)
        }
    }
}

// MARK: - Note View
struct NoteView: View {
    let note: MedicalNote
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            NoteSection(title: "Lumbago", content: "")
            
            NoteSection(title: "Anamnese", content: note.anamnese)
            
            NoteSection(title: "Funn", content: note.funn)
            
            NoteSection(title: "Vurdering", content: note.vurdering)
            
            NoteSection(title: "Tiltak", content: note.tiltak)
        }
    }
}

// MARK: - Note Section
struct NoteSection: View {
    let title: String
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
            
            if !content.isEmpty {
                Text(content)
                    .font(.body)
                    .foregroundColor(.primary.opacity(0.8))
                    .lineSpacing(4)
            }
        }
    }
}

// MARK: - Preview
struct ContentView_Previews1: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
