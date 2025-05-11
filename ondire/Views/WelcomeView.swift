import SwiftUI

struct WelcomeView: View {
    @State private var goToRoleSelection = false
    @StateObject private var viewModel = WelcomeViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                Color(AppColors.background)
                    .ignoresSafeArea()

                VStack(spacing: 30) {
                    
                    Image("LogoTexto")
                        .resizable()
                        .scaledToFit()
                        
                    
                   /* Image(systemName: "leaf.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(AppColors.accent)*/

                    Text(AppStrings.welcomeTitle)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.primaryText)

                    Text(AppStrings.welcomeSubtitle)
                        .font(.headline)
                        .foregroundColor(AppColors.secondaryText)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    Text(viewModel.apiStatusText)
                        .font(.footnote)
                        .foregroundColor(AppColors.secondaryText)

                    if viewModel.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .tint(AppColors.accent)
                    }

                    Spacer() // 👇 Empuja el botón hacia abajo
                    
                    Group {
                        PrimaryButton(title: AppStrings.startButton) {
                            goToRoleSelection = true
                        }
                        .disabled(!viewModel.isApiAvailable)
                    }
                    .opacity(viewModel.isApiAvailable ? 1.0 : 0.4)
                    .padding(.bottom, 20)
                }
                .padding()
            }
            .navigationDestination(isPresented: $goToRoleSelection) {
                UserRoleSelectionView()
            }
            .navigationBarHidden(true)
            .task {
                viewModel.fetchApiStatus()
            }
        }
    }
}

#Preview {
    WelcomeView()
}
