//
//  ContentView.swift
//  MatchGeometryEffect
//
//  Created by Skorobogatow, Christian on 3/8/22.
//

import SwiftUI

struct MatchedGeometryEffectView: View {
    
    @State private var isClicked: Bool = false
    @Namespace private var namespace
    
    var body: some View {
        VStack {
            if !isClicked {
                Circle()
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 100, height: 100)
                    
            }
            
            
            
            Spacer()
            
            
            if isClicked {
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 35, height: 2)
                    .offset(y: 10)
                    
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isClicked.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        MatchedGeometryEffectView()
        MatchedGeometryEffectView2()
    }
}

struct MatchedGeometryEffectView2: View {
    
    let categories: [String] = ["Home", "Popular", "Saved"]
    @State private var selected: String = ""
    @Namespace private var namespace2
    
    var body: some View {
        HStack {
            ForEach(categories, id: \.self) { category in
                ZStack {
                    if selected == category {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.red).opacity(0.5)
                        .matchedGeometryEffect(id: "category_background", in: namespace2)
                    }
                    
                    Text(category)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation {
                        selected = category
                    }
                    
                }
            }
        }
        .padding()
    }
}