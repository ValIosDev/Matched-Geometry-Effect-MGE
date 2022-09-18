//
//  ContentView.swift
//  MGE
//
//  Created by Valentin Harenzhenkov on 18.09.22.
//

import SwiftUI

//1. Создать 2 состояния - маленький аватар и большой аватар - Готово!
//2. Создать условие - состояние перехода
//3. Настроить анимацию


struct ContentView: View {
    
    @State var shoBigView = false
    @Namespace var profileAnimation
    @Namespace var img
    @Namespace var name
    @Namespace var age
    
    var body: some View {
        VStack {
            if shoBigView {
                BigProfileView()
            } else {
                SmallProfileView()
            }
            List { }
        }
        .padding()
    }
    
    @ViewBuilder func SmallProfileView() -> some View {
        HStack(spacing: 16) {
            Image("cat")
                .resizable()
                .matchedGeometryEffect(id: img, in: profileAnimation)
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        shoBigView = true
                    }
                }
            VStack(alignment: .leading) {
                Text("Кошка в очках")
                    .font(.title.bold())
                    .matchedGeometryEffect(id: name, in: profileAnimation)
                Text("5 лет")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .matchedGeometryEffect(id: age, in: profileAnimation)
            }
            Spacer()
                
        }
    }
    
    @ViewBuilder func BigProfileView() -> some View {
        VStack {
            Image("cat")
                .resizable()
                .matchedGeometryEffect(id: img, in: profileAnimation)
                .aspectRatio(contentMode: .fill)
                .frame(width: 180, height: 180)
                .clipShape(Circle())
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        shoBigView = false
                    }
                }
            Text("Кошка в очках")
                .font(.largeTitle.bold())
                .matchedGeometryEffect(id: name, in: profileAnimation)
            Text("5 лет")
                .font(.title2)
                .fontWeight(.semibold)
                .matchedGeometryEffect(id: age, in: profileAnimation)
            Text("Если рядом кошка, все становится особенным... даже одиночество.")
                .multilineTextAlignment(.center)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
