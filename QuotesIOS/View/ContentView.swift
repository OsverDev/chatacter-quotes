//
//  ContentView.swift
//  QuotesIOS
//
//  Created by Osver Fernandez on 7/5/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = quotesLogic()
    var widthx = UIScreen.main.bounds.width
    var heightx = UIScreen.main.bounds.height
    
    
    
    var body: some View {
        
        NavigationView {
            VStack{
                VStack{
                    Text("Characters")
                        .font(.title)
                        .padding(.top,30)
                        .padding(.leading,30)
                }.frame(width: widthx, height: 50, alignment: .leading)
                ScrollView {
                    ForEach(0..<model.completeData.count){ index in
                        NavigationLink{
                            detailQuotes(completedQuotes: model.completeData[index]).onAppear{}
                        }label: {
                            Image(model.completeData[index].img)
                                .resizable()
                                .scaledToFill()
                                .overlay(
                                    Text(model.completeData[index].name)
                                        .foregroundColor(Color.white)
                                        .shadow(color: .black, radius: 5, x: 0, y: 0)
                                        .shadow(color: .black, radius: 5, x: 0, y: 0)
                                )
                                .padding(.vertical,-6)
                                .frame(width: widthx, height: 200, alignment: .center)
                                .clipped()
                        }
                        
                    }
                }
            }.navigationBarTitle("title", displayMode: .inline)
                .navigationBarHidden(true)
        }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
