
import Foundation
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

// Implementing this protocol allows you tu access a published called 'objectWillChange'
final class ClockViewModel: ObservableObject {
    
    var subscribers = Set<AnyCancellable>()
    
    @Published var time = dateFormat.string(from: .now)
    
    init() {
        Timer.TimerPublisher(interval: 1.0, runLoop: .main, mode: .default)
            .autoconnect()
            .map( { dateFormat.string(from: $0) } )
            .assign(to: \.time, on: self)
            .store(in: &subscribers)
    }
}


struct ClockView: View {
    

    @ObservedObject var viewModel = ClockViewModel()
    @State var hourPublisher = dateFormat.string(from: .now)
    @State var hourObjectWillChange = dateFormat.string(from: .now)
    
    
    var body: some View {
        VStack {
            //Normal way
            Text("From published")
                .font(.headline)
            Text(viewModel.time)
                .foregroundStyle(.blue)
                .fontWeight(.bold)
            Divider()
            //Using manually the publisher
            Text("From publisher")
                .font(.headline)
            Text(hourPublisher)
                .foregroundStyle(.green)
                .fontWeight(.bold)
                .onReceive(viewModel.$time) { hourPublisher = $0 }
            Divider()
            //Using object will change
            Text("From object will change")
                .font(.headline)
            Text(hourObjectWillChange)
                .foregroundStyle(.purple)
                .fontWeight(.bold)
                .onReceive(viewModel.objectWillChange) { hourObjectWillChange = viewModel.time }
        }
        .padding()
    }
}

PlaygroundPage.current.setLiveView(ClockView() )
