//
//  HomeView.swift
//  ondire
//
//  Created by ruizvi | VIDAL RUIZ VARGAS on 09/05/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundColor").ignoresSafeArea()

                VStack(spacing: 30) {
                    Text("Bienvenido a Ondire 👋")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("PrimaryText"))
                        .multilineTextAlignment(.center)
                        .padding(.top)

                    Text("Aquí podrás gestionar tus clases, citas o encontrar profesionales de bienestar.")
                        .font(.subheadline)
                        .foregroundColor(Color("SecondaryText"))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    Image(systemName: "leaf.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color("AccentColor"))

                    Button(action: {
                        // Acción futura: ir al dashboard
                    }) {
                        Text("Empezar")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("OndirePrimaryColor"))
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)

                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    HomeView()
}
