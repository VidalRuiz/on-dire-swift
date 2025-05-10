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
            Text(AppStrings.loginTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(AppColors.primaryText)
                .padding(.top)

            formField(title: AppStrings.emailField, text: $email, keyboard: .emailAddress)
            formField(title: AppStrings.passwordField, text: $password, isSecure: true)

            Button(AppStrings.forgotPassword) {
                // Acción para recuperación de contraseña
            }
            .font(.footnote)
            .foregroundColor(AppColors.secondaryText)
            .frame(maxWidth: .infinity, alignment: .trailing)

            PrimaryButton(title: AppStrings.loginAction) {
                goToHome = true
            }
            .navigationDestination(isPresented: $goToHome) {
                HomeView()
            }

            Divider().overlay(Text(AppStrings.loginOr).foregroundColor(AppColors.secondaryText))

            socialButton(label: AppStrings.loginWithGoogle, icon: "globe")
            socialButton(label: AppStrings.loginWithApple, icon: "applelogo")

            Button(AppStrings.noAccount) {
                // Acción para ir a RegisterView
            }
            .font(.footnote)
            .foregroundColor(AppColors.secondaryText)
            .padding(.top, 10)

            Spacer()
        }
        .padding()
        .background(AppColors.background.ignoresSafeArea())
    }

    @ViewBuilder
    func formField(title: String, text: Binding<String>, keyboard: UIKeyboardType = .default, isSecure: Bool = false) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(AppColors.primaryText)

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
            .foregroundColor(AppColors.primaryText)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        }
    }
}

#Preview {
    LoginView()
}
