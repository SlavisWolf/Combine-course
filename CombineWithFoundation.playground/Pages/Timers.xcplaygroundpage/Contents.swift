

import Combine
import SwiftUI
import PlaygroundSupport


let dateFormat: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "es_ES")
    formatter.dateStyle = .none
    formatter.timeStyle = .medium
    return formatter
}()


struct MyClock: View {
    
    let timer = Timer.TimerPublisher(interval: 1, runLoop: .main, mode: .default)
        .autoconnect()
        .map( { dateFormat.string(from: $0) } )
    
    @State var hour = dateFormat.string(from: .now)
    var body: some View {
        VStack {
            Text("🕰️ \(hour) ⏰")
                .frame(width: 200)
                .background(.black)
                .foregroundStyle(.red)
                .fontWeight(.bold)
        }
        .onReceive(timer) { time in
            hour = time
        }
    }
}


PlaygroundPage.current.setLiveView(MyClock() )
