import SwiftUI

struct WelcomeView: View {
    @State private var goToRoleSelection = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(AppColors.background)
                    .ignoresSafeArea()

                VStack(spacing: 30) {
                    Image(systemName: "leaf.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(AppColors.accent)

                    Text(AppStrings.welcomeTitle)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.primaryText)

                    Text(AppStrings.welcomeSubtitle)
                        .font(.headline)
                        .foregroundColor(AppColors.secondaryText)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    PrimaryButton(title: AppStrings.startButton) {
                        goToRoleSelection = true
                    }
                }
                .padding()
            }
            .navigationDestination(isPresented: $goToRoleSelection) {
                UserRoleSelectionView()
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    WelcomeView()
}
