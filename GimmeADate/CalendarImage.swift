//
//  CalendarImage.swift
//  GimmeADate
//
//  Created by Drew Connelly on 2/11/21.
//

import SwiftUI

func isLeapYear(year: Int) -> Bool {
    var leap = false
    if (year % 100 == 0) && (year & 16 == 0) {
        leap = true
    }
    else if (year % 4 == 0){
        leap = true
    }
    return(leap)
}

func dozens(number: Int) -> Int {
    let numDozens = (number - (number % 12))/12
    return(numDozens)
}

func fours (number: Int) -> Int {
    let numFours = (number - (number % 4))/4
    return(numFours)
}

func dayOfWeek(day: Int, month: Int, year: Int) -> Int {
    
    let century = (year - (year % 100)) / 100
    let centurypart = 6 - (2 * (century % 4))
    let decade = year - (100 * century)
    let decadepart = dozens(number: decade) + (decade % 12) + fours(number: (decade % 12))
    
    let daypart = day
    
    let monthvals = [0,3,3,6,1,4,6,2,5,0,3,5]
    let monthpart = monthvals[month]
    
    var DOW = -1
    if(isLeapYear(year:year) && month < 3){
        DOW = (centurypart + decadepart + monthpart + daypart - 1) % 7
    }
    else{
        DOW = (centurypart + decadepart + monthpart + daypart) % 7
    }
    
    return(DOW)
}

func dateGen() -> (String,Int) {
    let year = Int.random(in: 1000...2200)
    let leap = isLeapYear(year: year)
    let month = Int.random(in: 0...11)
    var day = 0
    if (month+1) == 2 {
        if (leap){
            day = Int.random(in: 1...29)
        }
        else {
        day = Int.random(in: 1...28)
        }
    }
    else if (month+1) <= 7 {
        if (month+1) % 2 == 0 {
            day = Int.random(in: 1...30)
        }
        else {
            day = Int.random(in: 1...31)
        }
    }
    else {
        if (month+1) % 2 == 0 {
            day = Int.random(in: 1...31)
        }
        else {
            day = Int.random(in: 1...30)
        }
    }
    
    let DOW = dayOfWeek(day: day, month: month, year: year)
    let final = String(month+1) + " / " + String(day) + " / " + String(year)
    return((String(final),DOW))
}

let initialdate = dateGen()

struct CalendarImage: View {
    @State var date = initialdate.0
    @State var calcolor = Color("calColor")
    @State var dateNum = initialdate.1
    @State var numCorrect = 0
    @State var numTries = 0
    @State var accuracy = 0.0
    
