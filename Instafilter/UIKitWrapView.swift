//
//  UIKitWrap.swift
//  Instafilter
//
//  Created by AlecNipp on 7/16/23.
//

import SwiftUI

struct UIKitWrapView: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            Button("Select Image") {
                showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        onChange(of: inputImage) { _ in 
            loadImage()
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct UIKitWrapView_Previews: PreviewProvider {
    static var previews: some View {
        UIKitWrapView()
    }
}
