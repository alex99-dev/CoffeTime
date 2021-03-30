//
//  HomeView.swift
//  CoffeTime
//
//  Created by Buliga Alexandru on 29.03.2021.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var fetch = JsonClass()
    
    var popularCoffe = ["Latte","Cappuccino","Flat white","Americano - white","Americano - black","Mocha","Espresso"]
    
    
    
    
    var body: some View {
        
        
        
        NavigationView{
            VStack(spacing: 0){
                
                ScrollView(.horizontal){
                    HStack(spacing:30){
                        
                        
                        ForEach(popularCoffe.indices, id: \.self) { index in
                            
                            
                            
                            CardView(img:popularCoffe[index] , title: popularCoffe[index])
                        }
                        
                        
                    }.padding()
                }.navigationTitle("Most popular")
                
                
                List(fetch.coffe) { todo in
                    todo
                }
                
                
            }
            .padding(-12.0)
        }
    }
}





struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
    }
}


struct CardView: View {
    var img: String
    var title: String
    
    var body: some View {
        VStack{
            Image(img)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 250, alignment: .center)
                .border(Color.white, width: 2)
                .cornerRadius(2)
                .shadow(color: .gray, radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
            Text(title)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 0.3, x: 0, y: 0)
                .font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)
        }
    }
}


struct CoffeCell: Codable,Identifiable,View {
    var id : Int
    var img: String
    var title: String
    var about: String
    var ratio: String
    var cup: String
    
    var body: some View {
        HStack(){
            Image(img)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 160, height: 170, alignment: .center)
                .border(Color.white, width: 2)
                .cornerRadius(2)
                .shadow(color: .gray, radius: 2, x: 1, y:1)
            VStack(alignment: .leading,spacing:4){
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)
                Text(about)
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                    .font(/*@START_MENU_TOKEN@*/.caption/*@END_MENU_TOKEN@*/)
                
                VStack(alignment: .leading)
                {
                    HStack(alignment: .top){
                        Image(systemName: "rectangle.roundedbottom")
                            .foregroundColor(.gray)
                        Text("Ratio:")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .font(/*@START_MENU_TOKEN@*/.caption/*@END_MENU_TOKEN@*/)
                        
                        Text(ratio)
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .font(/*@START_MENU_TOKEN@*/.caption2/*@END_MENU_TOKEN@*/)
                        
                    }
                    
                    
                    HStack(alignment: .top){
                        Image(systemName: "rectangle.roundedbottom")
                            .foregroundColor(.gray)
                        Text("Cup:")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .font(/*@START_MENU_TOKEN@*/.caption/*@END_MENU_TOKEN@*/)
                        
                        Text(cup)
                            .fontWeight(.medium)
                            .foregroundColor(.green)
                            .font(/*@START_MENU_TOKEN@*/.caption2/*@END_MENU_TOKEN@*/)
                            .allowsTightening(true)
                        
                    }
                    
                }
                
            }
        }
        
    }
}
