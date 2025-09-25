import SwiftUI


/*Écran de connexion
● Permettre à l'utilisateur de se connecter en utilisant son e-mail et son mot de
passe.
Éléments UI
● Champs de texte pour :
○ E-mail
○ Mot de passe
● Bouton 'Sign in'
● Bouton 'Register' pour naviguer vers l'écran d'inscription
Actions
● Après avoir entré les informations et cliqué sur 'Sign in'
, l'application doit valider
les informations et connecter l'utilisateur.
● Le clic sur le bouton ‘Register’ doit rediriger l’utilisateur vers la vue de création de
compte*/


struct AuthenticationView: View {
    
    @StateObject private var viewModel = AuthenticationViewModel()
    
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 100) {
                Spacer(minLength: 40)
                
                // Title
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                
                // Conexion
                VStack(alignment: .leading, spacing: 12) {
                    Text("Email/Username")
                        .font(.headline)
                    TextField("Mail adress", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.primary, lineWidth: 0.5)
                        )
                    
                    Text("Password")
                        .font(.headline)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.primary, lineWidth: 0.5)
                        )
                    
                    Button(action: {
                        // logic
                    }) {
                        Text("Forgot password?")
                            .font(.footnote)
                            .foregroundColor(.blue)
                    }
                    .padding(.top, 4)
                    
                    if let error = viewModel.loginErrorMessage {
                        Text("Connexion Failed")
                            .foregroundColor(.red)
                            .font(.footnote)
                    }
                }
                .padding(.horizontal, 8)
                
                // Actions
                VStack(spacing: 16) {
                    
                    // Définir la destination dans l'app directement ?
                    NavigationLink(destination: CandidatsView()) {
                        Text("Sign in")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 80)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.primary, lineWidth: 1)
                            )
                    }
                    .padding(.bottom, 5)
                    
                    // Définir la destination dans l'app directement ?
                    NavigationLink(destination: RegisterViews()) {
                        Text("Register")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 71)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.primary, lineWidth: 1)
                            )
                    }
                }
                .padding(.horizontal, 8)
                
                Spacer(minLength: 40)
            }
            .padding(.horizontal, 40)
        }
    }
}
    
    
    /*.onTapGesture {
     self.endEditing(true)  // Dismiss keyboard when tapping outside
     }*/
    
   
    #Preview {
        AuthenticationView()
    }


struct RegisterViews: View {
    var body: some View {
        Text("Temporaire RegisterView")
    }
}


struct CandidatsView: View {
    var body: some View {
        Text("Temporaire CandidatsView")
    }
}
