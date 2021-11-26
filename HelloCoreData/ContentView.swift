//
//  ContentView.swift
//  HelloCoreData
//
//  Created by Gena Raster on 23.11.21.
//

import SwiftUI

struct ContentView: View {
    
    let coreDM: CoreDataManager
    @State private var movieName: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter movie name", text: $movieName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button {
                coreDM.saveMovie(title: movieName)
            } label: {
                
                ZStack {
                    
                    Text("Save")
                        .font(Font.title)
                        .frame(width: 150, height: 65)
                        .foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 20))
                }
            }

        }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
