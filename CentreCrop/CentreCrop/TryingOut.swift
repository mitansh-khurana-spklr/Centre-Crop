//
//  TryingOut.swift
//  CentreCrop
//
//  Created by Mitansh Khurana on 09/06/22.
//

import SwiftUI
import AVFoundation

struct TryingOut: View {
    var uiImage = UIImage(named: "Mitansh Khurana")
    var rectangle : CGRect
    let AR = CGSize(width: 1.91, height: 1)
    var boundingRect : CGRect
    @State var scale: CGFloat = 1
    
    var cropped : UIImage
    
    
    init(){
        
        rectangle = CGRect(x: 0, y: 0, width: uiImage!.size.width, height: uiImage!.size.height)
        
        boundingRect = AVMakeRect(aspectRatio: AR, insideRect: rectangle)
        
        cropped = cropImage1(image: uiImage!, rect: boundingRect)
    }
    
    
    
    var body: some View {
        VStack {
            
            
            
            ZStack {
                
                ScrollView([.horizontal, .vertical]){
                    Image(uiImage: uiImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(self.scale)
                        .gesture(MagnificationGesture()
                            .onChanged({ scale in
                                self.scale = scale.magnitude
                                
                            }).onEnded({scaleFinal in
                                self.scale = scaleFinal.magnitude
                            }))
                      
                }
            
                Rectangle()
                    .aspectRatio(1.91/1, contentMode: .fit)
                    .foregroundColor(Color.white.opacity(0.2))
//                    .frame(width: 300, height: 300)
                
                
                    
                    
                    
                    
                
                
//                Image(uiImage: cropped)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .padding()
            }
        }
    }
}

struct TryingOut_Previews: PreviewProvider {
    static var previews: some View {
        TryingOut()
    }
}
