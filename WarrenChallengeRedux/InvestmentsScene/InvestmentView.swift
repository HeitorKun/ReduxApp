//
//  InvestmentView.swift
//  WarrenChallengeRedux
//
//  Created by Heitor Feijó Kunrath on 16/11/22.
//

import SwiftUI

struct InvestmentView: View {
    
    @ObservedObject var imageLoader = WebImageLoader()
    var investment: InvestmentModel
    
    struct Props {
        let progressValue: Double
        let progressTotal: Double
    }
    
    private func map() -> Props {
        var progressValue = Double(investment.totalBalance)
        let progressTotal = investment.goalAmount == nil ? progressValue : Double(investment.goalAmount!)
        if progressValue > progressTotal {
            progressValue = progressTotal
        }
        return Props(progressValue: progressValue
                     , progressTotal: progressTotal
        )
        
    }
    
    var body: some View {
        
        let props = map()
        
        ZStack{
            Rectangle()
                .fill(.gray.opacity(0.05))
                .blendMode(.multiply)
            VStack {
                Image(uiImage: UIImage(data: imageLoader.imageData) ?? UIImage())
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(alignment: .top)
                    .shadow(radius: 0.1)
                    .cornerRadius(VisualConstants.cornerRadius)
                Spacer()
            }
            VStack {
                
                Spacer()
                
                HStack{
                    Text("Próximo passo")
                        .foregroundColor(.black)
                        .font(.body)
                        .opacity(0.5)
                    Spacer()
                }
                HStack{
                    Text("\(investment.name)")
                        .foregroundColor(.black)
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                ProgressView("", value: props.progressValue, total: props.progressTotal)
                
            }
            .padding()
            
        }
        .cornerRadius(VisualConstants.cornerRadius)
        .frame(maxWidth:  UIScreen.main.bounds.width * 0.6, maxHeight: UIScreen.main.bounds.height * 0.3)
        .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.3)
        .shadow(radius: 0.2)
    }
}

