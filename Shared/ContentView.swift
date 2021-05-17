//
//  ContentView.swift
//  Shared
//
//  Created by Martina Di Fuccia on 13/03/21.
//

import SwiftUI

struct ContentView: View {
    
//    Circle actions
    @State private var drawRing = 1/99
    @State private var showCircle = 0
    @State private var circleInnerBorder = 35
    @State private var circleSize = 0
//    Check Mark
    @State private var showCheckMark = -60
    @State private var rotateCheckMark = 30
// Scale and opacity animations
    @State private var splash = 0.0
    @State private var splashTransparency = 0.5
//    plus
    @State private var showPlus = 100
    
    var body: some View {
        
         ZStack{
//            Plus
            Image(systemName: "plus")
                .font(.system(size: 60))
                .foregroundColor(Color(.systemGray2))
            
            Image(systemName: "plus")
                .font(.system(size: 80))
                .foregroundColor(Color(.systemTeal))
                .clipShape(Rectangle().offset(y: CGFloat(showPlus)))
                .animation(Animation.easeInOut(duration: 0.1))
            
// Inactive Circle
             Circle()
                .stroke(style:StrokeStyle(lineWidth: 4, lineCap:.round, lineJoin: .round))
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(Color(.systemGray2))
            
            
// Active circle
            Circle()
                .trim(from: 0, to: CGFloat(drawRing))
                .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .rotationEffect(.degrees(-90))
                .foregroundColor(Color(.systemTeal))
                .animation(Animation.easeInOut(duration: 0.8).delay(0))
            
            Circle()
                .strokeBorder(lineWidth:  CGFloat(circleInnerBorder))
                .animation(Animation.easeInOut(duration: 0.5).delay(0.1))
                .frame(width: 100, height: 100)
                .foregroundColor(Color(.systemTeal))
                .scaleEffect(CGFloat(circleSize))
                .animation(Animation.easeInOut(duration: 0.8))
            
//  Full circle
            Circle()
                .frame(width: 85, height: 85, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color(.systemTeal))
                .scaleEffect(CGFloat(showCircle))
                .animation(Animation.interpolatingSpring(stiffness: 170, damping: 15).delay(1))
            
            
            
//  Checkmark
            Image(systemName: "checkmark")
                .font(.system(size: 50))
                .rotationEffect(.degrees(Double(rotateCheckMark)))
                .clipShape(Rectangle().offset(x: CGFloat(showCheckMark)))
                .animation(Animation.interpolatingSpring(stiffness: 170, damping: 15).delay(1.5))
            
//   Effects
            Image("splash")
                .frame(width: 10, height: 10)
                .opacity(Double(splashTransparency))
                .animation(Animation.easeInOut(duration: 0.5).delay(0.25))
                .scaleEffect(CGFloat(splash))
                .animation(Animation.easeInOut(duration: 0.5))
            
            // Rotated splash
            Image("splash")
                .rotationEffect(.degrees(-90))
                .opacity(Double(splashTransparency))
                .animation(Animation.easeInOut(duration: 0.5).delay(0.2))
                .scaleEffect(CGFloat(splash))
                .animation(Animation.easeOut(duration: 0.5))
            
            
            
//    Text
                Text("Tap to add!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .position(x:200, y: 270)
            
                }
         .onTapGesture {
             
// Final animation states
            
             drawRing = 1
             showCircle = 1
             rotateCheckMark = 0
             showCheckMark = 0
             splash = 2.5
             splashTransparency = 0.0
             showPlus = 0
             circleSize = 1
             circleInnerBorder = 0
         }
       }
    
    }


struct ContntView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
