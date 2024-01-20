//
//  ContentView.swift
//  CalculatorTinkoff
//
//  Created by Мирсаит Сабирзянов on 20.01.2024.
//

import SwiftUI

struct ContentView: View {
    private var columns: [GridItem] = Array(repeating: .init(.flexible(minimum: 50, maximum: .infinity), spacing: 16), count: 4)
    
    private var columnsOperators: [GridItem] = [
        GridItem(.flexible(minimum: 50), spacing: 10)
    ]
    
    var buttonTypes: [[ButtonType]] {
        [[.clear, .operation(.division)],
         [.digit(.seven), .digit(.eight), .digit(.nine), .operation(.multiplication)],
         [.digit(.four), .digit(.five), .digit(.six), .operation(.subtraction)],
         [.digit(.one), .digit(.two), .digit(.three), .operation(.addition)],
         [.digit(.zero), .decimal, .equals]]
    }
    
    @State var text = "0"
    
    var body: some View {
        VStack(alignment: .trailing){
            Spacer()
            Text(text)
                .font(.custom("Helvetica", fixedSize: 60))
                .bold()
                .padding(.horizontal, 20)
            ForEach(buttonTypes, id: \.self){ row in
                HStack{
                    ForEach(row, id: \.self){ element in
                        Button{
                            text = text == "0" ? element.description : text + element.description
                        }label: { CalculateButton(text: element.description, color: element.color)
                        }
                    }
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

struct CalculateButton: View {
    let text: String
    let color: Color
    var body: some View {
        Text("\(text)")
            .frame(minWidth: 50, maxWidth: .infinity, minHeight: 50, maxHeight: 100)
            .background(color)
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
    
    
#Preview {
        ContentView()
}
