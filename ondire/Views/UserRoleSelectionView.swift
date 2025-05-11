import SwiftUI

struct UserRoleSelectionView: View {
    @State private var navigateToRegister = false
    @State private var goToLogin = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                //Color("BackgroundColor").ignoresSafeArea()
                AppColors.background.ignoresSafeArea(edges: .all)
                VStack(spacing: 30) {
                    Text(AppStrings.roleSelectionTitle)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(AppColors.primaryText)
                        .multilineTextAlignment(.center)
                        .padding(.top, 40)

                    VStack(spacing: 20) {
                        roleCard(
                            imageName: "OfrecerClases",
                            title: AppStrings.roleProviderTitle,
                            description: AppStrings.roleProviderDescription,
                            action: {
                                navigateToRegister = true
                            }
                        )

                        roleCard(
                            imageName: "TomarClases",
                            title: AppStrings.roleClientTitle,
                            description: AppStrings.roleClientDescription,
                            action: {
                                navigateToRegister = true
                            }
                        )
                    }
                    .padding(.horizontal)

                    Spacer() // 👇 Empuja el botón hacia abajo
                    
                    
                    PrimaryButton(title: AppStrings.loginButton) {
                        goToLogin = true
                    }
                    .padding(.bottom, 20)
                    .navigationDestination(isPresented: $goToLogin) {
                        LoginView()
                    }
                }
            }
            .navigationDestination(isPresented: $navigateToRegister) {
                RegisterView()
            }
            .navigationBarHidden(false)
        }
        .navigationBarBackButtonHidden(false)
    }

    @ViewBuilder
    func roleCard(imageName: String, title: String, description: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(spacing: 0) {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 160)
                    .clipped()
                    .cornerRadius(15, corners: [.topLeft, .topRight])

                VStack(alignment: .leading, spacing: 6) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(Color("PrimaryText"))

                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(Color("SecondaryText"))
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
            }
            .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        }
    }
}
// MARK: - Rounded corner helper
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = 12.0
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
