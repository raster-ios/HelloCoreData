//
//  MovieDetailView.swift
//  HelloCoreData
//
//  Created by Gena Raster on 27.11.21.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movie: Movie
    let coreDM: CoreDataManager
    @State private var movieName: String = ""
    
    var body: some View {
        VStack {
            TextField(movie.title ?? "", text: $movieName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button {
                if !movieName.isEmpty {
                    movie.title = movieName
                    coreDM.updateMovie()
                }
            } label: {
                Text("Update")
            }

        }
        .padding()
    }
        
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let coreDM = CoreDataManager()
        let movie = Movie(context: coreDM.persistentContainer.viewContext)
        
        MovieDetailView(movie: movie, coreDM: coreDM)
    }
}
