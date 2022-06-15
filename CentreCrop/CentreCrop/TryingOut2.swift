//
//  TryingOut2.swift
//  CentreCrop
//
//  Created by Mitansh Khurana on 09/06/22.
//

import SwiftUI

struct TryingOut2: View {
    @State private var uiimage = UIImage(named: "Mitansh Khurana")

        @GestureState private var scaleState: CGFloat = 1
        @GestureState private var offsetState = CGSize.zero

        @State private var offset = CGSize.zero
        @State private var scale: CGFloat = 1

        var magnification: some Gesture {
            MagnificationGesture()
                .updating($scaleState) { currentState, gestureState, _ in
                    gestureState = currentState
                    
                }
                .onEnded { value in
                    scale *= value
                }
        }

        var dragGesture: some Gesture {
            DragGesture()
                .updating($offsetState) { currentState, gestureState, _ in
                    gestureState = currentState.translation
                }.onEnded { value in
                    offset.height += value.translation.height
                    offset.width += value.translation.width
                }
        }

        var body: some View {
            
                    
            VStack {
                
                GeometryReader{ geometry in
                    
                    Image(uiImage: uiimage!)
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(self.scale * scaleState)
                            .offset(x: offset.width + offsetState.width, y: offset.height + offsetState.height)
//                            .gesture(SimultaneousGesture(DragGesture()
//                                .updating($offsetState) { currentState, gestureState, _ in
//                                    gestureState = currentState.translation
//                                }.onEnded { value in
//
//
//                                    if(offset.height + value.translation.height < geometry.frame(in: .global).maxY){
//                                        offset.height = geometry.frame(in: .global).minY
//                                    }
//                                    else if(offset.height + value.translation.height > geometry.frame(in: .global).minY){
//                                        offset.height = geometry.frame(in: .global).minY
//                                    }
//                                    else{
//                                        offset.height += value.translation.height
//                                    }
//
//
//                                    if(offset.width + value.translation.width * self.scale < geometry.frame(in: .global).maxX * self.scale){
//                                        offset.width = geometry.frame(in: .global).minX * self.scale
//                                    }
//                                    else if(offset.width + value.translation.width > geometry.frame(in: .global).minX){
//                                        offset.width = geometry.frame(in: .global).minX
//                                    }
//                                    else{
//                                        offset.width += value.translation.width * self.scale
//
//                                }, magnification))
                            .gesture(SimultaneousGesture(magnification, dragGesture))
                    
                }
                
                
                Text("Hello")
            }
                    
                    
                    
    
        }
}

struct TryingOut2_Previews: PreviewProvider {
    static var previews: some View {
        TryingOut2()
    }
}
