//
//  LandingView.swift
//  WarrenChallengeRedux
//
//  Created by Heitor Feijó Kunrath on 13/11/22.
//

import SwiftUI

struct LandingView: View {
    @State private var showingSheet = false
    
    @EnvironmentObject var store: Store<AppState>
    
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
                }
                .padding()
                .buttonStyle(WideButtonStyle())
                .fullScreenCover(isPresented: $showingSheet, content: {
                    LoginView().environmentObject(store)
                })
                
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