    var body: some View {
        
        ZStack{
            Color("bkgdColor")
                .ignoresSafeArea()
            
            VStack{
            VStack {
                Text("Give Me A Date!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                Text("By Drew Connelly")
                    .font(.subheadline)
                    .fontWeight(.thin)
                    .foregroundColor(Color.black)
                HStack {
                    Image("calendaricon.png")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    Spacer()
                    VStack {
                        Button(action: {
                            (self.date,self.dateNum) = dateGen()
                        }){
                            Text("Generate a new date")
                                .fontWeight(.bold)
                                //TODO: CHECK IF THEY ALREADY HAVE A PENDING DATE TO ANSWER FOR? MAYBE DON'T DO THIS SO DATES CAN BE SKIPPED...
                        }
                        .padding(.all, 10.0)
                        .foregroundColor(.black)
                        .background(RoundedRectangle(cornerRadius: 7)
                                        .fill(calcolor))
                        Text(date)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                    }
                }
                .padding()
                Spacer()
                Text("Answer here:")
                    .font(.headline)
                VStack {
                    HStack{
                        Button(action: {
                            self.numTries += 1
                            if (0 == dateNum){
                                numCorrect += 1
                                (self.date,self.dateNum) = dateGen()
                            }
                            self.accuracy = Double(numCorrect)/Double(numTries)
                        }){
                            Text(" 0 ")
                                .fontWeight(.bold)
                                .padding()
                        }
                        .background(RoundedRectangle(cornerRadius: 7)
                                        .fill(calcolor))
                        .padding(.all, 13.0)
                        .foregroundColor(.black)
                        
                        Button(action: {
                            self.numTries += 1
                            if (1 == dateNum){
                                numCorrect += 1
                                (self.date,self.dateNum) = dateGen()
                            }
                            self.accuracy = Double(numCorrect)/Double(numTries)
                        }){
                            Text(" 1 ")
                                .fontWeight(.bold)

                                .padding()
                        }
                        .background(RoundedRectangle(cornerRadius: 7)
                                        .fill(calcolor))
                        .padding(.all, 13.0)
                        .foregroundColor(.black)
                        

                        Button(action: {
                            self.numTries += 1
                            if (2 == dateNum){
                                numCorrect += 1
                                (self.date,self.dateNum) = dateGen()
                            }
                            self.accuracy = Double(numCorrect)/Double(numTries)
                        }){
                            Text(" 2 ")
                                .fontWeight(.bold)

                                .padding()
                        }
                        .background(RoundedRectangle(cornerRadius: 7)
                                        .fill(calcolor))
                        .foregroundColor(.black)
                        .padding()

                    }
                    .padding(.horizontal)
                    HStack{
                        Button(action: {
                            self.numTries += 1
                            if (3 == dateNum){
                                numCorrect += 1
                                (self.date,self.dateNum) = dateGen()
                            }
                            self.accuracy = Double(numCorrect)/Double(numTries)
                        }){
                            Text(" 3 ")
                                .fontWeight(.bold)

                            .padding()
                        }
                        .background(RoundedRectangle(cornerRadius: 7)
                                        .fill(calcolor))
                        .padding(.all, 13.0)
                        .foregroundColor(.black)
                        Button(action: {
                            self.numTries += 1
                            if (4 == dateNum){
                                numCorrect += 1
                                (self.date,self.dateNum) = dateGen()
                            }
                            self.accuracy = Double(numCorrect)/Double(numTries)
                        }){
                            Text(" 4 ")
                                .fontWeight(.bold)

                                .padding()
                        }
                        .background(RoundedRectangle(cornerRadius: 7)
                                        .fill(calcolor))
                        .padding(.all, 13.0)
                        .foregroundColor(.black)

                        Button(action: {
                            self.numTries += 1
                            if (5 == dateNum){
                                numCorrect += 1
                                (self.date,self.dateNum) = dateGen()
                            }
                            self.accuracy = Double(numCorrect)/Double(numTries)
                        }){
                            Text(" 5 ")
                                .fontWeight(.bold)

                                .padding()
                        }
                        .background(RoundedRectangle(cornerRadius: 7)
                                        .fill(calcolor))
                        .padding(.all, 13.0)
                        .foregroundColor(.black)
                    }
                    .padding(.horizontal)
                    HStack{
                        Button(action: {
                            self.numTries += 1
                            if (6 == dateNum){
                                numCorrect += 1
                                (self.date,self.dateNum) = dateGen()
                            }
                            self.accuracy = Double(numCorrect)/Double(numTries)
                        }){
                            Text(" 6 ")
                                .fontWeight(.bold)

                            .padding()
                        }
                        .background(RoundedRectangle(cornerRadius: 7)
                                        .fill(calcolor))
                        .padding(.all, 13.0)
                        .foregroundColor(.black)

                        .padding()
                    }
                    .padding(.horizontal)
                }
                .background(RoundedRectangle(cornerRadius: 25)
                        .fill(Color("bkgdColorLight")))
                .overlay(RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.black, lineWidth: 2))
              //MARK DEBUG
//                VStack{
//                    Text("DEBUG: " )
//                    Text("Accuracy: " + String(format: " %5.2f%", accuracy*100))
                    
//                    Text("Real Date: " + String(dateNum))
                    
//                    Text("Number of Tries: " + String(numTries))
                    
//                    Text("Number Correct: " + String(numCorrect))
//                }
                
                
            }
            
            .overlay(
                ProgressView(value: accuracy)
                    .padding()
                .progressViewStyle(LinearProgressViewStyle(tint: Color.green))
                    .position(CGPoint.init(x:200.0,y:845.0))
                )
            
            }
        }
            
    }
    
}
struct CalendarImage_Previews: PreviewProvider {
    static var previews: some View {
        CalendarImage()
            .previewDevice("iPhone 11")
    }
}
