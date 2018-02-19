//
//  Menu.swift
//  Game Library
//
//  Created by Devin Cook on 2/16/18.
//  Copyright © 2018 Devin Cook. All rights reserved.
//

import Foundation

func Menu() {
    var VDArray = [VideoGame]()
    var quit = false
    let Dayz = VideoGame(name: "Dayz", rating: 1, CheckedIn: true)
    VDArray.append(Dayz)
    let currentDate = Date()
    let calendar = Calendar.current
    let twoWeeksFromNow = calendar.date(byAdding: .day, value: 14, to: currentDate)
    let dateFormatter = DateFormatter()
    //dateFormatter.dateStyle = .long
    dateFormatter.dateFormat = "EEEE, MM dd, yyyy"
    print(dateFormatter.string(from: twoWeeksFromNow!))
    while !quit{
        print("Game Library\n1. Add Games\n2. Remove a Game\n3. Check a game out\n4. Check a Game In\n5. Quit the Program")
        var userInput = Int(readLine()!)
        if userInput == nil{
            print("Please enter the number corresponding to what you would like to do.")
            userInput = Int(readLine()!)
        }
        if userInput == 1{
            print("What is the name of your game?")
            let name = readLine()!
            print("What is the rating of your game?")
            let rating = Int(readLine()!)!
            let newGame = VideoGame(name: name, rating: rating, CheckedIn: true)
            VDArray.append(newGame)
        }
        if userInput == 2{
            if VDArray.count == 0{
                print("Your library is empty.")
            }
            else { for i in 0...VDArray.count - 1{
                print("\(i). \(VDArray[i].name)")
                }
                print("Please enter the number corresponding with the game you'd like to delete.")
                var delete = Int(readLine()!)
                VDArray.remove(at: delete!)
                while delete == nil {
                    print("Please enter the number corresponding with the game you'd like to delete.")
                    delete = Int(readLine()!)
                }
            }
        }
        if userInput == 3{
            var count: Int = 0
                for j in 0...VDArray.count - 1{
                    if VDArray[j].CheckedIn{
                        print("\(j). \(VDArray[j].name)")
                        count += 1
                    }
                }
            if count >= 1{
                print("Please enter the number corresponding with the game you'd like to check out.")
                var czechOut = Int(readLine()!)
                while czechOut == nil {
                    print("Please enter the number corresponding with the game you'd like to check out.")
                    czechOut = Int(readLine()!)
                }
                print("\(VDArray[czechOut!].name) has been checked out on \(dateFormatter.string(from: currentDate)). It is due \(dateFormatter.string(from: twoWeeksFromNow!))")
                VDArray[czechOut!].CheckedIn = false
            }
            if count == 0 {
                print("Everything has been checked out.")
            }
        }
        if userInput == 4{
            var count2 = 0
            for k in  0...VDArray.count - 1{
                if !VDArray[k].CheckedIn{
                    print("\(k). \(VDArray[k].name)")
                    count2 += 1
                }
            }
            if count2 >= 1 {
                print("Please enter the number corresponding with the game you'd like to check in.")
                var czechIn = Int(readLine()!)
                while czechIn == nil || czechIn! > VDArray.count - 1{
                    print("Please enter the number corresponding with the game you'd like to check in.")
                    czechIn = Int(readLine()!)
            }
                print("\(VDArray[czechIn!].name) has been checked in on \(dateFormatter.string(from: currentDate)).")
                VDArray[czechIn!].CheckedIn = true
            }
            if count2 == 0 {
                print("Everything has been checked in.")
            }
        }
        if userInput == 5{
            quit = true
        }
    }
}

