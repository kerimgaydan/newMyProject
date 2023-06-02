//
//  ContentView.swift
//  newMyProject
//
//  Created by Kerim Gaydan on 2.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State var count = 0
    var body: some View {
        VStack {
                    Text("Count: \(count)")
                        .font(.largeTitle)
                        .padding()
                    
                    Button(action: {
                        count += 1
                    }) {
                        Text("Increment")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        count = 0
                    }) {
                        Text("Reset")
                            .font(.title)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
        }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
