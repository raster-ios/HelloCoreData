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
    @State private var movies: [Movie] = Array<Movie>()
    
    private func populateMovies () {
        movies = coreDM.getAllMovies()
    }
    
    var body: some View {
        VStack {
            TextField("Enter movie name", text: $movieName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textInputAutocapitalization(.sentences)
        
            Button {
                coreDM.saveMovie(title: movieName)
                populateMovies()
            } label: {
                
                ZStack {
                    
                    Text("Save")
                        .font(Font.title)
                        .frame(width: 150, height: 65)
                        .foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 20))
                }
            }
            
            List {
                ForEach (movies, id: \.self) {movie in
                    Text(movie.title ?? "")
                }
                .onDelete { IndexSet in
                    IndexSet.forEach { index in
                        let movie = movies[index]
                        coreDM.deleteMovie(movie: movie)
                        populateMovies()
                    }
                }
            }
            
            
        }
        .padding()
        .onAppear {
            populateMovies()
        }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
