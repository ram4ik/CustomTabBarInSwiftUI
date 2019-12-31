//
//  ContentView.swift
//  CustomTabBarInSwiftUI
//
//  Created by Ramill Ibragimov on 31.12.2019.
//  Copyright © 2019 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selected = 0
    
    var body: some View {
        VStack {
            Spacer()
            ZStack(alignment: .top) {
                BottomBar(selected: self.$selected)
                    .padding()
                    .padding(.horizontal, 22)
                    .background(CurvedShape())
                
                Button(action: {
                    
                }) {
                    ZStack {
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.orange)
                            .shadow(radius: 5)
                        Image(systemName: "heart")
                            .font(.title)
                            .foregroundColor(Color("Color"))
                    }.offset(y: -28)
                }
            }
        }.background(Color("Color")).edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CurvedShape: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 55))
            
            path.addArc(center: CGPoint(x: UIScreen.main.bounds.width / 2, y: 55), radius: 32, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
            
            path.addLine(to: CGPoint(x: 0, y: 55))
        }.fill(Color.white)
        .rotationEffect(.init(degrees: 180))
    }
}

struct BottomBar: View {
    @Binding var selected: Int
    
    var body: some View {
        HStack {
            Button(action: {
                self.selected = 0
            }) {
                Image(systemName: "house")
                    .font(.title)
            }.foregroundColor(self.selected == 0 ? .black : .gray)
            
            Spacer(minLength: 12)
            Button(action: {
                self.selected = 1
            }) {
                Image(systemName: "magnifyingglass")
                    .font(.title)
            }.foregroundColor(self.selected == 1 ? .black : .gray)
            
            Spacer().frame(width: 120)
            Button(action: {
                self.selected = 2
            }) {
                Image(systemName: "person")
                    .font(.title)
            }.foregroundColor(self.selected == 2 ? .black : .gray)
            
            Spacer(minLength: 12)
            Button(action: {
                self.selected = 3
            }) {
                Image(systemName: "line.horizontal.3")
                    .font(.title)
            }.foregroundColor(self.selected == 3 ? .black : .gray)
        }
    }
}
