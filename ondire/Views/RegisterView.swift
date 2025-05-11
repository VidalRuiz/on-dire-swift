import SwiftUI

struct RegisterView: View {
    @StateObject private var viewModel = RegisterViewModel()
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var acceptedTerms = true
    @State private var goToLogin = false
    @FocusState private var focusedField: Field?

    enum Field {
        case fullName, email, password
    }

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
                
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(AppColors.error)
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }

                formField(title: AppStrings.fullNameField, text: $fullName)
                    .focused($focusedField, equals: .fullName)
                    .submitLabel(.next)
                    .onSubmit { focusedField = .email }
                formField(title: AppStrings.emailField, text: $email, keyboard: .emailAddress)
                    .focused($focusedField, equals: .email)
                    .submitLabel(.next)
                    .onSubmit { focusedField = .password }
                formField(title: AppStrings.passwordField, text: $password, isSecure: true)
                    .focused($focusedField, equals: .password)
                    .submitLabel(.done)
                    .onSubmit {
                        focusedField = nil
                        viewModel.register(
                            fullName: fullName,
                            email: email,
                            password: password,
                            termsAccepted: acceptedTerms
                        )
                    }

                Toggle(isOn: $acceptedTerms) {
                    Text(AppStrings.termsAcceptance)
                        .font(.footnote)
                        .foregroundColor(AppColors.secondaryText)
                }

                PrimaryButton(title: AppStrings.registerAction) {
                    focusedField = nil
                    viewModel.register(
                        fullName: fullName,
                        email: email,
                        password: password,
                        termsAccepted: acceptedTerms
                    )
                }
                .disabled(viewModel.isLoading || fullName.isEmpty || email.isEmpty || password.isEmpty)

                if viewModel.isLoading {
                    ProgressView(AppStrings.loadingCreatingAccount)
                        .foregroundColor(AppColors.primaryText)
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
        .alert(AppStrings.accountCreatedTitle, isPresented: Binding(
            get: { viewModel.accountCreated },
            set: { viewModel.accountCreated = $0 }
        )) {
            Button(AppStrings.goToLoginButton) {
                goToLogin = true
            }
        } message: {
            Text(viewModel.successMessage ?? AppStrings.accountCreatedMessage)
        }

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
