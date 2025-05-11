//
//  SplashView.swift
//  ondire
//
//  Created by ruizvi | VIDAL RUIZ VARGAS on 11/05/25.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var scale: CGFloat = 0.8
    @State private var opacity = 0.5

    var body: some View {
        if isActive {
            WelcomeView()
        } else {
            VStack {
                Image("LogoTexto")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .scaleEffect(scale)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 2.0)) {
                            self.scale = 1.0
                            self.opacity = 1.0
                        }
                    }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(AppColors.background))
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}
