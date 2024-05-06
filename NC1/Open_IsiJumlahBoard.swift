import SwiftUI
import Combine

struct Open_IsiJumlahBoard: View {
    @State private var isNavigationActive: Bool = false
    @State private var hitungscore: Int = 0
    @State private var KontrakDisplay: String = ""
    @State private var jumlahBoard: String = ""
    @State private var awalInput: String = ""
    @State private var NomorBoard: Int = 0
    @State private var homeTeamInput: String = ""
    @State private var visitorTeamInput: String = ""
    
    var isNextButtonDisabled: Bool {
        return jumlahBoard.isEmpty || awalInput.isEmpty
    }
    
    var body: some View {
        NavigationView{
            ZStack {
                Text("OPEN TABLE")
                    .font(
                        Font.custom("SF Pro Text", size: 20)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .position(x: UIScreen.main.bounds.width / 2, y: 50)
                
                TextWithStyle(text: "JULAH BOARD", fontSize: 17, fontWeight: .regular, color: Color(red: 0.38, green: 0.28, blue: 0.22))
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2 - 100)
                
                TextField("8", text: $jumlahBoard)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 17)
                    .frame(width: 328, height: 50)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 0.51, green: 0.38, blue: 0.29), lineWidth: 1)
                    )
                    .font(Font.custom("SF Pro Text", size: 17))
                    .keyboardType(.numberPad)
                    .onReceive(Just(jumlahBoard)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.jumlahBoard = filtered
                        }
                    }
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2 - 60)

                
                
                TextWithStyle(text: "BOARD AWAL", fontSize: 17, fontWeight: .regular, color: Color(red: 0.38, green: 0.28, blue: 0.22))
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2 + 20)
                
                TextField("1", text: $awalInput)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 17)
                    .frame(width: 328, height: 50)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 0.51, green: 0.38, blue: 0.29), lineWidth: 1)
                    )
                    .font(Font.custom("SF Pro Text", size: 17))
                    .keyboardType(.numberPad)
                    .onReceive(Just(awalInput)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.awalInput = filtered
                        }
                    }
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2 + 60)

                
                TextWithStyle(text: "Connected to CLOSE TABLE", fontSize: 15, fontWeight: .semibold, color: .white)
                    .position(x: UIScreen.main.bounds.width / 2, y: 700)
                
                
                
                NavigationLink(destination: IsiNamaTim(
                    jumlahBoard: $jumlahBoard,
                    awalInput: $awalInput
                ).navigationBarBackButtonHidden(true), isActive: $isNavigationActive) {
                    EmptyView()
                }
                .isDetailLink(false)
                .frame(width: 0, height: 0)
                .hidden()
                
                Button(action: {
                    // Action to perform when NEXT button is tapped
                    // Set isNavigationActive menjadi true untuk mengaktifkan NavigationLink
                    isNavigationActive = true
                }) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(isNextButtonDisabled ? Color.gray : Color(red: 0.38, green: 0.28, blue: 0.22))
                        .frame(width: 307, height: 58)
                        .overlay(
                            Text("NEXT")
                                .font(
                                    Font.custom("SF Pro Text", size: 17)
                                        .weight(.semibold)
                                )
                                .foregroundColor(.white)
                        )
                }
                .disabled(isNextButtonDisabled)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                .position(x: UIScreen.main.bounds.width / 2, y: 700)
            }
            .frame(width: 390, height: 844)
            .background(Color(red: 0.96, green: 0.95, blue: 0.94))
        }
    }
}


