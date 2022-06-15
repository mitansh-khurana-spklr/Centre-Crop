//
//  SquareAspectView.swift
//  CentreCrop
//
//  Created by Mitansh Khurana on 09/06/22.
//

import SwiftUI
import AVFoundation


struct SquareAspectView: View {
    var uiImage = UIImage(named: "Mitansh Khurana")
    var rectangle : CGRect
    let AR = CGSize(width: 1, height: 1)
    var boundingRect : CGRect
    
    var cropped : UIImage
    
    
    init(){
        
        rectangle = CGRect(x: 0, y: 0, width: uiImage!.size.width, height: uiImage!.size.height)
        
        boundingRect = AVMakeRect(aspectRatio: AR, insideRect: rectangle)
        
        cropped = cropImage1(image: uiImage!, rect: boundingRect)
    }
    
    var body: some View {
        VStack {
            
            Text("Image cropped to 1:1 Ratio")
                .font(.title)
            
            ZStack {
                
                Image(uiImage: uiImage!)
                    .resizable()
                    .opacity(0.2)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Image(uiImage: cropped)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
        }
    }
}

struct SquareAspectView_Previews: PreviewProvider {
    static var previews: some View {
        SquareAspectView()
    }
}
