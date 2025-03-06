//
//  Result.swift
//  NanoChallenge1
//
//  Created by Aqilla Shahbani Mahazoya on 26/04/24.
//
import SwiftUI


struct Result: View {
    @State private var isFinishButtonPressed = false
    @State private var showAlert = false
    
    @Binding var jumlahBoard: String
    @Binding var awalInput: String
    @Binding var homeTeamInput: String
    @Binding var visitorTeamInput: String
    @Binding var tinggiBoard: Int
    @Binding var data: [[String]]
    
    init(jumlahBoard: Binding<String>, awalInput: Binding<String>,  homeTeamInput: Binding<String>, visitorTeamInput: Binding<String>, tinggiBoard: Binding<Int>, data: Binding<[[String]]>) {
        self._jumlahBoard = jumlahBoard
        self._awalInput = awalInput
        self._homeTeamInput = homeTeamInput
        self._visitorTeamInput = visitorTeamInput
        self._tinggiBoard = tinggiBoard
        self._data = data
    }
    
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
                        Text("HOME TEAM    : \(homeTeamInput)\n\nVISITOR TEAM : \(visitorTeamInput)\n\nBOARDS           : \(jumlahBoard)\n")
                            .font(Font.custom("SF Pro Text", size: 15))
                            .foregroundColor(Color(red: 0.06, green: 0.05, blue: 0.04))
                            .position(x: 90, y: 60)
                        
//                        Text("\(homeTeamInput)\n\n\(visitorTeamInput)\n\n\(jumlahBoard)")
//                            .font(Font.custom("SF Pro Text", size: 15))
//                            .foregroundColor(Color(red: 0.06, green: 0.05, blue: 0.04))
//                            .position(x: -50, y: 50)
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
                        .frame(width: 387, height: 1)
                        .background(.black)
                    
                    HStack(spacing: 21){
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                        
                        
                        Text("  ")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .foregroundColor(.black)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                        
                        Text("SCORE")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .foregroundColor(.black)
                            .frame(width: 55, alignment: .topLeading)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                        
                        Text("IMP\nHT")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 27, alignment: .top)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                        
                        Text("IMP\nVT")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 27, alignment: .top)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                        
                        Text("SCORE")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(.black)
                            .frame(width: 55, alignment: .topTrailing)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                        
                    }
                    
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 387, height: 1)
                            .background(.black)
                    
                    
                    ForEach(Int(awalInput)!...(tinggiBoard - 2), id: \.self) { index in
                        VStack(spacing: 0) {
                            
                            HStack(spacing: 21) {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 1, height: 50)
                                    .background(.black)
                                
                                Text("\(index)")
                                    .font(Font.custom("SF Pro Text", size: 13))
                                    .foregroundColor(.black)
                                
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 1, height: 50)
                                    .background(.black)
                                
                                Text("\(self.data[index][3])")
                                    .font(Font.custom("SF Pro Text", size: 13))
                                    .foregroundColor(.black)
                                    .frame(width: 55, alignment: .topLeading)
                                
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 1, height: 50)
                                    .background(.black)
                                
                                Text("\(self.data[index][7])")
                                    .font(Font.custom("SF Pro Text", size: 13))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .frame(width: 27, alignment: .top)
                                
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 1, height: 50)
                                    .background(.black)
                                
                                Text("\(self.data[index][6])")
                                    .font(Font.custom("SF Pro Text", size: 13))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .frame(width: 27, alignment: .top)
                                
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 1, height: 50)
                                    .background(.black)
                                
                                Text("\(self.data[index][4])")
                                    .font(Font.custom("SF Pro Text", size: 13))
                                    .multilineTextAlignment(.trailing)
                                    .foregroundColor(.black)
                                    .frame(width: 55, alignment: .topTrailing)
                                
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 1, height: 50)
                                    .background(.black)
                            }
                        }
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 387, height: 1)
                            .background(.black)
                    }
                    
                    HStack(spacing: 5){
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: 7, y: 25)
                        
                        Text("TOTAL")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .foregroundColor(.black)
                            .frame(width: 100, alignment: .topLeading)
                            .position(x: 100, y: 25)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: 54, y: 25)
                        
                        Text("\(self.data[0][9])")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 27, alignment: .top)
                            .position(x: 40, y: 25)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: 22.5, y: 25)
                        
                        Text("\(self.data[0][8])")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 27, alignment: .top)
                            .position(x: 5, y: 25)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: -9, y: 25)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: 38.5, y: 25)
                        
                    }
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 387, height: 1)
                        .background(.black)
                    
                    
                    Spacer()
                    Spacer()
                    
                    HStack(spacing: 60) {
                        Text("      ")
                            .font(Font.custom("SF Pro Text", size: 15).weight(.semibold))
                            .foregroundColor(.black)
                        
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
                        
                        Text("\(self.data[0][9])")
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
                        
                        Text("\(self.data[0][8])")
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
                        
                        Text("\(self.data[1][9])")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 75, alignment: .top)
                            .position(x: 0, y: 25)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 50)
                            .background(.black)
                            .position(x: 13.5, y: 25)
                        
                        Text("\(self.data[1][8])")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 75, alignment: .top)
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
                                    showAlert = true
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
                                .alert("Are you sure you want to finish the table?", isPresented: $showAlert) {
                                    Button("Cancel", role: .cancel) { }
                                    Button("Yes", role: .destructive) {
                                        isFinishButtonPressed = true
                                    }
                                }
                    
                    
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
                    destination: ContentView().navigationBarBackButtonHidden(true), // Ganti dengan halaman tujuan yang tepat
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
