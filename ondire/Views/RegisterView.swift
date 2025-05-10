import SwiftUI

struct RegisterView: View {
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var acceptedTerms = true
    @State private var goToHome = false
    @State private var goToLogin = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Crear una cuenta")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("PrimaryText"))
                    .padding(.top)
                
                socialButton(label: "Continuar con Apple", icon: "applelogo")
                socialButton(label: "Continuar con Google", icon: "globe")
                
                
                Divider().overlay(Text("o").foregroundColor(.gray))

                formField(title: "Nombre completo", text: $fullName)
                formField(title: "Correo electrónico", text: $email, keyboard: .emailAddress)
                formField(title: "Contraseña", text: $password, isSecure: true)

                Toggle(isOn: $acceptedTerms) {
                    Text("Acepto los términos y condiciones")
                        .font(.footnote)
                        .foregroundColor(Color("SecondaryText"))
                }

                Button(action: {
                    goToHome = true
                }) {
                    Text("Crear cuenta")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("OndirePrimaryColor"))
                        .cornerRadius(10)
                }
                .navigationDestination(isPresented: $goToHome) {
                    HomeView()
                }

                Button("¿Ya tienes cuenta? Iniciar sesión") {
                    goToLogin=true;
                }
                .font(.footnote)
                .foregroundColor(Color("SecondaryText"))
                .padding(.top, 10)
                .navigationDestination(isPresented: $goToLogin) {
                    LoginView()
                }
            }
            .padding()
        }
        .background(Color("BackgroundColor").ignoresSafeArea())
    }

    @ViewBuilder
    func socialButton(label: String, icon: String) -> some View {
        Button(action: {
            // Acción para social login
        }) {
            HStack {
                Image(systemName: icon)
                Text(label)
                    .fontWeight(.medium)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white)
            .foregroundColor(Color("PrimaryText"))
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        }
    }

    @ViewBuilder
    func formField(title: String, text: Binding<String>, keyboard: UIKeyboardType = .default, isSecure: Bool = false) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(Color("PrimaryText"))
            if isSecure {
                SecureField(title, text: text)
                    .textContentType(.password)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(8)
            } else {
                TextField(title, text: text)
                    .keyboardType(keyboard)
                    .autocapitalization(.none)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(8)
            }
        }
    }
}

#Preview {
    RegisterView()
}
