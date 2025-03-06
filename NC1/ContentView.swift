import SwiftUI

struct ContentView: View {
    @State private var Tables: String = ""
    @State private var isNavigationActive = false
    @State private var showAlert = false
    var body: some View {
        NavigationView{
            ZStack {
                Text("WELCOME\nTO \nBRIDGE CALCULATOR")
                    .position(x: UIScreen.main.bounds.width / 2, y: 90)
                    .font(
                        Font.custom("SF Pro Text", size: 20)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.06, green: 0.05, blue: 0.04))
                
                
                
                Image("tampilanawal")
                    .position(x: UIScreen.main.bounds.width / 2, y: 650)
            
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
                        Text("I AM OPEN TABLE")
                            .font(
                                Font.custom("SF Pro Text", size: 17)
                                    .weight(.semibold)
                            )
                            .foregroundColor(.white)
                    )
                    .onTapGesture {
                       
                        Tables = "OPEN"
                        isNavigationActive = true
                    }
                    .position(x: UIScreen.main.bounds.width / 2, y: 350)
                
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
                        Text("I AM CLOSE TABLE")
                            .font(
                                Font.custom("SF Pro Text", size: 17) 
                                    .weight(.semibold)
                            )
                            .foregroundColor(.white)
                    )
                    .onTapGesture {
                        
                        Tables = "CLOSE"
                        isNavigationActive = true
                    }
                    .position(x: UIScreen.main.bounds.width / 2, y: 450)
            }
            .frame(width: 390, height: 844)
            .background(Color(red: 0.96, green: 0.95, blue: 0.94))
            .background(
                NavigationLink(
                    destination: isNavigationActive ?
                                    (Tables == "OPEN" ?
                                        AnyView(Open_IsiJumlahBoard().navigationBarBackButtonHidden(true)) :
                                        AnyView(Close_IsiJumlahBoard().navigationBarBackButtonHidden(true))) :
                                    nil,
                    isActive: $isNavigationActive,
                    label: { EmptyView() }
                )

            )
        }
    }
}

#Preview {
    ContentView()
}
