//
//  Result.swift
//  NanoChallenge1
//
//  Created by Aqilla Shahbani Mahazoya on 26/04/24.
//
import SwiftUI


struct ResultOpen: View {
    @State private var isFinishButtonPressed = false
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(spacing: 0) {
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    Text("SUMMARY")
                    Spacer()
                    Spacer()
                        .font(Font.custom("SF Pro Text", size: 20).weight(.semibold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                    
                    HStack(spacing: 20) {
                        Text("HOME TEAM    : \n\nVISITOR TEAM : \n\nBOARDS           :\n")
                            .font(Font.custom("SF Pro Text", size: 15))
                            .foregroundColor(Color(red: 0.06, green: 0.05, blue: 0.04))
                            .position(x: 90, y: 60)
                        
                        Text("ITS BLUE\n\nITS YELLOW\n\n8")
                            .font(Font.custom("SF Pro Text", size: 15))
                            .foregroundColor(Color(red: 0.06, green: 0.05, blue: 0.04))
                            .position(x: 10, y: 50)
                    }
                    Spacer()
                    Spacer()
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 400, height: 1)
                        .background(Color(red: 0.84, green: 0.8, blue: 0.76))
                    
                    Spacer()
                    Spacer()
                    Text("RESULT")
                        .font(Font.custom("SF Pro Text", size: 17).weight(.semibold))
                        .foregroundColor(.black)
                    
                    Spacer()
                    Spacer()
                    
                    HStack(spacing: 120) {
                        Text("OPEN TABLE")
                            .font(Font.custom("SF Pro Text", size: 15).weight(.semibold))
                            .foregroundColor(.black)
                        
                        Text("CLOSE TABLE")
                            .font(Font.custom("SF Pro Text", size: 15).weight(.semibold))
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    Spacer()
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 381.99997, height: 1)
                        .background(.black)
                    
                    HStack(spacing: 5){
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: 10, y: 25)
                        
                        
                        Text("  ")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .foregroundColor(.black)
                            .position(x: -7, y: 25)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: -20, y: 25)
                        
                        Text("KONTRAK")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .foregroundColor(.black)
                            .frame(width: 100, alignment: .topLeading)
                            .position(x: 18, y: 25)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: 20, y: 25)
                        
