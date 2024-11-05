//
//  HomeView.swift
//  JamHub
//
//  Created by Егорио on 05.11.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack() {
            
            HStack(spacing: 20) {
                Button{} label: {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                        .foregroundStyle(.black)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("Привет,")
                            .fontWeight(.medium)
                        Text("Имя!")
                            .fontWeight(.medium)
                            .padding(4)
                            .background(Color(hex: "856EE7"))
                            .cornerRadius(5, corners: [.allCorners])
                            .foregroundStyle(.white)
                    }
                    Text("Добрый вечер")
                }
                
                Spacer()
                
                Button {} label: {
                    Image(systemName: "bell")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundStyle(.black)
                }
            }
            
            Spacer()
            
        }
        .padding(30)
    }
}

#Preview {
    HomeView()
}
