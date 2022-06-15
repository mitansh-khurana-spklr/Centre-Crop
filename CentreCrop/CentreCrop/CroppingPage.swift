//
//  CroppingPage.swift
//  CentreCrop
//
//  Created by Mitansh Khurana on 09/06/22.
//

import SwiftUI

struct CroppingPage: View {
    
    @State var croppedTo: String = "original"
    let uiImage = UIImage(named: "Mitansh Khurana")
    
    var body: some View {
        
        VStack{
            
            if(croppedTo == "original"){
                VStack {
                    
                    Text("Original Image")
                        .font(.title)
                    
                    Image(uiImage: uiImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
            }
            else if (croppedTo == "square"){
                SquareAspectView()
                    
            }
            else if (croppedTo == "portrait"){
                PortraitAspectView()
            }
            else if(croppedTo == "landscape"){
                LandscapeAspectView()
            }
            
            
            Text("Crop to:")
                .padding()
                .font(.largeTitle)
            
            HStack{
                Button("1:1"){
                    croppedTo = "square"
                }
                    .padding(.leading, 80)
                    .font(.title)
                    
                
                Spacer()
                
                Button("4:5"){
                    croppedTo = "portrait"
                }
                    .font(.title)
                    .padding(.leading, 20)
                
                Spacer()
                
                Button("1.91:1"){
                    croppedTo = "landscape"
                }
                    .padding(.trailing, 80)
                    .font(.title)
            }
        }
        
    }
}

struct CroppingPage_Previews: PreviewProvider {
    static var previews: some View {
        CroppingPage()
    }
}
