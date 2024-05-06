//
//  Close-IsiKontrak.swift
//  NanoChallenge1
//
//  Created by Aqilla Shahbani Mahazoya on 26/04/24.
//

import SwiftUI

struct Compare: View {
    @State private var isActionSheetPresented = false
    //    @State private var jumlahBoard: String = "8"
    //    @State private var awalInput: String = "1"
    @State private var isFinishButtonPressed = false
    @Binding var jumlahBoard: String
    @Binding var awalInput: String
    @Binding var homeTeamInput: String
    @Binding var visitorTeamInput: String
    @Binding var tinggiBoard: Int
    @Binding var data: [[String]]
    @State private var NomorBoard: Int = 0
    @State private var hitungscore: Int = 0
    @State private var score: String = ""
    
    // data[0] = kontrak open
    // data[1] = by open
    // data[2] = score open
    // data[3] = score open yang udah konvert
    // data[4] = score close yang udah konvert
    // data[5] = selisih open close kalau + punya vt
    // data[6] = vp vt
    // data[7] = vp ht
    // data[8] = imp vt
    // data[9] = imp ht
    
    @State private var tau: Double = 0.0
    @State private var b: Double = 0.0
    @State private var power: Double = 0.0
    @State private var win: Double = 0.0
    @State private var lawan: Double = 0.0
    @State private var winn: String = ""
    @State private var lawann: String = ""
    @State private var winnn: String = ""
    @State private var lawannn: String = ""
    
    
    @State private var isIsiScoreViewPresented = true
    @State private var isCalculatorViewPresented = false
    
