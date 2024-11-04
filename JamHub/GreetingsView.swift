//
//  GreetingsView.swift
//  JamHub
//
//  Created by Егорио on 02.11.2024.
//

import SwiftUI
import RiveRuntime

struct GreetingsView: View {
    @State private var showLoginView = false
    @State private var isPressed = false // переменная состояния для анимации нажатия
    private let mainColor = Color(hex: "856EE7")

    var body: some View {
        ZStack {
            // Фон с анимацией
            backgroundView
            
            // Основное содержимое
            content
                .offset(y: showLoginView ? -10 : 0)
            
            Color(.gray)
                .opacity(showLoginView ? 0.6 : 0)
                .ignoresSafeArea()
            
            // Модальное окно для авторизации
            if showLoginView {
                LoginView()
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .overlay(
                        Button {
                            withAnimation(.spring()) {
                                showLoginView = false
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .frame(width: 36, height: 36)
                                .foregroundStyle(.black)
                                .background(.white)
                                .mask(Circle())
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
                                .offset(y: -15)
                        }
                            .frame(maxHeight: .infinity, alignment: .bottom)
                    )
                    .zIndex(1)
            }
        }
    }

    // Основное содержимое
    private var content: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Заголовки
            Group {
                Text("Твоя музыка.")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Твоя компания.")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Твой JamHub.")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(10)
                    .background(mainColor)
                    .cornerRadius(20, corners: [.topRight, .bottomRight, .bottomLeft])
                    .offset(x: -10)
                    .foregroundColor(.white)
            }

            Text("Открой для себя новые треки и делитесь своими любимыми плейлистами, независимо от того, где вы находитесь. Jam Hub объединяет людей через музыку, позволяя каждому насладиться совместным прослушиванием любимых треков!")
                .font(.title2)
                .padding(.top, 20)
            
            Spacer()
            
            // Кнопка с анимацией нажатия
            Button(action: {
                isPressed = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation(.bouncy()) {
                        showLoginView = true
                    }
                    isPressed = false // сброс анимации после нажатия
                }
            }) {
                Label("Поехали!", systemImage: "music.note")
                    .padding()
                    .background(mainColor)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(radius: 5)
            }
            .scaleEffect(isPressed ? 1.2 : 1.0) // изменение масштаба кнопки при нажатии
            .animation(.easeOut(duration: 0.1), value: isPressed) // настройка анимации
            
            Text("Слушай, делись и наслаждайся вместе с друзьями")
                .font(.subheadline)
                .padding(.top, 10)
        }
        .padding(30)
    }
    
    // Фон с анимацией
    private var backgroundView: some View {
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 30)
            .background(
                Image("Spline")
                    .blur(radius: 50)
                    .offset(x: 200, y: 100)
            )
    }
}

#Preview {
    GreetingsView()
}

