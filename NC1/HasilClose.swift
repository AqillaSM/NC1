//
//  HasilClose.swift
//  NC1
//
//  Created by Aqilla Shahbani Mahazoya on 05/05/24.
//

import SwiftUI

struct HasilClose: View {
    @State private var isActionSheetPresented = false
    //    @State private var jumlahBoard: String = "8"
    //    @State private var awalInput: String = "1"
    @State private var isFinishButtonPressed = false
    @Binding var jumlahBoard: String
    @Binding var awalInput: String
    @Binding var tinggiBoard: Int
    @Binding var data: [[String]]
    
    init(jumlahBoard: Binding<String>, awalInput: Binding<String>,  tinggiBoard: Binding<Int>, data: Binding<[[String]]>) {
            self._jumlahBoard = jumlahBoard
            self._awalInput = awalInput
            self._tinggiBoard = tinggiBoard
            self._data = data
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Navigation/Bold
                    
                    Spacer()
                    Spacer()
                    Text("COMPARE WITH OPEN TABLE")
                        .font(
                            Font.custom("SF Pro Text", size: 20)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                    
                    HStack(spacing: 40) {
                        Text("BOARD")
                            .font(Font.custom("SF Pro Text", size: 15))
                            .foregroundColor(.black)
                            .frame(width: 60)
                            .position(x: 80, y: 10)
                        Text("SCORE")
                            .font(Font.custom("SF Pro Text", size: 15))
                            .foregroundColor(.black)
                            .frame(width: 60)
                            .position(x: -50, y: 10)
                    }
                    
                    ForEach(Int(awalInput)!...(tinggiBoard - 2), id: \.self) { index in
                        HStack(spacing: 40) {
                            Rectangle()
                                .foregroundColor(Color(red: 0.38, green: 0.28, blue: 0.22))
                                .frame(width: 50, height: 50)
                                .cornerRadius(5)
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                .overlay(
                                    Text("\(index)")
                                        .font(Font.custom("SF Pro Text", size: 20))
                                        .foregroundColor(.white)
                                )
                                .frame(width: 50)
                                .position(x: 80, y: 10)
                            
                            Text("\(self.data[index][4])")
                                .font(Font.custom("SF Pro Text", size: 20))
                                .foregroundColor(.black)
                                .frame(width: 120)
                                .position(x: -50, y: 10)
                        }
                    }
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 186, height: 58)
                        .background(Color(red: 0.38, green: 0.28, blue: 0.22))
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .inset(by: 0.5)
                                .stroke(Color(red: 0.89, green: 0.84, blue: 0.79), lineWidth: 1)
                        )
                        .overlay(
                            Text("END TABLE")
                                .font(
                                    Font.custom("SF Pro Text", size: 17)
                                        .weight(.semibold)
                                )
                                .foregroundColor(.white)
                        )
                        .onTapGesture{
                            isFinishButtonPressed = true
                        }
                    
                    
                    Spacer()
                    Spacer()
                }
            }
            .frame(width: 390, height: 844)
            .background(Color(red: 0.96, green: 0.95, blue: 0.94))
            .background(
                NavigationLink(
                    destination: ContentView(conn4VM: Conn4VM()).navigationBarBackButtonHidden(true), // Ganti dengan halaman tujuan yang tepat
                    isActive: $isFinishButtonPressed,
                    label: {
                        EmptyView()
                    })
                .isDetailLink(false)
                .hidden()
            )
            .actionSheet(isPresented: $isActionSheetPresented) {
                ActionSheet(
                    title: Text("End Table"),
                    message: Text("Are you sure you want to end the table?"),
                    buttons: [
                        .destructive(Text("End Table")) {
                            isFinishButtonPressed = true
                        },
                        .cancel()
                    ]
                )
            }
        }
    }
}
