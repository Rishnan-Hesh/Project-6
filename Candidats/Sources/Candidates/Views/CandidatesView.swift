import SwiftUI

struct Candidate: Identifiable {
    let id = UUID()
    let name: String
    var isFavorite: Bool
}

struct CandidatesView: View {
    @State private var searchText: String = ""
    @State private var candidates: [Candidate] = [
        Candidate(name: "Jean Pierre P.", isFavorite: true),
        Candidate(name: "Jean Michel P.", isFavorite: false),
        Candidate(name: "Jean Pierre A.", isFavorite: true),
        Candidate(name: "Jean Michel Z.", isFavorite: false),
        Candidate(name: "Jean Pierre B.", isFavorite: true),
        Candidate(name: "Jean Michel M.", isFavorite: false)
    ]
    
    var filteredCandidates: [Candidate] {
        if searchText.isEmpty {
            return candidates
        } else {
            return candidates.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            /*    `$0` représente un élément dans une collection, ici un `Candidate` dans un filtre.
             •    `name` est la propriété string du candidat.
             •    `lowercased()` transforme cette chaîne en minuscules, pour rendre la recherche insensible à la casse.
             •    `contains()` est une méthode Swift qui vérifie si une chaîne (“name” en minuscules) contient une autre chaîne (ici `searchText` en minuscules).
             •    Elle renvoie un booléen vrai si `searchText` est une sous-chaîne de `name`.
         En résumé, cela vérifie si le nom du candidat contient le texte cherché, sans tenir compte des majuscules/minuscules, pour filtrer la liste des candidats selon la recherche utilisateur .*/
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button("Edit") { /* action ici */ }
                    Spacer()
                    Text("Candidates")
                        .font(.headline)
                    Spacer()
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                }
                .padding(.horizontal)
                .frame(height: 44)
                
                TextField("Search", text: $searchText)
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                List(filteredCandidates) { candidate in
                    HStack {
                        Text(candidate.name)
                        Spacer()
                        Image(systemName: candidate.isFavorite ? "star.fill" : "star")
                            .foregroundColor(.yellow)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    CandidatesView()
}
