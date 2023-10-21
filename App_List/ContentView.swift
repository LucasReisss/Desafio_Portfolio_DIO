//
//  ContentView.swift
//  App_List
//
//  Created by Lucas da Silva Reis on 21/10/23.
//

import SwiftUI
import SDWebImageSwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.datas){  data in
                card(name: data.name, url: data.url)
            }.navigationBarTitle("List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct card: View {
    var name = ""
    var url = ""
    
    var body: some View{
        HStack {
            AnimatedImage(url: URL(string: url)!).resizable().frame(width: 48, height: 48).clipShape(Circle()).shadow(color: Color.green, radius: 8)
            
            Text(name).font(.body).fontWeight(.medium)
                .foregroundColor(Color.green)
                
        }
    }
}
