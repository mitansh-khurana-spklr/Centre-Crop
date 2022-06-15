//
//  ContentView.swift
//  CentreCrop
//
//  Created by Mitansh Khurana on 08/06/22.
//



// Core Graphics
// CGSize, CGRect, CGFloat, CGPoint

// UIImage -
// CGImage - 




import SwiftUI
import AVFoundation


func cropImage1(image: UIImage, rect: CGRect) -> UIImage {
    let cgImage = image.cgImage! // guard
    let croppedCGImage = cgImage.cropping(to: rect)
    return UIImage(cgImage: croppedCGImage!)
}


struct ContentView: View {
    
    var uiImage = UIImage(named: "Mitansh Khurana")
    
    
    var body: some View {
        
        NavigationView{
            VStack {
                Text("Original Image")
                    .font(.title)
                
                Image(uiImage: uiImage!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Spacer()
                
                NavigationLink(destination: CroppingPage()){
                    Text("Crop")
                        .font(.largeTitle)
                }
                
                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
