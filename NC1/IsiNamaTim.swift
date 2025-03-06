import SwiftUI
import MultipeerConnectivity


struct IsiNamaTim: View {
    @State private var isActionSheetVisible = false
    @Binding var jumlahBoard: String
    @Binding var awalInput: String
    @State private var homeTeamInput: String = ""
    @State private var visitorTeamInput: String  = ""
    @State private var isNavigationActive: Bool = false
    @State private var Player: String = ""
    @State private var tinggiBoard: Int = 0
    @State private var data: [[String]] = [[]]

    // Constructor
    init(jumlahBoard: Binding<String>, awalInput: Binding<String>) {
        self._jumlahBoard = jumlahBoard
        self._awalInput = awalInput
    }
    
    var isNextButtonDisabled: Bool {
        return homeTeamInput.isEmpty || visitorTeamInput.isEmpty
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                HStack(alignment: .center, spacing: 5) {
                    NavigationLink(destination: Open_IsiJumlahBoard().navigationBarBackButtonHidden(true)) {
                        Image("Light")
                            .frame(width: 11.97656, height: 20.78906)
                        
                        // Navigation / Default
                        Text("Back")
                            .font(Font.custom("SF Pro Text", size: 20))
                            .foregroundColor(Color(red: 0.38, green: 0.28, blue: 0.22))
                    }
                }
                .padding(.horizontal, 9)
                .padding(.vertical, 10)
                .position(x: 40, y: 50)
                
                TextWithStyle(text: "OPEN TABLE", fontSize: 20, fontWeight: .semibold, color: .black)
                    .position(x: UIScreen.main.bounds.width / 2, y: 50)
                
                VStack {
                    NavigationLink(destination: IsiKontrak(
                                   jumlahBoard: $jumlahBoard,
                                   awalInput: $awalInput,
                                   homeTeamInput: $homeTeamInput,
                                   visitorTeamInput: $visitorTeamInput, tinggiBoard: $tinggiBoard, data: $data
                               ).navigationBarBackButtonHidden(true), isActive: $isNavigationActive) {
                                   EmptyView()
                               }
                    .isDetailLink(false)
                    .frame(width: 0, height: 0)
                    .hidden()
                    
                    Button(action: {
                        self.isActionSheetVisible = true
                    }) {
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0.89, green: 0.84, blue: 0.79), lineWidth: 1)
                            .overlay(){
                                Text("CREATE TABLE")
                                    .font(Font.system(size: 17, weight: .semibold))
                                    .foregroundColor(.white)

                            }
                                            }
                    .frame(width: 307, height: 58)
                    .background(isNextButtonDisabled ? Color.gray : Color(red: 0.38, green: 0.28, blue: 0.22))
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    .disabled(isNextButtonDisabled) // Menonaktifkan tombol jika input kosong
                    .actionSheet(isPresented: $isActionSheetVisible) {
                        ActionSheet(title: Text("Make sure your data is correct"), buttons: [
                            .default(Text("CREATE")) {
                                // Tindakan yang diambil ketika tombol "CREATE" ditekan
                                // Di sini, Anda dapat menambahkan navigasi ke halaman IsiKontrak
                                // Misalnya:
                                tinggiBoard = Int(jumlahBoard)! + Int(awalInput)! + 1
                                self.data = Array(repeating: Array(repeating: "", count: 11), count: tinggiBoard + 1)
                                isActionSheetVisible = false // Tutup action sheet
                                isNavigationActive = true
                            },
                            .cancel()
                        ])
                    }
                }
                .position(x: UIScreen.main.bounds.width / 2, y: 600)
                
                TextWithStyle(text: "NAMA HOME TEAM", fontSize: 17, fontWeight: .regular, color: Color(red: 0.38, green: 0.28, blue: 0.22))
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2 - 100)
                
                CustomTextField(text: $homeTeamInput, placeholder: "Home Team")
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2 - 60)
                
                TextWithStyle(text: "NAMA VISITOR TEAM", fontSize: 17, fontWeight: .regular, color: Color(red: 0.38, green: 0.28, blue: 0.22))
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2 + 20)
                
                CustomTextField(text: $visitorTeamInput, placeholder: "Visitor Team")
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2 + 60)
            }
            .frame(width: 390, height: 844)
            .background(Color(red: 0.96, green: 0.95, blue: 0.94))
        }
    }
}



struct TextWithStyle: View {
    var text: String
    var fontSize: CGFloat
    var fontWeight: Font.Weight
    var color: Color
    
    var body: some View {
        Text(text)
            .font(Font.custom("SF Pro Text", size: fontSize).weight(fontWeight))
            .foregroundColor(color)
    }
}

struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .multilineTextAlignment(.leading)
            .padding(.leading, 17)
            .frame(width: 328, height: 50, alignment: .center)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 0.51, green: 0.38, blue: 0.29), lineWidth: 1)
            )
            .font(Font.custom("SF Pro Text", size: 17))
    }
}
