//
//  detailQuotes.swift
//  QuotesIOS
//
//  Created by Osver Fernandez on 7/6/22.
//

import SwiftUI

struct detailQuotes: View {
    var widthx = UIScreen.main.bounds.width
    var heightx = UIScreen.main.bounds.height
    
    let gradient = LinearGradient(
            gradient: Gradient(stops: [
                .init(color: .white, location: 0),
                //.init(color: .white, location: 0.01),
                .init(color: .clear, location: 0.3)
            ]),
            startPoint: .bottom,
            endPoint: .top
    )
    let gradient2 = LinearGradient(
            gradient: Gradient(stops: [
                .init(color: .clear, location: 0.1),
                //.init(color: .white, location: 0.01),
                .init(color: .yellow, location: 1)
            ]),
            startPoint: .bottom,
            endPoint: .top
    )
    
    var completedQuotes:quotesStructure
    
    var body: some View {
        VStack(){
            Image(completedQuotes.img)
                .resizable()
                .scaledToFill()
                .overlay(gradient)
                .overlay(gradient2)
                .frame(width: widthx,height: heightx*0.43,alignment: .bottom)
            Text(completedQuotes.name)
                .font(.largeTitle)
                .frame(width: widthx, alignment: .trailing)
                .foregroundColor(Color.white)
                .padding(.top,-30)
                .padding(.trailing,30)
                .shadow(color: .black, radius: 5, x: 0, y: 0)
                .shadow(color: .black, radius: 5, x: 0, y: 0)
            ScrollView {
                ForEach(0..<completedQuotes.quotes.count){ index in
                    Text(completedQuotes.quotes[index])
                        .frame(width: widthx-30, alignment: .leading)
                        .padding(.leading,30)
                        .padding(.trailing,10)
                    
                    Divider()
                }
            }
            
        }.ignoresSafeArea()
    }
}

struct detailQuotes_Previews: PreviewProvider {
    static var previews: some View {
        let model = quotesLogic()
        detailQuotes(completedQuotes: model.completeData[1])
    }
}
