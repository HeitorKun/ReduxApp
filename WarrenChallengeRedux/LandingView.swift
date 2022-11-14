//
//  LandingView.swift
//  WarrenChallengeRedux
//
//  Created by Heitor Feijó Kunrath on 13/11/22.
//

import SwiftUI

struct LandingView: View {
    @State private var showingSheet = false
    
    var body: some View {
            ZStack {
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
                        .padding([.bottom], 50)
                        .padding([.leading], 30)
                        
                    }
                    
                    Spacer()
                    
                    
                        Button {
                            showingSheet.toggle()
                        } label: {
                            Text("Login")
                                .padding([.bottom,.top])
                                .font(.title3)
                                .frame(minWidth: 0 , maxWidth: .infinity)
                                .background(Color("redWarren"))
                                .foregroundColor(.white)
                                .cornerRadius(11)
                        }
                        .padding()
                        .fullScreenCover(isPresented: $showingSheet, content: LoginView.init)
                    
                    Spacer()
                }
                
            }
            .edgesIgnoringSafeArea(.top)
        }
    }


struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