                        Text("SCORE")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .foregroundColor(.black)
                            .frame(width: 55, alignment: .topLeading)
                            .position(x: 25, y: 25)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: 20, y: 25)
                        
                        Text("IMP\nHT")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 27, alignment: .top)
                            .position(x: 10, y: 25)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: 0, y: 25)
                        
                        Text("IMP\nVT")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 27, alignment: .top)
                            .position(x: -10, y: 25)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: -20, y: 25)
                        
                        Text("SCORE")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(.black)
                            .frame(width: 55, alignment: .topTrailing)
                            .position(x: -25, y: 25)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: -20, y: 25)
                        
                        Text("KONTRAK")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .foregroundColor(.black)
                            .frame(width: 100, alignment: .topLeading)
                            .position(x: 15, y: 25)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: 12.5, y: 25)
                    }
                    
                    
                    ForEach(0..<8) { index in
                        VStack(spacing: 0) {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 381.99997, height: 1)
                                .background(.black)
                            
                            HStack(spacing: 5) {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 1, height: 50)
                                    .background(.black)
                                    .position(x: 10, y: 25)
                                
                                Text("\(index + 1)")
                                    .font(Font.custom("SF Pro Text", size: 13))
                                    .foregroundColor(.black)
                                    .position(x: -7, y: 25)
                                
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 1, height: 50)
                                    .background(.black)
                                    .position(x: -20, y: 25)
                                
                                Text("7NTXX N - 13")
                                    .font(Font.custom("SF Pro Text", size: 13))
                                    .foregroundColor(.black)
                                    .frame(width: 100, alignment: .topLeading)
                                    .position(x: 10, y: 25)
                                
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 1, height: 50)
                                    .background(.black)
                                    .position(x: 20, y: 25)
                                
                                Text("1300")
                                    .font(Font.custom("SF Pro Text", size: 13))
                                    .foregroundColor(.black)
                                    .frame(width: 55, alignment: .topLeading)
                                    .position(x: 25, y: 25)
                                
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 1, height: 50)
                                    .background(.black)
                                    .position(x: 20, y: 25)
                                
                                Text("20")
                                    .font(Font.custom("SF Pro Text", size: 13))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .frame(width: 27, alignment: .top)
                                    .position(x: 10, y: 25)
                                
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 1, height: 50)
                                    .background(.black)
                                    .position(x: 0, y: 25)
                                
                                Text("21")
                                    .font(Font.custom("SF Pro Text", size: 13))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .frame(width: 27, alignment: .top)
                                    .position(x: -10, y: 25)
                                
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 1, height: 50)
                                    .background(.black)
                                    .position(x: -20, y: 25)
                                
                                Text("1500")
                                    .font(Font.custom("SF Pro Text", size: 13))
                                    .multilineTextAlignment(.trailing)
                                    .foregroundColor(.black)
                                    .frame(width: 55, alignment: .topTrailing)
                                    .position(x: -25, y: 25)
                                
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 1, height: 50)
                                    .background(.black)
                                    .position(x: -20, y: 25)
                                
                                Text("7NTXX N - 13")
                                    .font(Font.custom("SF Pro Text", size: 13))
                                    .foregroundColor(.black)
                                    .frame(width: 100, alignment: .topLeading)
                                    .position(x: 7, y: 25)
                                
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 1, height: 50)
                                    .background(.black)
                                    .position(x: 12.5, y: 25)
                            }
                        }
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 381.99997, height: 1)
                            .background(.black)
                    }
                    HStack(spacing: 5){
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: 10, y: 25)
                        
                        Text("TOTAL")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .foregroundColor(.black)
                            .frame(width: 100, alignment: .topLeading)
                            .position(x: 120, y: 25)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: 80.9, y: 25)
                        
                        Text("50")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 27, alignment: .top)
                            .position(x: 45, y: 25)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: 13.5, y: 25)
                        
                        Text("60")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 27, alignment: .top)
                            .position(x: -20, y: 25)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: -54, y: 25)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: 36, y: 25)
                        
                    }
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 381.99997, height: 1)
                        .background(.black)
                    
                    
                    Spacer()
                    Spacer()
                    
                    HStack(spacing: 120) {
                        Text("HOME TEAM")
                            .font(Font.custom("SF Pro Text", size: 15).weight(.semibold))
                            .foregroundColor(.black)
                        
                        Text("VISITOR TEAM")
                            .font(Font.custom("SF Pro Text", size: 15).weight(.semibold))
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    Spacer()
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 381.99997, height: 1)
                        .background(.black)
                    HStack(spacing: 5){
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: 10, y: 25)
                        
                        Text("IMP")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .foregroundColor(.black)
                            .frame(width: 100, alignment: .topLeading)
                            .position(x: 30, y: 25)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: -20, y: 25)
                        
                        Text("50")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 27, alignment: .top)
                            .position(x: 0, y: 25)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: 13.5, y: 25)
                        
                        Text("60")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 27, alignment: .top)
                            .position(x: 30, y: 25)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: 43, y: 25)
                        
                    }
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 381.99997, height: 1)
                        .background(.black)
                    
                    HStack(spacing: 5){
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: 10, y: 25)
                        
                        Text("VP")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .foregroundColor(.black)
                            .frame(width: 100, alignment: .topLeading)
                            .position(x: 30, y: 25)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: -20, y: 25)
                        
                        Text("50")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 27, alignment: .top)
                            .position(x: 0, y: 25)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: 13.5, y: 25)
                        
                        Text("60")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 27, alignment: .top)
                            .position(x: 30, y: 25)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: 43, y: 25)
                        
                    }
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 381.99997, height: 1)
                        .background(.black)
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    Button(action: {
                        isFinishButtonPressed = true
                    }) {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(red: 0.38, green: 0.28, blue: 0.22))
                            .frame(width: 307, height: 58)
                            .overlay(
                                Text("FINISH")
                                    .font(
                                        Font.custom("SF Pro Text", size: 15)
                                            .weight(.semibold)
                                    )
                                    .foregroundColor(.white)
                            )
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    }
                    .padding()
                    
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
            }
            .frame(width: 390, height: 844)
            .background(Color(red: 0.96, green: 0.95, blue: 0.94))
            .background(
                NavigationLink(
                    destination: ContentView(conn4VM: Conn4VM()   ).navigationBarBackButtonHidden(true), // Ganti dengan halaman tujuan yang tepat
                    isActive: $isFinishButtonPressed,
                    label: {
                        EmptyView()
                    })
                .isDetailLink(false)
                .hidden()
            )
        }
    }
}

struct ResultOpen_Previews: PreviewProvider {
    static var previews: some View {
        ResultOpen()
    }
}
