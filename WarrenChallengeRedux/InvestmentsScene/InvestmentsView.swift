//
//  InvestmentsView.swift
//  WarrenChallengeRedux
//
//  Created by Heitor Feijó Kunrath on 15/11/22.
//

import SwiftUI

struct InvestmentsView: View {
    @State private var saldo: Int = 122222
    
    var body: some View {
        
        VStack {
            ScrollView {
                VStack {
                    ZStack{
                        ZStack{
                            Image("planeAndBuildings")
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFill()
                                .frame(alignment: .top)
                            Rectangle()
                                .fill(.red.opacity(0.3))
                                .blendMode(.multiply)
                        }
                        VStack{
                            Spacer()
                            HStack{
                                Text("Próximo passo")
                                    .foregroundColor(.white)
                                    .font(.body)
                                Spacer()
                            }
                            HStack{
                                Text("Analise")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .bold()
                                Spacer()
                            }
                            HStack{
                                Text("Vocês está no caminho certo, continue investindo")
                                    .foregroundColor(.white)
                                    .font(.body)
                                    .bold()
                                Spacer()
                            }
                        }
                        .padding()
                        
                    }
                    VStack {
                        VStack {
                            Text("Seu saldo é de")
                            
                            Text("R$ \(saldo)")
                                .font(.largeTitle)
                        }
                        .padding([.leading,.trailing], 10)
                        .background(Color(.white))
                        .cornerRadius(VisualConstants.cornerRadius)
                        .shadow(radius: 0.3)
                        
                    }
                    .padding()
                    
                    Spacer()
                    
                    HStack {
                        List {
                            [1,2,3,4,5].forEach { _ in
                                Text("sasasaas")
                            }
                        }
                        
                    }
                    
                    Spacer()
                    
                }
            }
            .ignoresSafeArea()
            
            
        }.background(.gray.opacity(0.05))
        
        
    }
}

struct InvestmentsView_Previews: PreviewProvider {
    static var previews: some View {
        InvestmentsView()
    }
}
