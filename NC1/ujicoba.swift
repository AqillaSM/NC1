////
////  ujicoba.swift
////  NC1
////
////  Created by Aqilla Shahbani Mahazoya on 05/05/24.
////
//
//import SwiftUI
//
//struct ujicoba: View {
//    @State private var awalInput: Int = 1
//    @State private var tinggiBoard: Int = 5
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                VStack(spacing: 20) {
//                    // Navigation/Bold
//
//                    Spacer()
//                    Spacer()
//                    Text("COMPARE WITH CLOSE TABLE")
//                        .font(
//                            Font.custom("SF Pro Text", size: 20)
//                                .weight(.semibold)
//                        )
//                        .multilineTextAlignment(.center)
//                        .foregroundColor(.black)
//
//                    HStack(spacing: 40) {
//                        Text("BOARD")
//                            .font(Font.custom("SF Pro Text", size: 15))
//                            .foregroundColor(.black)
//                            .frame(width: 60)
//                            .position(x: 80, y: 10)
//                        Text("SCORE")
//                            .font(Font.custom("SF Pro Text", size: 15))
//                            .foregroundColor(.black)
//                            .frame(width: 60)
//                            .position(x: -50, y: 10)
//                    }
//                    Spacer()
//
//                    ForEach(awalInput...(tinggiBoard - 2), id: \.self) { index in
//                        HStack(spacing: 10) {
//                            Rectangle()
//                                .foregroundColor(Color(red: 0.38, green: 0.28, blue: 0.22))
//                                .frame(width: 50, height: 50)
//                                .cornerRadius(5)
//                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
//                                .overlay(
//                                    Text("\(index)")
//                                        .font(Font.custom("SF Pro Text", size: 20))
//                                        .foregroundColor(.white)
//                                )
//                                .frame(width: 50)
//                                .position(x: 80, y: 10)
//
//                            Text("halooo")
//                                .font(Font.custom("SF Pro Text", size: 20))
//                                .foregroundColor(.black)
//                                .frame(width: 120)
//                                .position(x: -50, y: 10)
//                        }
//                    }
//
//                    Rectangle()
//                        .foregroundColor(.clear)
//                        .frame(width: 186, height: 58)
//                        .background(Color(red: 0.38, green: 0.28, blue: 0.22))
//                        .cornerRadius(10)
//                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 10)
//                                .inset(by: 0.5)
//                                .stroke(Color(red: 0.89, green: 0.84, blue: 0.79), lineWidth: 1)
//                        )
//                        .overlay(
//                            Text("END TABLE")
//                                .font(
//                                    Font.custom("SF Pro Text", size: 17)
//                                        .weight(.semibold)
//                                )
//                                .foregroundColor(.white)
//                        )
//
//
//                    Spacer()
//                    Spacer()
//                }
//            }
//        }
//    }
//
//}
//
//#Preview {
//    ujicoba()
//}
//