    init(jumlahBoard: Binding<String>, awalInput: Binding<String>,  homeTeamInput: Binding<String>, visitorTeamInput: Binding<String>, tinggiBoard: Binding<Int>, data: Binding<[[String]]>) {
        self._jumlahBoard = jumlahBoard
        self._awalInput = awalInput
        self._homeTeamInput = homeTeamInput
        self._visitorTeamInput = visitorTeamInput
        self._tinggiBoard = tinggiBoard
        self._data = data
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                if isIsiScoreViewPresented
                {
                    IsiScore()
                }
                else
                {
                    Kalkulator()
                }
            }
            .frame(width: 390, height: 844)
            .background(Color(red: 0.96, green: 0.95, blue: 0.94))
            .background(
                NavigationLink(
                    destination: Result(jumlahBoard: $jumlahBoard, awalInput: $awalInput, homeTeamInput: $homeTeamInput, visitorTeamInput: $visitorTeamInput, tinggiBoard: $tinggiBoard, data: $data).navigationBarBackButtonHidden(true), // Ganti dengan halaman tujuan yang tepat
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
    
    func IsiScore() -> some View {
        VStack(spacing: 20) {
            // Navigation/Bold
            
            Spacer()
            Spacer()
            Text("COMPARE WITH CLOSE TABLE")
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
                        .onTapGesture{
                            NomorBoard = index
                            isCalculatorViewPresented = true
                            isIsiScoreViewPresented = false
                            hitungscore = 0
                            score = ""
                        }
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
                .onTapGesture { //kalo + pasti VT
                    guard let awalInputInt = Int(awalInput) else {
                        return
                    }
                    guard tinggiBoard > awalInputInt + 2 else {
                        return
                    }
                    
                    for index in awalInputInt...(tinggiBoard - 2) {
                        let scoreopen = Int(data[index][3]) ?? 0
                        let scoreclose = Int(data[index][4]) ?? 0
                        
                        if scoreopen == 0
                        {
                            self.data[index][5] = "0"
                            
                        }
                        else if scoreclose == 0
                        {
                            self.data[index][5] = "0"
                        }
                        else
                        {
                            self.data[index][5] = String(scoreopen - scoreclose)
                        }
                    }
                    
                    for indexx in awalInputInt...(tinggiBoard - 2) {
                        var scoreselisih = Int(self.data[indexx][5]) ?? 0
                        
                        if scoreselisih == 0
                        {
                            self.data[indexx][6] = "0"
                            self.data[indexx][7] = "0"
                            
                        }
                        else if scoreselisih < 0 // (punyaHT)
                        {
                            scoreselisih = scoreselisih * -1
                            if scoreselisih < 20
                            {
                                self.data[indexx][7] = "0"
                            }
                            else if scoreselisih >= 20 && scoreselisih <= 40
                            {
                                self.data[indexx][7] = "1"
                            }
                            else if scoreselisih >= 50 && scoreselisih <= 80
                            {
                                self.data[indexx][7] = "2"
                            }
                            else if scoreselisih >= 90 && scoreselisih <= 120
                            {
                                self.data[indexx][7] = "3"
                            }
                            else if scoreselisih >= 130 && scoreselisih <= 160
                            {
                                self.data[indexx][7] = "4"
                            }
                            else if scoreselisih >= 170 && scoreselisih <= 210
                            {
                                self.data[indexx][7] = "5"
                            }
                            else if scoreselisih >= 220 && scoreselisih <= 260
                            {
                                self.data[indexx][7] = "6"
                            }
                            else if scoreselisih >= 270 && scoreselisih <= 310
                            {
                                self.data[indexx][7] = "7"
                            }
                            else if scoreselisih >= 320 && scoreselisih <= 360
                            {
                                self.data[indexx][7] = "8"
                            }
                            else if scoreselisih >= 370 && scoreselisih <= 420
                            {
                                self.data[indexx][7] = "9"
                            }
                            else if scoreselisih >= 430 && scoreselisih <= 490
                            {
                                self.data[indexx][7] = "10"
                            }
                            else if scoreselisih >= 500 && scoreselisih <= 590
                            {
                                self.data[indexx][7] = "11"
                            }
                            else if scoreselisih >= 600 && scoreselisih <= 690
                            {
                                self.data[indexx][7] = "12"
                            }
                            else if scoreselisih >= 750 && scoreselisih <= 740
                            {
                                self.data[indexx][7] = "13"
                            }
                            else if scoreselisih >= 900 && scoreselisih <= 1090
                            {
                                self.data[indexx][7] = "14"
                            }
                            else if scoreselisih >= 1100 && scoreselisih <= 1290
                            {
                                self.data[indexx][7] = "15"
                            }
                            else if scoreselisih >= 1300 && scoreselisih <= 1490
                            {
                                self.data[indexx][7] = "16"
                            }
                            else if scoreselisih >= 1500 && scoreselisih <= 1740
                            {
                                self.data[indexx][7] = "17"
                            }
                            else if scoreselisih >= 1750 && scoreselisih <= 1990
                            {
                                self.data[indexx][7] = "18"
                            }
                            else if scoreselisih >= 2000 && scoreselisih <= 2240
                            {
                                self.data[indexx][7] = "19"
                            }
                            else if scoreselisih >= 2250 && scoreselisih <= 2490
                            {
                                self.data[indexx][7] = "20"
                            }
                            else if scoreselisih >= 2500 && scoreselisih <= 2990
                            {
                                self.data[indexx][7] = "21"
                            }
                            else if scoreselisih >= 3000 && scoreselisih <= 3490
                            {
                                self.data[indexx][7] = "22"
                            }
                            else if scoreselisih >= 3500 && scoreselisih <= 3990
                            {
                                self.data[indexx][7] = "23"
                            }
                            else
                            {
                                self.data[indexx][7] = "25"
                            }
                            self.data[indexx][6] = "0"
                            
                        }
                        else // punya VT
                        {
                            if scoreselisih < 20
                            {
                                self.data[indexx][6] = "0"
                            }
                            else if scoreselisih >= 20 && scoreselisih <= 40
                            {
                                self.data[indexx][6] = "1"
                            }
                            else if scoreselisih >= 50 && scoreselisih <= 80
                            {
                                self.data[indexx][6] = "2"
                            }
                            else if scoreselisih >= 90 && scoreselisih <= 120
                            {
                                self.data[indexx][6] = "3"
                            }
                            else if scoreselisih >= 130 && scoreselisih <= 160
                            {
                                self.data[indexx][6] = "4"
                            }
                            else if scoreselisih >= 170 && scoreselisih <= 210
                            {
                                self.data[indexx][6] = "5"
                            }
                            else if scoreselisih >= 220 && scoreselisih <= 260
                            {
                                self.data[indexx][6] = "6"
                            }
                            else if scoreselisih >= 270 && scoreselisih <= 310
                            {
                                self.data[indexx][6] = "7"
                            }
                            else if scoreselisih >= 320 && scoreselisih <= 360
                            {
                                self.data[indexx][6] = "8"
                            }
                            else if scoreselisih >= 370 && scoreselisih <= 420
                            {
                                self.data[indexx][6] = "9"
                            }
                            else if scoreselisih >= 430 && scoreselisih <= 490
                            {
                                self.data[indexx][6] = "10"
                            }
                            else if scoreselisih >= 500 && scoreselisih <= 590
                            {
                                self.data[indexx][6] = "11"
                            }
                            else if scoreselisih >= 600 && scoreselisih <= 690
                            {
                                self.data[indexx][6] = "12"
                            }
                            else if scoreselisih >= 750 && scoreselisih <= 740
                            {
                                self.data[indexx][6] = "13"
                            }
                            else if scoreselisih >= 900 && scoreselisih <= 1090
                            {
                                self.data[indexx][6] = "14"
                            }
                            else if scoreselisih >= 1100 && scoreselisih <= 1290
                            {
                                self.data[indexx][6] = "15"
                            }
                            else if scoreselisih >= 1300 && scoreselisih <= 1490
                            {
                                self.data[indexx][6] = "16"
                            }
                            else if scoreselisih >= 1500 && scoreselisih <= 1740
                            {
                                self.data[indexx][6] = "17"
                            }
                            else if scoreselisih >= 1750 && scoreselisih <= 1990
                            {
                                self.data[indexx][6] = "18"
                            }
                            else if scoreselisih >= 2000 && scoreselisih <= 2240
                            {
                                self.data[indexx][6] = "19"
                            }
                            else if scoreselisih >= 2250 && scoreselisih <= 2490
                            {
                                self.data[indexx][6] = "20"
                            }
                            else if scoreselisih >= 2500 && scoreselisih <= 2990
                            {
                                self.data[indexx][6] = "21"
                            }
                            else if scoreselisih >= 3000 && scoreselisih <= 3490
                            {
                                self.data[indexx][6] = "22"
                            }
                            else if scoreselisih >= 3500 && scoreselisih <= 3990
                            {
                                self.data[indexx][6] = "23"
                            }
                            else
                            {
                                self.data[indexx][6] = "25"
                            }
                            self.data[indexx][7] = "0"
                            
                        }
                    }
                    
                    var totalvt = 0
                    var totalht = 0
                    
                    for indexxxx in awalInputInt...(tinggiBoard - 2) {
                        let value = Int(self.data[indexxxx][6]) ?? 0
                        totalvt += value
                    }
                    
                    for indexxxxx in awalInputInt...(tinggiBoard - 2) {
                        let value = Int(data[indexxxxx][7]) ?? 0
                        totalht += value
                    }
                    
                    self.data[0][8] = String(totalvt)
                    self.data[0][9] = String(totalht)
                    
                    var selisihvp = Double(totalvt - totalht)
                    var totalBoard = Double(jumlahBoard)!
                    
                    if selisihvp == 0
                    {
                        self.data[1][8] = "0"
                        self.data[1][9] = "0"
                    }
                    else if selisihvp < 0 //total ht
                    {
                        selisihvp = selisihvp * -1
                        
                        tau = (sqrt(5) - 1) / 2
                        b = 15 * sqrt(totalBoard)
                        power = pow(tau, 3  * selisihvp / b)
                        win = 10 + 10 * ((1 - power) / (1 - pow(tau, 3)))
                        if win > 20
                        {
                            win = 20
                        }
                        lawan = 20 - win
                        
                        lawann = String(lawan)
                        lawannn = String(lawann.prefix(4))
                        winn = String(win)
                        winnn = String(winn.prefix(4))
                        
                        self.data[1][8] = winnn
                        self.data[1][9] = lawannn
                        
                    }
                    else //total vt
                    {
                        tau = (sqrt(5) - 1) / 2
                        b = 15 * sqrt(totalBoard)
                        power = pow(tau, 3  * selisihvp / b)
                        win = 10 + 10 * ((1 - power) / (1 - pow(tau, 3)))
                        if win > 20
                        {
                            win = 20
                        }
                        lawan = 20 - win
                        
                        lawann = String(lawan)
                        lawannn = String(lawann.prefix(4))
                        winn = String(win)
                         winnn = String(winn.prefix(4))
                        
                        self.data[1][8] = winnn
                        self.data[1][9] = lawannn
                        
                    }
                    isActionSheetPresented = true
                }
            
            
            Spacer()
            Spacer()
        }
    }
    
    func Kalkulator() -> some View {
        ZStack {
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
                score = ""
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
                    hitungscore = 0
                }
            
            Text(String(score))
                .font(
                    Font.custom("SF Pro Text", size: 20)
                        .weight(.semibold)
                )
                .multilineTextAlignment(.trailing)
                .foregroundColor(.black)
                .position(x: 330, y: 400)
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 150, height: 58)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(.black, lineWidth: 1)
                )
                .overlay (
                    Text("-")
                        .font(Font.custom("SF Pro Text", size: 20))
                        .foregroundColor(.black)
                        .frame(width: 40, alignment: .center)
                )
                .position(x: 110, y: 470)
                .onTapGesture {
                    score = String(Int(score)! * -1)
                }
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 150, height: 58)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(.black, lineWidth: 1)
                )
                .overlay (
                    Text("DEL")
                        .font(Font.custom("SF Pro Text", size: 20))
                        .foregroundColor(.black)
                        .frame(width: 40, alignment: .center)
                )
                .position(x: 270, y: 470)
                .onTapGesture {
                    score = String(score.dropLast())
                }
            
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
                    score = score + "0"
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
                .onTapGesture {
                    self.data[NomorBoard][4] = score
                    isCalculatorViewPresented = false
                    isIsiScoreViewPresented = true
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
        .onTapGesture {
            score = score + text
        }
    }
    
}
