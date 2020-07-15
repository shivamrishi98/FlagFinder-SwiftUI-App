//
//  ContentView.swift
//  FlagFinder
//
//  Created by Shivam Rishi on 14/07/20.
//  Copyright © 2020 shivam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var countries = ["Estonia","France","Germany","Ireland","Italy","Monaco","Nigeria","Poland","Russia","Spain","UK","US"].shuffled()
    
    @State var correct = Int.random(in: 0...2)
    
    @State var score:Int = 0
    @State var alertTitle:String = ""
    @State var showingAlert:Bool = false
    
    
    var body: some View {
        NavigationView
            {
                ZStack
                    {
                        Color(red: 0.93, green: 0.94, blue: 0.95).edgesIgnoringSafeArea(.all)
                     
                VStack
                    {
                     
                         Text("Find the flag of \(countries[correct])").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                                              
                        ForEach((0...2),id: \.self ) { number in
                            Image(self.countries[number])
                                .border(Color.black, width: 1)
                                .onTapGesture {
                                    self.flagTapped(number)
                            }.padding(30)
                            
                        }
                        Spacer()
                        
                }.navigationBarTitle(Text("FlagFinder"))
                    .alert(isPresented: $showingAlert) { () -> Alert in
                        Alert(title: Text(alertTitle), message: Text("Score: \(score)"), dismissButton: .default(Text("Continue")) {
                            self.askQuestions()
                            })
                }
        }
        }
    }
    
    func flagTapped(_ tag: Int)
    {
        if tag == correct
        {
            score = score + 1
            alertTitle = "Correct"
        } else {
            score = score - 1
            alertTitle = "Wrong"
        }
        
        showingAlert = true
        
    }
    
    func askQuestions()
    {
        countries.shuffle()
        correct = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
