import SwiftUI

struct WelcomeView: View {
    @State private var goToRoleSelection = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()

                VStack(spacing: 30) {
                    Image(systemName: "leaf.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color("AccentColor"))

                    Text("Bienvenido a Ondire")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("PrimaryText"))

                    Text("La app que cuida de quienes cuidan")
                        .font(.headline)
                        .foregroundColor(Color("SecondaryText"))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    Button(action: {
                        goToRoleSelection = true
                    }) {
                        Text("Comenzar")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("OndirePrimaryColor"))
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
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
