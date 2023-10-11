//
//  ContentView.swift
//  BatchImages
//
//  Created by Antonio Jesús on 11/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewmodel = BatchImagesViewModel()
    
    let columns =  [GridItem](repeating: GridItem(.flexible() ), count: 2)
     
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, content: {
                ForEach(viewmodel.photos) { photo in
                    photo.image
                        .resizable()
                        .scaledToFit()
                }
            })
        }
        .background(.black)
        .onAppear {
            viewmodel.downloadImages()
        }
        
    }
}

#Preview {
    ContentView()
}
