//
//  ContentView.swift
//  Shared
//
//  Created by vvusu on 6/8/21.
//

import SwiftUI

struct ContentView: View {
    let scale: CGFloat = UIScreen.main.bounds.width / 414
    @EnvironmentObject var model: CalculatorModel
    @State private var editingHistory = false
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Button("操作履历: \(model.history.count)") {
                self.editingHistory = true
            }.sheet(isPresented: self.$editingHistory) {
                HistoryView(model: self.model)
            }
            Text(model.brain.output)
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .padding(.trailing, 24)
                .lineLimit(1)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
            CalculatorButtonPad().padding(.bottom)
        }.scaleEffect(scale)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environment(\.colorScheme, .dark).environmentObject(CalculatorModel())
                .previewDevice("iPhone 12 Pro Max")
            ContentView().previewDevice("iPhone SE (2nd generation)").environmentObject(CalculatorModel())
            ContentView().previewDevice("iPad Pro (12.9-inch) (5th generation)").environmentObject(CalculatorModel())
        }
    }
}
