//
//  InvestmentsView.swift
//  WarrenChallengeRedux
//
//  Created by Heitor Feijó Kunrath on 15/11/22.
//

import SwiftUI

struct InvestmentsView: View {
    
    enum InvestmentsViewStates {
        case placeHolder
        case fetchingInvestments
        case investmentsAvailable
    }
    
    @EnvironmentObject var store: Store<AppState>
    
    struct Props {
        let investments: [InvestmentModel]
        let viewState: InvestmentsViewStates
        let saldo: Int
    }
    
    private func map(state: PortfolioState) -> Props {
        var soma: Double = 0.0
        
        for investimento in state.portfolio.portfolios {
            soma += investimento.totalBalance
        }
        return  Props(investments: state.portfolio.portfolios,
                      viewState: state.portfolio.portfolios.count > 0 ? .investmentsAvailable : .placeHolder,
                      saldo: Int(soma)
        )
        
    }
    
    var body: some View {
        
        let props = map(state: store.state.portfolioState)
        
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
                                .fill(.red.opacity(0.2))
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
                            
                            Text("R$ \(props.saldo)")
                                .font(.largeTitle)
                        }
                        .padding([.leading,.trailing], 10)
                        .background(Color(.white))
                        .cornerRadius(VisualConstants.cornerRadius)
                        .shadow(radius: 0.3)
                        
                    }
                    .padding()
                    
                    
                    
                    Spacer()
                    
                    if props.viewState == .placeHolder {
                        
                        Text("Invista para ter acesso a uma gama de produtos incrível!")
                            .font(.title2)
                            .padding([.leading,.trailing], 20)
                            .background(Color(.white))
                            .cornerRadius(VisualConstants.cornerRadius)
                            .shadow(radius: 0.1)
                            .padding()
                    }
                    else if props.viewState == .investmentsAvailable {
                        HStack {
                            ScrollView(.horizontal, showsIndicators: false, content: {
                                HStack {
                                    ForEach(props.investments, id: \.self) { investment in
                                        InvestmentView(investment: investment)
                                            .padding()
                                    }
                                }
                                
                            })
                        }
                    }
                }
            }
            .ignoresSafeArea()
            
        }
        .background(.gray.opacity(0.05))
        .onAppear {
            store.dispatch(action: FetchInvestments())
        }
    }
}

struct InvestmentsView_Previews: PreviewProvider {
    static var previews: some View {
        InvestmentsView()
    }
}
