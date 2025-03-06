//
//  Close-IsiKontrak.swift
//  NanoChallenge1
//
//  Created by Aqilla Shahbani Mahazoya on 26/04/24.
//

import SwiftUI

struct Close_IsiKontrak: View {
    @State private var isActionSheetPresented = false
//    @State private var jumlahBoard: String = "8"
//    @State private var awalInput: String = "1"
    @Binding var jumlahBoard: String
    @Binding var awalInput: String
    @Binding var tinggiBoard: Int
    @Binding var data: [[String]]
    @State private var isNavigationActive = false
    
    init(jumlahBoard: Binding<String>, awalInput: Binding<String>, tinggiBoard: Binding<Int>, data: Binding<[[String]]>) {
            self._jumlahBoard = jumlahBoard
            self._awalInput = awalInput
            self._tinggiBoard = tinggiBoard
            self._data = data
    }
    
    @State private var buttonNavbarKanan = "a"
    @State private var Kontrak: String = ""
    @State private var Score: String = ""
    @State private var AngkaKontrak: String = ""
    @State private var WarnaKontrak: String = ""
    @State private var Dbl: String = ""
    @State private var RDbl: String = ""
    @State private var xButtonTapCount = 0
    @State private var xxButtonTapCount = 0
    @State private var hitungscore: Int = 0
    @State private var KontrakDisplay: String = ""
    @State private var NomorBoard: Int = 0
    @State private  var Player: String = ""
    
    
    
    
    @State private var Operator: String = "+"
    @State private var Angka: String = "0"
    @State private var isDoubleSelected = false
    @State private var isRedoubleSelected = false
    @State private var isVulSelected = false
    
    
    @State private var isIsiKontrakViewPresented = true
    @State private var isCalculator1ViewPresented = false
    @State private var isCalculator2ViewPresented = false
    
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                if isIsiKontrakViewPresented
                {
                    IsiKontrak()
                }
                else if isCalculator1ViewPresented {
                    Kalkulator1()
                }
                else
                {
                    Kalkulator2()
                }
            }
            .frame(width: 390, height: 844)
            .background(Color(red: 0.96, green: 0.95, blue: 0.94))
            .background(
                NavigationLink(
                    destination: HasilClose(jumlahBoard: $jumlahBoard, awalInput: $awalInput, tinggiBoard: $tinggiBoard, data: $data).navigationBarBackButtonHidden(true), // Ganti dengan halaman tujuan yang tepat
                    isActive: $isNavigationActive,
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
                        .default(Text("END TABLE")) {
                            isActionSheetPresented = false // Tutup action sheet
                            isNavigationActive = true
                        },
                        .cancel()
                    ]
                )
            }
        }
    }

    
    func IsiKontrak() -> some View {
            VStack(spacing: 20) {
                // Navigation/Bold
                
                Spacer()
                Spacer()
                Text("CLOSE TABLE")
                    .font(
                        Font.custom("SF Pro Text", size: 20)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                
                HStack(spacing: 20) {
                    Text("BOARD")
                        .font(Font.custom("SF Pro Text", size: 15))
                        .foregroundColor(.black)
                        .frame(width: 60)
                    Text("KONTRAK")
                        .font(Font.custom("SF Pro Text", size: 15))
                        .foregroundColor(.black)
                        .frame(width: 120)
                    Text("BY")
                        .font(Font.custom("SF Pro Text", size: 15))
                        .foregroundColor(.black)
                        .frame(width: 30)
                    Text("SCORE")
                        .font(Font.custom("SF Pro Text", size: 15))
                        .foregroundColor(.black)
                        .frame(width: 60)
                }
                
                ForEach(Int(awalInput)!...(tinggiBoard - 2), id: \.self) { index in
                    HStack(spacing: 20) {
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
                            .onTapGesture{
                                Kontrak = ""
                                Score = ""
                                KontrakDisplay = ""
                                Player = ""
                                NomorBoard = index
                                isIsiKontrakViewPresented = false
                                isCalculator1ViewPresented = true
                                isCalculator2ViewPresented = false
                            }

                        Text("\(self.data[index][0])")
                            .font(Font.custom("SF Pro Text", size: 20))
                            .foregroundColor(.black)
                            .frame(width: 120)
                        Text("\(self.data[index][1])")
                            .font(Font.custom("SF Pro Text", size: 20))
                            .foregroundColor(.black)
                            .frame(width: 30)
                        Text("\(self.data[index][2])")
                            .font(Font.custom("SF Pro Text", size: 20))
                            .foregroundColor(.black)
                            .frame(width: 50)
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
                    .onTapGesture {
                        for index in Int(awalInput)!...(tinggiBoard - 2)
                        {
                            if self.data[index][1] == "VT"
                            {
                                if self.data[index][0].contains("-")
                                {
                                    self.data[index][4] = "-" + self.data[index][2]
                                }
                                else
                                {
                                    self.data[index][4] = self.data[index][2]
                                }
                            }
                            else {
                                if self.data[index][0].contains("-")
                                {
                                    self.data[index][4] = self.data[index][2]
                                }
                                else
                                {
                                    self.data[index][4] = "-" + self.data[index][2]
                                }
                            }
                        }
                        isActionSheetPresented = true
                    }
                
                Spacer()
                Spacer()
            }
        }

    
    
    
    
    
    func Kalkulator1() -> some View {
            ZStack {
                HStack(alignment: .center, spacing: 5) {
                    Image("Light")
                            .frame(width: 11.97656, height: 20.78906)
                        
                        Text("Back")
                            .font(Font.custom("SF Pro Text", size: 20))
                            .foregroundColor(Color(red: 0.38, green: 0.28, blue: 0.22))
                }
                .padding(.horizontal, 9)
                .padding(.vertical, 10)
                .position(x: 40, y: 50)
                .onTapGesture{
                    isIsiKontrakViewPresented = true
                    isCalculator1ViewPresented = false
                    isCalculator2ViewPresented = false
                }
                
                
                Text("BOARD " + "\((NomorBoard))")
                    .font(
                        Font.custom("SF Pro Text", size: 20)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .position(x: UIScreen.main.bounds.width / 2, y: 50)
                
                HStack(alignment: .center, spacing: 5) {
                    if buttonNavbarKanan == "Submit"
                    {
                        Text(buttonNavbarKanan)
                            .font(Font.custom("SF Pro Text", size: 20))
                            .foregroundColor(Color(red: 0.38, green: 0.28, blue: 0.22))
                            .onTapGesture{
                                isIsiKontrakViewPresented = true
                                isCalculator1ViewPresented = false
                                isCalculator2ViewPresented = false
                            }
                        
                        Image("RIGHT")
                            .frame(width: 11.97656, height: 20.78906)
                            .onTapGesture{
                                isIsiKontrakViewPresented = true
                                isCalculator1ViewPresented = false
                                isCalculator2ViewPresented = false
                            }
                    }
                    else if (buttonNavbarKanan == "Next" && (AngkaKontrak != "" && WarnaKontrak != "" && Player != "")) {
                        Text(buttonNavbarKanan)
                            .font(Font.custom("SF Pro Text", size: 20))
                            .foregroundColor(Color(red: 0.38, green: 0.28, blue: 0.22))
                            .onTapGesture{
                                isIsiKontrakViewPresented = false
                                isCalculator1ViewPresented = false
                                isCalculator2ViewPresented = true
                            }
                        
                        Image("RIGHT")
                            .frame(width: 11.97656, height: 20.78906)
                            .onTapGesture{
                                isIsiKontrakViewPresented = false
                                isCalculator1ViewPresented = false
                                isCalculator2ViewPresented = true
                            }
                        
                    }

                }
                .padding(.horizontal, 9)
                .padding(.vertical, 10)
                .position(x: 350, y: 50)
                
                Text(Player)
                    .font(
                        Font.custom("SF Pro Text", size: 20)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(.black)
                    .position(x: 330, y: 330)
                
                Text("=")
                    .font(
                        Font.custom("SF Pro Text", size: 20)
                            .weight(.semibold)
                    )
                    .foregroundColor(.black)
                    .position(x: 40, y: 400)
                
                Text(Kontrak)
                    .font(
                        Font.custom("SF Pro Text", size: 20)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(.black)
                    .position(x: 330, y: 400)
                
                rectangleWithText2(text: "NS", xPos: 110, yPos: 470, color: .black)
                rectangleWithText2(text: "TB", xPos: 275, yPos: 470, color: .black)
                rectangleWithText(text: "1", xPos: 70, yPos: 540, color: .black)
                rectangleWithText(text: "2", xPos: 150, yPos: 540, color: .black)
                rectangleWithText(text: "3", xPos: 230, yPos: 540, color: .black)
                rectangleWithText(text: "4", xPos: 315, yPos: 540, color: .black)
                rectangleWithText(text: "5", xPos: 70, yPos: 610, color: .black)
                rectangleWithText(text: "6", xPos: 150, yPos: 610, color: .black)
                rectangleWithText(text: "7", xPos: 230, yPos: 610, color: .black)
                rectangleWithText3(text: "NT", xPos: 315, yPos: 610, color: .black)
                rectangleWithImage(text: "club", xPos: 70, yPos: 680, color: .red)
                rectangleWithImage(text: "diamond", xPos: 150, yPos: 680, color: .red)
                rectangleWithImage(text: "heart", xPos: 230, yPos: 680, color: .red)
                rectangleWithImage(text: "spade", xPos: 315, yPos: 680, color: .red)
                rectangleWithText3(text: "X", xPos: 70, yPos: 750, color: .red)
                rectangleWithText3(text: "XX", xPos: 150, yPos: 750, color: .red)
                rectangleWithText2(text: "ALL PASS", xPos: 275, yPos: 750, color: .black)
                
            }
            .frame(width: 390, height: 844)
            .background(Color(red: 0.96, green: 0.95, blue: 0.94))
    }
    
    func rectangleWithText(text: String, xPos: CGFloat, yPos: CGFloat, color: Color) -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 68, height: 58)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(.black, lineWidth: 1)
                )
                .position(x: xPos, y: yPos)
            Text(text)
                .font(Font.custom("SF Pro Text", size: 20))
                .foregroundColor(color)
                .frame(width: 10, alignment: .topLeading)
                .position(x: xPos, y: yPos)
        }
        .onTapGesture {
            if text == "1" {
                AngkaKontrak = "1"
            }
            else if text == "2"
            {
                AngkaKontrak = "2"
            }
            else if text == "3"
            {
                AngkaKontrak = "3"
            }
            else if text == "4"
            {
                AngkaKontrak = "4"
            }
            else if text == "5"
            {
                AngkaKontrak = "5"
            }
            else if text == "6"
            {
                AngkaKontrak = "6"
            }
            else if text == "7"
            {
                AngkaKontrak = "7"
            }
            buttonNavbarKanan = "Next"
            Kontrak = AngkaKontrak + WarnaKontrak + RDbl + Dbl
        }
    }
    
    func rectangleWithText2(text: String, xPos: CGFloat, yPos: CGFloat, color: Color) -> some View {
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 156, height: 58)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 0.5)
                            .stroke(.black, lineWidth: 1)
                    )
                    .overlay (
                        Text(text)
                            .font(Font.custom("SF Pro Text", size: 20))
                            .foregroundColor(color)
                            .frame(width: 500, height: 58)
                    )
                    .position(x: xPos, y: yPos)
            }
            .onTapGesture {
                if text == "ALL PASS" {
                    buttonNavbarKanan = "Submit"
                    Player = "-"
                    hitungscore = 0
                    Kontrak = "ALL PAS"
                    KontrakDisplay = "ALL PAS"
                    WarnaKontrak = ""
                    AngkaKontrak = ""
                    xButtonTapCount = 0
                    xxButtonTapCount = 0
                    Dbl = ""
                    RDbl = ""
                    self.data[NomorBoard][0] = KontrakDisplay
                    self.data[NomorBoard][1] = Player
                    self.data[NomorBoard][2] = String(hitungscore)
                }
                else if text == "NS"
                {
                    Player = "NS"
                    if Kontrak == "ALL PAS"                    {
                        buttonNavbarKanan = "Submit"
                    }
                }
                else if text == "TB"
                {
                    Player = "TB"
                    if Kontrak == "ALL PAS"                    {
                        buttonNavbarKanan = "Submit"
                    }
                }
            }
        }
    
    func rectangleWithText3(text: String, xPos: CGFloat, yPos: CGFloat, color: Color) -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 68, height: 58)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(.black, lineWidth: 1)
                )
                .position(x: xPos, y: yPos)
            Text(text)
                .font(Font.custom("SF Pro Text", size: 20))
                .foregroundColor(color)
                .frame(width: 30, alignment: .center)
                .position(x: xPos, y: yPos)
        }
        .onTapGesture {
            if text == "NT" {
                WarnaKontrak = "NT"
            }
            else if text == "X"
            {
                if xButtonTapCount == 0
                {
                    Dbl = "X"
                    RDbl = ""
                }
                else if xButtonTapCount == 1
                {
                    RDbl = ""
                    Dbl = ""
                }
                xButtonTapCount += 1
                xButtonTapCount %= 2
                xxButtonTapCount = 0
            }
            else if text == "XX"
            {
                if xxButtonTapCount == 0
                {
                    Dbl = ""
                    RDbl = "XX"
                }
                else if xxButtonTapCount == 1
                {
                    Dbl = ""
                    RDbl = ""
                }
                xxButtonTapCount += 1
                xxButtonTapCount %= 2
                xButtonTapCount = 0
            }
            buttonNavbarKanan = "Next"
            Kontrak = AngkaKontrak + WarnaKontrak + RDbl + Dbl
        }
    }
    
    func rectangleWithImage(text: String, xPos: CGFloat, yPos: CGFloat, color: Color) -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 68, height: 58)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(.black, lineWidth: 1)
                )
                .position(x: xPos, y: yPos)
            Image(text)
              .font(Font.custom("SF Pro Text", size: 24))
              .multilineTextAlignment(.center)
              .foregroundColor(Color(red: 1, green: 0, blue: 0))
                .position(x: xPos, y: yPos)
        }
        .onTapGesture {
            if text == "club" {
                WarnaKontrak = "♣️"
            }
            else if text == "diamond"
            {
                WarnaKontrak = "♦️"
            }
            else if text == "heart"
            {
                WarnaKontrak = "♥️"
            }
            else if text == "spade"
            {
                WarnaKontrak = "♠️"
            }
            buttonNavbarKanan = "Next"
            Kontrak = AngkaKontrak + WarnaKontrak + RDbl + Dbl
        }
    }
    
    
    
    
    func Kalkulator2() -> some View {
        ZStack{
            HStack(alignment: .center, spacing: 5) {
                    Image("Light")
                        .frame(width: 11.97656, height: 20.78906)
                    
                    // Navigation / Default
                    Text("Back")
                        .font(Font.custom("SF Pro Text", size: 20))
                        .foregroundColor(Color(red: 0.38, green: 0.28, blue: 0.22))
            }
            .onTapGesture{
                hitungscore = 0
                Kontrak = ""
                KontrakDisplay = ""
                AngkaKontrak = ""
                Angka = ""
                WarnaKontrak = ""
                Dbl = ""
                RDbl = ""
                Player = ""
                xxButtonTapCount = 0
                xButtonTapCount = 0
                isIsiKontrakViewPresented = false
                isCalculator1ViewPresented = true
                isCalculator2ViewPresented = false
            }
            .padding(.horizontal, 9)
            .padding(.vertical, 10)
            .position(x: 40, y: 50)
            
            Text("BOARD " + "\((NomorBoard))")
                .font(
                    Font.custom("SF Pro Text", size: 20)
                        .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .position(x: UIScreen.main.bounds.width / 2, y: 50)
                .onAppear {
                    KontrakDisplay = Kontrak
                    hitungscore = 0
                }
            
            Text("\(hitungscore)")
                .font(
                    Font.custom("SF Pro Text", size: 20)
                        .weight(.semibold)
                )
                .multilineTextAlignment(.trailing)
                .foregroundColor(.black)
                .position(x: 330, y: 330)
            
            Text("=")
                .font(
                    Font.custom("SF Pro Text", size: 20)
                        .weight(.semibold)
                )
                .foregroundColor(.black)
                .position(x: 40, y: 400)
            
            Text(KontrakDisplay)
                .font(
                    Font.custom("SF Pro Text", size: 20)
                        .weight(.semibold)
                )
                .multilineTextAlignment(.trailing)
                .foregroundColor(.black)
                .position(x: 330, y: 400)
            
            
            rectangleWithText(text: "+", xPos: 70, yPos: 470)
            rectangleWithText(text: "-", xPos: 150, yPos: 470)
            rectangleWithText(text: "=", xPos: 230, yPos: 470)
            rectangleWithText(text: "DEL", xPos: 315, yPos: 470)
            
            rectangleWithText(text: "1", xPos: 70, yPos: 540)
            rectangleWithText(text: "2", xPos: 150, yPos: 540)
            rectangleWithText(text: "3", xPos: 230, yPos: 540)
            
            rectangleWithText(text: "4", xPos: 70, yPos: 610)
            rectangleWithText(text: "5", xPos: 150, yPos: 610)
            rectangleWithText(text: "6", xPos: 230, yPos: 610)
            
            rectangleWithText(text: "7", xPos: 70, yPos: 680)
            rectangleWithText(text: "8", xPos: 150, yPos: 680)
            rectangleWithText(text: "9", xPos: 230, yPos: 680)
            
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 68, height: 200)
              .cornerRadius(10)
              .overlay(
                RoundedRectangle(cornerRadius: 10)
                  .inset(by: 0.5)
                  .stroke(.black, lineWidth: 1)
              )
              .position(x: 315, y: 610)
            Text("0")
              .font(Font.custom("SF Pro Text", size: 20))
              .foregroundColor(.black)
              .frame(width: 10, height: 18, alignment: .topLeading)
              .position(x: 315, y: 610)
              .onTapGesture {
                  if Operator == "-" && Angka == "1" && (Kontrak.contains("7") || Kontrak.contains("6") || Kontrak.contains("5") || Kontrak.contains("4") )
                  {
                      Angka = Angka + "0"
                  }
                  else
                  {
                      Angka = "0"
                  }
                  KontrakDisplay = Kontrak + " " + Operator + " " + Angka
              }
            
            
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 307, height: 58)
                .background(Color(red: 0.38, green: 0.28, blue: 0.22))
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.89, green: 0.84, blue: 0.79), lineWidth: 1)
                )
                .overlay(
                    Text("SUBMIT")
                        .font(
                            Font.custom("SF Pro Text", size: 15)
                                .weight(.semibold)
                        )
                        .foregroundColor(.white)
                        .frame(width: 57, alignment: .topLeading)
                )
                .onTapGesture{
                    if Player == "NS"
                    {
                        Player = "VT"
                    }
                    else
                    {
                        Player = "HT"
                    }
                    
                    if KontrakDisplay.contains("+ 0")
                    {
                        KontrakDisplay = KontrakDisplay.replacingOccurrences(of: "+ 0", with: "=")
                    }
                    else if KontrakDisplay.contains("- 0")
                    {
                        KontrakDisplay = KontrakDisplay.replacingOccurrences(of: "- 0", with: "=")
                    }
                    else if KontrakDisplay.contains("= 0")
                    {
                        KontrakDisplay = KontrakDisplay.replacingOccurrences(of: "= 0", with: "=")
                    }
                    self.data[NomorBoard][0] = KontrakDisplay
                    self.data[NomorBoard][1] = Player
                    self.data[NomorBoard][2] = String(hitungscore)
//                    if Player == "VT"
//                    {
//                        if KontrakDisplay.contains("-")
//                        {
//                            self.data[NomorBoard][3] = "-" + String(hitungscore)
//                        }
//                        else {
//                            self.data[NomorBoard][3] = String(hitungscore)
//                        }
//                    }
//                    else {
//                        if KontrakDisplay.contains("-")
//                        {
//                            self.data[NomorBoard][3] = String(hitungscore)
//                        }
//                        else {
//                            self.data[NomorBoard][3] = "-" + String(hitungscore)
//                        }
//                    }
                    WarnaKontrak = ""
                    Kontrak = ""
                    isIsiKontrakViewPresented = true
                    isCalculator1ViewPresented = false
                    isCalculator2ViewPresented = false
                }
                .position(x: 195, y: 750)

        }
    }
        
    func rectangleWithText(text: String, xPos: CGFloat, yPos: CGFloat) -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 68, height: 58)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(.black, lineWidth: 1)
                )
                .position(x: xPos, y: yPos)
            Text(text)
                .font(Font.custom("SF Pro Text", size: 20))
                .foregroundColor(.black)
                .frame(width: 40, alignment: .center)
                .position(x: xPos, y: yPos)
        }
        .onTapGesture{
            KontrakDisplay = Kontrak
            AngkaKontrak = String(Kontrak.prefix(1))
                
                if text == "-"
                {
                    Operator = "-"
                }
                else if text == "+"
                {
                    Operator = "+"
                }
                else if text == "="
                {
                    Operator = "="
                    Angka = "0"
                }
                
                
                
                if text == "1"
                {
                    if Int(text)! + Int(AngkaKontrak)! > 7 && Operator == "+"
                    {
                        Angka = Angka
                    }
                    else if Operator == "-" && Angka == "1" && (Kontrak.contains("7") || Kontrak.contains("6") || Kontrak.contains("5")  )
                    {
                        Angka = Angka + text
                    }
                    else if Operator == "="
                    {
                        Angka = "0"
                    }
                    else
                    {
                        Angka = "1"
                    }
                }
                else if text == "2"
                {
                    if Int(text)! + Int(AngkaKontrak)! > 7 && Operator == "+"
                    {
                        Angka = Angka
                    }
                    else if Operator == "-" && Angka == "1" && (Kontrak.contains("7") || Kontrak.contains("6") )
                    {
                        Angka = Angka + text
                    }
                    else if Operator == "="
                    {
                        Angka = "0"
                    }
                    else
                    {
                        Angka = "2"
                    }
                }
                else if text == "3"
                {
                    if Int(text)! + Int(AngkaKontrak)! > 7 && Operator == "+"
                    {
                        Angka = Angka
                    }
                    else if Operator == "-" && Angka == "1" && (Kontrak.contains("7") )
                    {
                        Angka = Angka + text
                    }
                    else if Operator == "="
                    {
                        Angka = "0"
                    }
                    else
                    {
                        Angka = "3"
                    }
                }
                else if text == "4"
                {
                    if Int(text)! + Int(AngkaKontrak)! > 7 && Operator == "+"
                    {
                        Angka = Angka
                    }
                    else if Operator == "="
                    {
                        Angka = "0"
                    }
                    else{
                        Angka = "4"
                    }
                }
                else if text == "5"
                {
                    if Int(text)! + Int(AngkaKontrak)! > 7 && Operator == "+"
                    {
                        Angka = Angka
                    }
                    else if Operator == "="
                    {
                        Angka = "0"
                    }
                    else{
                        Angka = "5"
                    }
                }
                else if text == "6"
                {
                    if Int(text)! + Int(AngkaKontrak)! > 7 && Operator == "+"
                    {
                        Angka = Angka
                    }
                    else if Operator == "="
                    {
                        Angka = "0"
                    }
                    else{
                        Angka = "6"
                    }
                }
                else if text == "7"
                {
                    if Int(text)! + Int(AngkaKontrak)! > 7 && Operator == "+"
                    {
                        Angka = Angka
                    }
                    else if Operator == "="
                    {
                        Angka = "0"
                    }
                    else{
                        Angka = "7"
                    }
                }
                else if text == "8"
                {
                    if Int(text)! + Int(AngkaKontrak)! > 7  && Operator == "+"
                    {
                        Angka = Angka
                    }
                    else if Operator == "="
                    {
                        Angka = "0"
                    }
                    else{
                        Angka = "8"
                    }
                }
                else if text == "9"
                {
                    if Int(text)! + Int(AngkaKontrak)! > 7 && Operator == "+"
                    {
                        Angka = Angka
                    }
                    else if Operator == "="
                    {
                        Angka = "0"
                    }
                    else{
                        Angka = "9"
                    }
                }
                
                
                
                if text == "DEL"
                {
                    Angka = String(Angka.dropLast(1))
                    if Angka == ""
                    {
                        Angka = "0"
                    }
                }
                
                else if text == "="
                {
                    Operator = "="
                    Angka = "0"
                }
                
                KontrakDisplay = Kontrak + " " + Operator + " " + Angka
                
                if Kontrak.contains("X")
                {
                    isDoubleSelected = true
                    isRedoubleSelected = false
                }
                else if Kontrak.contains("XX")
                {
                    isRedoubleSelected = true
                    isDoubleSelected = false
                }
                else
                {
                    isDoubleSelected = false
                    isRedoubleSelected = false
                    
                }
                
                
                if Kontrak.contains("NT")
                {
                    WarnaKontrak = "NT"
                }
                else if Kontrak.contains("♣️")
                {
                    WarnaKontrak = "club"
                }
                else if Kontrak.contains("♦️")
                {
                    WarnaKontrak = "diamond"
                }
                else if Kontrak.contains("♥️")
                {
                    WarnaKontrak = "heart"
                }
                else
                {
                    WarnaKontrak = "spade"
                    
                }
                
            Calculate(Operator: Operator, angka: Angka, isDoubleSelected: isDoubleSelected, isRedoubleSelected: isRedoubleSelected, angkaKontrak: AngkaKontrak, warnaKontrak: WarnaKontrak, NomorBoard: NomorBoard)
        }
    }
    
    
    func Calculate(Operator: String, angka: String, isDoubleSelected: Bool, isRedoubleSelected: Bool, angkaKontrak: String, warnaKontrak: String, NomorBoard: Int) -> Int {
        
        isVulSelected = false
        
        if (NomorBoard % 16 == 4 || NomorBoard % 16 == 7 || NomorBoard % 16 == 10 || NomorBoard % 16 == 13)
        {
            isVulSelected = true
        }
        else if Player == "TB"
        {
         if (NomorBoard % 16 == 3 || NomorBoard % 16 == 6 || NomorBoard % 16 == 9 || NomorBoard % 16 == 0)
            {
             isVulSelected = true
            }
        }
        else if Player == "NS"
        {
            if (NomorBoard % 16 == 2 || NomorBoard % 16 == 5 || NomorBoard % 16 == 12 || NomorBoard % 16 == 15)
            {
                isVulSelected = true
            }
        }
        
        if (Operator == "-" && Angka != "0")
        {
            if isVulSelected == true
            {
                if isDoubleSelected == true
                {
                    hitungscore = 200 + ((Int(Angka)! - 1) * 300)
                }
                else if isRedoubleSelected == true
                {
                    hitungscore = 400 + ((Int(Angka)! - 1) * 600)

                }
                else
                {
                    hitungscore = Int(Angka)! * 100
                }
            }
            else
            {
                if isDoubleSelected == true
                {
                    hitungscore = 100 + ((Int(Angka)! - 1) * 200)
                }
                else if isRedoubleSelected == true
                {
                    hitungscore = 200 + ((Int(Angka)! - 1) * 400)
                }
                else
                {
                    hitungscore = Int(Angka)! * 50
                }
            }
        }
        else if (Operator == "+" && Angka != "0")
        {
            if WarnaKontrak == "spade" || WarnaKontrak == "heart"
            {
                if AngkaKontrak == "1" || AngkaKontrak == "2"  || AngkaKontrak == "3"
                {
                    if isDoubleSelected == true
                    {
                        if isVulSelected == true
                        {
                            hitungscore = 160 + ((Int(Angka)! + Int(AngkaKontrak)! - 1) * 200)
                        }
                        else
                        {
                            hitungscore = 160 + ((Int(Angka)! + Int(AngkaKontrak)! - 1) * 100)
                        }
                    }
                    else if isRedoubleSelected == true
                    {
                        if isVulSelected == true
                        {
                            hitungscore = 720 + ((Int(Angka)! + Int(AngkaKontrak)! - 1) * 400)
                        }
                        else
                        {
                            hitungscore = 520 + ((Int(Angka)! + Int(AngkaKontrak)! - 1) * 200)
                        }
                    }
                    else
                    {
                        hitungscore = 80 + ((Int(Angka)! + Int(AngkaKontrak)! - 1) * 30)
                    }
                }
                else if AngkaKontrak == "4" || AngkaKontrak == "5"
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 790 + ((Int(Angka)! + Int(AngkaKontrak)! - 4) * 200)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 1080 + ((Int(Angka)! + Int(AngkaKontrak)! - 4) * 400)
                        }
                        else
                        {
                            hitungscore = 620 + ((Int(Angka)! + Int(AngkaKontrak)! - 4) * 30)
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 590 + ((Int(Angka)! + Int(AngkaKontrak)! - 4) * 100)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 880 + ((Int(Angka)! + Int(AngkaKontrak)! - 4) * 200)
                        }
                        else
                        {
                            hitungscore = 420 + ((Int(Angka)! + Int(AngkaKontrak)! - 4) * 30)
                        }
                    }
                }
                else if AngkaKontrak == "6"
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1660 + ((Int(Angka)! + Int(AngkaKontrak)! - 6) * 200)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 2070 + ((Int(Angka)! + Int(AngkaKontrak)! - 6) * 400)
                        }
                        else
                        {
                            hitungscore = 1430 + ((Int(Angka)! + Int(AngkaKontrak)! - 6) * 30)
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1210 + ((Int(Angka)! + Int(AngkaKontrak)! - 1) * 100)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 1620 + ((Int(Angka)! + Int(AngkaKontrak)! - 1) * 200)
                        }
                        else
                        {
                            hitungscore = 980 + ((Int(Angka)! + Int(AngkaKontrak)! - 1) * 30)
                        }
                    }
                }
                else if AngkaKontrak == "7"
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 2470
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 2940
                        }
                        else
                        {
                            hitungscore = 2210
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1770
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 2240
                        }
                        else
                        {
                            hitungscore = 1510
                        }
                    }
                }
                
            }
            else if warnaKontrak == "diamond" || warnaKontrak == "club"
            {
                if angkaKontrak == "1" || angkaKontrak == "2"  || angkaKontrak == "3" || angkaKontrak == "4"
                {
                    if isVulSelected == true{
                        if isDoubleSelected == true
                        {
                            hitungscore = 140 + ((Int(Angka)! + Int(AngkaKontrak)! - 1) * 200)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 230 + ((Int(Angka)! + Int(AngkaKontrak)! - 1) * 400)
                        }
                        else
                        {
                            hitungscore = 70 + ((Int(Angka)! + Int(AngkaKontrak)! - 1) * 20)
                        }
                    }
                    else{
                        if isDoubleSelected == true
                        {
                            hitungscore = 140 + ((Int(Angka)! + Int(AngkaKontrak)! - 1) * 100)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 230 + ((Int(Angka)! + Int(AngkaKontrak)! - 1) * 200)
                        }
                        else
                        {
                            hitungscore = 70 + ((Int(Angka)! + Int(AngkaKontrak)! - 1) * 20)
                        }
                    }
                    
                }
                else if angkaKontrak == "5"
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 750 + ((Int(Angka)! + Int(AngkaKontrak)! - 5) * 200)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 1000 + ((Int(Angka)! + Int(AngkaKontrak)! - 5) * 400)
                        }
                        else
                        {
                            hitungscore = 600 + ((Int(Angka)! + Int(AngkaKontrak)! - 5) * 20)
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 550 + ((Int(Angka)! + Int(AngkaKontrak)! - 5) * 100)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 800 + ((Int(Angka)! + Int(AngkaKontrak)! - 5) * 200)
                        }
                        else
                        {
                            hitungscore = 400 + ((Int(Angka)! + Int(AngkaKontrak)! - 5) * 20)
                        }
                    }
                }
                else if angkaKontrak == "6"
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1540 + ((Int(Angka)! + Int(AngkaKontrak)! - 6) * 200)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 1830 + ((Int(Angka)! + Int(AngkaKontrak)! - 6) * 400)
                        }
                        else
                        {
                            hitungscore = 1370 + ((Int(Angka)! + Int(AngkaKontrak)! - 6) * 20)
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1090 + ((Int(Angka)! + Int(AngkaKontrak)! - 6) * 100)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 1380 + ((Int(Angka)! + Int(AngkaKontrak)! - 6) * 200)
                        }
                        else
                        {
                            hitungscore = 920 + ((Int(Angka)! + Int(AngkaKontrak)! - 6) * 20)
                        }
                    }
                }
                else if angkaKontrak == "7"
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 2330
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 2660
                        }
                        else
                        {
                            hitungscore = 2140
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1630
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 1960
                        }
                        else
                        {
                            hitungscore = 1440
                        }
                    }
                }
            }
            else
            {
                if angkaKontrak == "1" || angkaKontrak == "2"
                {
                    if isDoubleSelected == true
                    {
                        if isVulSelected == true
                        {
                            hitungscore = 180 + ((Int(Angka)! + Int(AngkaKontrak)! - 1) * 200)
                        }
                        else
                        {
                            hitungscore = 180 + ((Int(Angka)! + Int(AngkaKontrak)! - 1) * 100)
                        }
                        
                    }
                    else if isRedoubleSelected == true
                    {
                        if isVulSelected == true
                        {
                            hitungscore = 760 + ((Int(Angka)! + Int(AngkaKontrak)! - 1) * 400)
                        }
                        else
                        {
                            hitungscore = 560 + ((Int(Angka)! + Int(AngkaKontrak)! - 1) * 200)
                        }
                    }
                    else
                    {
                        hitungscore = 90 + ((Int(Angka)! + Int(AngkaKontrak)! - 1) * 30)
                    }
                }
                else if angkaKontrak == "4" || angkaKontrak == "5" || angkaKontrak == "3"
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 750 + ((Int(Angka)! + Int(AngkaKontrak)! - 3) * 200)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 1000 + ((Int(Angka)! + Int(AngkaKontrak)! - 3) * 400)
                        }
                        else
                        {
                            hitungscore = 600 + ((Int(Angka)! + Int(AngkaKontrak)! - 3) * 30)
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 550 + ((Int(Angka)! + Int(AngkaKontrak)! - 3) * 100)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 800 + ((Int(Angka)! + Int(AngkaKontrak)! - 3) * 200)
                        }
                        else
                        {
                            hitungscore = 400 + ((Int(Angka)! + Int(AngkaKontrak)! - 3) * 30)
                        }
                    }
                }
                else if angkaKontrak == "6"
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1680 + ((Int(Angka)! + Int(AngkaKontrak)! - 6) * 200)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 2110 + ((Int(Angka)! + Int(AngkaKontrak)! - 6) * 400)
                        }
                        else
                        {
                            hitungscore = 1440 + ((Int(Angka)! + Int(AngkaKontrak)! - 6) * 30)
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1230 + ((Int(Angka)! + Int(AngkaKontrak)! - 6) * 100)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 1660 + ((Int(Angka)! + Int(AngkaKontrak)! - 6) * 200)
                        }
                        else
                        {
                            hitungscore = 990 + ((Int(Angka)! + Int(AngkaKontrak)! - 6) * 30)
                        }
                    }
                }
                else if angkaKontrak == "7"
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 2490
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 2980
                        }
                        else
                        {
                            hitungscore = 2220
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1790
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 2280
                        }
                        else
                        {
                            hitungscore = 1520
                        }
                    }
                }
                
            }
        }
        else if Operator == "=" || Angka == "0"
        {
            if warnaKontrak == "spade" || warnaKontrak == "heart"
            {
                if angkaKontrak == "1" || angkaKontrak == "2"  || angkaKontrak == "3"
                {
                    if isDoubleSelected == true
                    {
                        hitungscore = 160 + ((Int(angkaKontrak)! - 1) * 100)
                    }
                    else if isRedoubleSelected == true
                    {
                        if isVulSelected == true
                        {
                            hitungscore = 720 + ((Int(angkaKontrak)! - 1) * 200)
                        }
                        else
                        {
                            hitungscore = 520 + ((Int(angkaKontrak)! - 1) * 200)
                        }
                    }
                    else
                    {
                        hitungscore = 80 + ((Int(angkaKontrak)! - 1) * 30)
                    }
                }
                else if angkaKontrak == "4" || angkaKontrak == "5"
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 790 + ((Int(angkaKontrak)! - 4) * 200)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 1080 + ((Int(angkaKontrak)! - 4) * 400)
                        }
                        else
                        {
                            hitungscore = 620 + ((Int(angkaKontrak)! - 4) * 30)
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 590 + ((Int(angkaKontrak)! - 4) * 100)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 880 + ((Int(angkaKontrak)! - 4) * 200)
                        }
                        else
                        {
                            hitungscore = 420 + ((Int(angkaKontrak)! - 4) * 30)
                        }
                    }
                }
                else if angkaKontrak == "6"
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1660 + ((Int(angkaKontrak)! - 6) * 200)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 2070 + ((Int(angkaKontrak)! - 6) * 400)
                        }
                        else
                        {
                            hitungscore = 1430 + ((Int(angkaKontrak)! - 6) * 30)
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1210 + ((Int(angkaKontrak)! - 1) * 100)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 1620 + ((Int(angkaKontrak)! - 1) * 200)
                        }
                        else
                        {
                            hitungscore = 980 + ((Int(angkaKontrak)! - 1) * 30)
                        }
                    }
                }
                else if angkaKontrak == "7"
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 2470
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 2940
                        }
                        else
                        {
                            hitungscore = 2210
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1770
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 2240
                        }
                        else
                        {
                            hitungscore = 1510
                        }
                    }
                }
                
            }
            else if warnaKontrak == "diamond" || warnaKontrak == "club"
            {
                if angkaKontrak == "1" || angkaKontrak == "2"  || angkaKontrak == "3" || angkaKontrak == "4"
                {
                    if isDoubleSelected == true
                    {
                        hitungscore = 140 + ((Int(angkaKontrak)! - 1) * 100)
                    }
                    else if isRedoubleSelected == true
                    {
                        hitungscore = 230 + ((Int(angkaKontrak)! - 1) * 200)
                    }
                    else
                    {
                        hitungscore = 70 + ((Int(angkaKontrak)! - 1) * 20)
                    }
                }
                else if angkaKontrak == "5"
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 750 + ((Int(angkaKontrak)! - 5) * 200)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 1000 + ((Int(angkaKontrak)! - 5) * 400)
                        }
                        else
                        {
                            hitungscore = 600 + ((Int(angkaKontrak)! - 5) * 20)
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 550 + ((Int(angkaKontrak)! - 5) * 100)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 800 + ((Int(angkaKontrak)! - 5) * 200)
                        }
                        else
                        {
                            hitungscore = 400 + ((Int(angkaKontrak)! - 5) * 20)
                        }
                    }
                }
                else if angkaKontrak == "6"
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1540 + ((Int(angkaKontrak)! - 6) * 200)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 1830 + ((Int(angkaKontrak)! - 6) * 400)
                        }
                        else
                        {
                            hitungscore = 1370 + ((Int(angkaKontrak)! - 6) * 20)
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1090 + ((Int(angkaKontrak)! - 6) * 100)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 1380 + ((Int(angkaKontrak)! - 6) * 200)
                        }
                        else
                        {
                            hitungscore = 920 + ((Int(angkaKontrak)! - 6) * 20)
                        }
                    }
                }
                else if angkaKontrak == "7"
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 2330
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 2660
                        }
                        else
                        {
                            hitungscore = 2140
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1630
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 1960
                        }
                        else
                        {
                            hitungscore = 1440
                        }
                    }
                }
            }
            else
            {
                if angkaKontrak == "1" || angkaKontrak == "2"
                {
                    if isDoubleSelected == true
                    {
                        hitungscore = 180 + ((Int(angkaKontrak)! - 1) * 100)
                    }
                    else if isRedoubleSelected == true
                    {
                        if isVulSelected == true
                        {
                            hitungscore = 760 + ((Int(angkaKontrak)! - 1) * 200)
                        }
                        else
                        {
                            hitungscore = 560 + ((Int(angkaKontrak)! - 1) * 200)
                        }
                    }
                    else
                    {
                        hitungscore = 90 + ((Int(angkaKontrak)! - 1) * 30)
                    }
                }
                else if angkaKontrak == "4" || angkaKontrak == "5" || angkaKontrak == "3"
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 750 + ((Int(angkaKontrak)! - 3) * 200)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 1000 + ((Int(angkaKontrak)! - 3) * 400)
                        }
                        else
                        {
                            hitungscore = 600 + ((Int(angkaKontrak)! - 3) * 30)
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 550 + ((Int(angkaKontrak)! - 3) * 100)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 800 + ((Int(angkaKontrak)! - 3) * 200)
                        }
                        else
                        {
                            hitungscore = 400 + ((Int(angkaKontrak)! - 3) * 30)
                        }
                    }
                }
                else if angkaKontrak == "6"
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1680 + ((Int(angkaKontrak)! - 6) * 200)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 2110 + ((Int(angkaKontrak)! - 6) * 400)
                        }
                        else
                        {
                            hitungscore = 1440 + ((Int(angkaKontrak)! - 6) * 30)
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1230 + ((Int(angkaKontrak)! - 6) * 100)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 1660 + ((Int(angkaKontrak)! - 6) * 200)
                        }
                        else
                        {
                            hitungscore = 990 + ((Int(angkaKontrak)! - 6) * 30)
                        }
                    }
                }
                else if angkaKontrak == "7"
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 2490
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 2980
                        }
                        else
                        {
                            hitungscore = 2220
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1790
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 2280
                        }
                        else
                        {
                            hitungscore = 1520
                        }
                    }
                }
                
            }
        }
        return hitungscore
    }
        
    
}
