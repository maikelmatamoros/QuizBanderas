import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "Francia", "Alemania", "Irlanda", "Italia", "Nigeria", "Polonia", "Rusia", "España", "Reino Unido", "USA","Costa Rica","Panamá", "Australia", "Brasil", "Monaco"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var currentScore = 0
    @State private var alertMessage = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]),
                           startPoint: .top,
                           endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Presione la bandera de: ").foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                ForEach(0 ..< 3) { number in
                    FlagImage(number: number, countries: self.countries) { (num) in
                        self.flagTapped(num)
                    }
                }
                Text("Puntaje: \(currentScore)")
                    .foregroundColor(.white)
                    .font(.headline)
                Spacer()
            }
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text(alertMessage),
                  dismissButton: .default(Text("Continuar")){
                    self.askQuestion()
                })
        }
    }
    
    private func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    private func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correcto"
            currentScore += 10
            alertMessage = "Su puntaje es \(self.currentScore)."
        } else {
            scoreTitle = "Incorrecto"
            alertMessage = "Es la bandera de \(countries[number])!"
        }
        showingScore = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
