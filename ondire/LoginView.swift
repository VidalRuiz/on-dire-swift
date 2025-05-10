//
//  LoginView.swift
//  ondire
//
//  Created by ruizvi | VIDAL RUIZ VARGAS on 09/05/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var goToHome = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Iniciar sesión")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("PrimaryText"))
                .padding(.top)

            formField(title: "Correo electrónico", text: $email, keyboard: .emailAddress)
            formField(title: "Contraseña", text: $password, isSecure: true)

            Button("¿Olvidaste tu contraseña?") {
                // Acción para recuperación de contraseña
            }
            .font(.footnote)
            .foregroundColor(Color("SecondaryText"))
            .frame(maxWidth: .infinity, alignment: .trailing)

            Button(action: {
                goToHome = true
            }) {
                Text("Iniciar sesión")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("PrimaryColor"))
                    .cornerRadius(10)
            }
            .navigationDestination(isPresented: $goToHome) {
                HomeView()
            }

            Divider().overlay(Text("o").foregroundColor(.gray))

            socialButton(label: "Continuar con Google", icon: "globe")
            socialButton(label: "Continuar con Apple", icon: "applelogo")

            Button("¿No tienes cuenta? Crear una") {
                // Acción para ir a RegisterView
            }
            .font(.footnote)
            .foregroundColor(Color("SecondaryText"))
            .padding(.top, 10)

            Spacer()
        }
        .padding()
        .background(Color("BackgroundColor").ignoresSafeArea())
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

    @ViewBuilder
    func socialButton(label: String, icon: String) -> some View {
        Button(action: {
            // Acción para login social
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
}

#Preview {
    LoginView()
}
