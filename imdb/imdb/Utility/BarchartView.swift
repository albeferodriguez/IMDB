//
//  BarchartView.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 28/9/22.
//

import SwiftUI

struct BarchartView: View {

    var value: Double
    var width: Double
    var height: Double

    @State var progress = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {

        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.gray)
                .frame(width: width, height: height)

                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.red)
                    .frame(width: (width*progress)/100 , height: height)
                    .onReceive(timer) { _ in
                        if progress < value {
                            progress += 10
                    }
            }
        }

    }
}

struct BarchartView_Previews: PreviewProvider {
    static var previews: some View {

        BarchartView(value: 56.0, width: 100, height: 15)
    }
}
