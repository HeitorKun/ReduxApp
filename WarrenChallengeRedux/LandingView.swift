//
//  LandingView.swift
//  WarrenChallengeRedux
//
//  Created by Heitor Feijó Kunrath on 13/11/22.
//

import SwiftUI

struct LandingView: View {
    
    @State var selection: Int? = nil
    
    var body: some View {
        
        NavigationStack {
            VStack{
                ZStack {
                    Image("lakeHouse")
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.8)
                        .edgesIgnoringSafeArea(.all)
                        .padding()
                }.overlay(alignment: .bottom) {
                    VStack{
                        HStack{
                            Text("Invista em você")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .bold()
                            Spacer()
                        }
                        HStack{
                            Text("Invista toma tempo, mas não precisa ser o seu. Conte com os nossos especialistas")
                                .foregroundColor(.white)
                                .font(.body)
                            Spacer()
                        }
                    }
                    .padding([.bottom], 60)
                    .padding([.leading], 30)
                    
                }
                .padding([.top], 0)
                
                NavigationLink(value: "LoginView") {
                    Text("Login")
                        .padding([.bottom,.top])
                        .font(.title3)
                        .frame(minWidth: 0 , maxWidth: .infinity)
                        .background(Color("redWarren"))
                        .foregroundColor(.white)
                        .cornerRadius(11)
                }
                .navigationDestination(for: String.self) { view in
                    if view == "LoginView" {
                        LoginView()
                            .navigationBarHidden(true)
                    }
                }
                .padding()
                .padding(.bottom, 50)
                
            }
            
            
        }.edgesIgnoringSafeArea(.top)
        
    }
    
}



struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
