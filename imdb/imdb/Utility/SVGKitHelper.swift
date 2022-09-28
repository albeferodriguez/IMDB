//
//  SVGKitHelper.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 28/9/22.
//

import SwiftUI
import SVGKit

struct SVGImageView: UIViewRepresentable {
    var url:URL
    var size:CGSize

    func updateUIView(_ uiView: SVGKFastImageView, context: Context) {
        uiView.contentMode = .scaleAspectFill
        uiView.image.size = size
    }

    func makeUIView(context: Context) -> SVGKFastImageView {
        let svgImage = SVGKImage(contentsOf: url)
        return SVGKFastImageView(svgkImage: svgImage ?? SVGKImage())
    }
}
