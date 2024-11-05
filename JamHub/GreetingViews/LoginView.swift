//
//  LoginView.swift
//  JamHub
//
//  Created by Егорио on 04.11.2024.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
       
        ZStack {
            
            VStack(alignment: .center, spacing: 20) {
                
                Text("Войдите в свою учетную запись")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Подключитесь через Apple, Google или VK, чтобы продолжить")
                    .multilineTextAlignment(.center)
                
                HStack {
                    Button {} label: {
                        Image("appleLogo")
                            .logoStyle()
                    }
                    
                    Spacer()
                    
                    Button {} label: {
                        Image("vkLogo")
                            .logoStyle()
                    }
                    
                    Spacer()
                    
                    Button {} label: {
                        Image("googleLogo")
                            .logoStyle()
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 20)
                .padding(.bottom, 20)
                
            }
            .padding(30)
            .background(.regularMaterial)
            .cornerRadius(30)
            .frame(maxWidth: .infinity)
            .padding(30)
            .shadow(color: .black.opacity(0.6), radius: 30, x: 0, y: 1)
        }
    }
}

extension Image {
    func logoStyle() -> some View {
        self
            .resizable()
            .frame(width: 40, height: 40)
            .aspectRatio(contentMode: .fit)
    }
}


#Preview {
    LoginView()
}
