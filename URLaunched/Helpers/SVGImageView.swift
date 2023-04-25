//
//  SVGImageView.swift
//  URLaunched
//
//  Created by Artem Stozhok on 25.04.2023.
//

import SwiftUI
import SVGKit

struct SVGKFastImageViewSUI: UIViewRepresentable {
    var url:URL
    var size:CGSize
    
    func makeUIView(context: Context) -> SVGKFastImageView {
        let svgImage = SVGKImage(contentsOf: url)
        return SVGKFastImageView(svgkImage: svgImage ?? SVGKImage())
    }
    
    func updateUIView(_ uiView: SVGKFastImageView, context: Context) {
        uiView.image = SVGKImage(contentsOf: url)
        uiView.image.size = size
    }
}

struct SVGImage_Previews: PreviewProvider {
    static var previews: some View {
        SVGKFastImageViewSUI(url: (URL(string:"https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/android.svg")!), size: (CGSize(width: 100,height: 100)))
    }
}
