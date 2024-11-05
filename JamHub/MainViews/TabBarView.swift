//
//  TabBarView.swift
//  JamHub
//
//  Created by Егорио on 05.11.2024.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selectedTab = 0 // Хранит индекс выбранного таба
    @State private var isTapped = false // Отслеживает состояние анимации
    
    var body: some View {
        VStack {
            // Отображаем соответствующий экран в зависимости от выбранного таба
            ZStack {
                switch selectedTab {
                case 0:
                    HomeView()
                case 1:
                    FavoritesView()
                case 2:
                    PartyView()
                case 3:
                    ProfileView()
                default:
                    HomeView()
                }
            }
            
            Spacer()
            
            // Таб бар
            HStack(spacing: 50) {
                ForEach(0..<tabBarIcons.count, id: \.self) { index in
                    Button(action: {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0)) {
                            isTapped = true // Включаем анимацию
                            selectedTab = index // Обновляем выбранный таб
                        }
                        // Возвращаем размер иконки к норме
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                                isTapped = false
                            }
                        }
                    }) {
                        Image(systemName: selectedTab == index ? selectedTabIcons[index] : tabBarIcons[index])
                            .tabImagesStyle()
                            .foregroundColor(selectedTab == index ? Color(hex: "856EE7") : .gray)
                            .scaleEffect(isTapped && selectedTab == index ? 1.5 : 1.0) // Анимация увеличения при нажатии
                    }
                }
            }
            .padding(20)
            .background(Color(.systemGray6))
            .clipShape(Capsule())
        }
    }
}

let tabBarIcons = [
    "house",
    "heart",
    "waveform.circle",
    "person"
]

let selectedTabIcons = [
    "house.fill",
    "heart.fill",
    "waveform.circle.fill",
    "person.fill"
]

extension Image {
    func tabImagesStyle() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 35, height: 35)
    }
}

#Preview {
    TabBarView()
}
