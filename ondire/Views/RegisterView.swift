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
                Text(AppStrings.registerTitle)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(AppColors.primaryText)
                    .padding(.top)

                socialButton(label: AppStrings.registerWithApple, icon: "applelogo")
                socialButton(label: AppStrings.registerWithGoogle, icon: "globe")

                Divider().overlay(Text(AppStrings.dividerOr).foregroundColor(AppColors.secondaryText))

                formField(title: AppStrings.fullNameField, text: $fullName)
                formField(title: AppStrings.emailField, text: $email, keyboard: .emailAddress)
                formField(title: AppStrings.passwordField, text: $password, isSecure: true)

                Toggle(isOn: $acceptedTerms) {
                    Text(AppStrings.termsAcceptance)
                        .font(.footnote)
                        .foregroundColor(AppColors.secondaryText)
                }

                PrimaryButton(title: AppStrings.registerAction) {
                    goToHome = true
                }
                .navigationDestination(isPresented: $goToHome) {
                    HomeView()
                }

                Button(AppStrings.alreadyHaveAccount) {
                    goToLogin = true
                }
                .font(.footnote)
                .foregroundColor(AppColors.secondaryText)
                .padding(.top, 10)
                .navigationDestination(isPresented: $goToLogin) {
                    LoginView()
                }
            }
            .padding()
        }
        .background(AppColors.background.ignoresSafeArea())
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
}

#Preview {
    RegisterView()
}
