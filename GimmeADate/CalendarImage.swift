//
//  CalendarImage.swift
//  GimmeADate
//
//  Created by Drew Connelly on 2/11/21.
//

import SwiftUI
func dateGen() -> String {
    let year = Int.random(in: 1000...2200)
    var leap = false
    if (year % 100 == 0) && (year & 16 == 0) {
        leap = true
    }
    else if (year % 4 == 0){
        leap = true
    }
    let month = Int.random(in: 1...12)
    var day = 0
    if month == 2 {
        if (leap){
            day = Int.random(in: 1...29)
        }
        else {
        day = Int.random(in: 1...28)
        }
    }
    else if month <= 7 {
        if month % 2 == 0 {
            day = Int.random(in: 1...30)
        }
        else {
            day = Int.random(in: 1...31)
        }
    }
    else {
        if month % 2 == 0 {
            day = Int.random(in: 1...31)
        }
        else {
            day = Int.random(in: 1...30)
        }
    }
    let final = String(month) + " / " + String(day) + " / " + String(year)
    return(String(final))
}
struct CalendarImage: View {
    @State var date = dateGen()
    @State var calcolor = Color("calColor")
    @State var responseNum = -1
    var body: some View {
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
                        self.date = dateGen()
                    }){
                        Text("Generate a new date")
                            .fontWeight(.bold)
                            
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
                        self.responseNum = 0
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
                        self.responseNum = 1
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
                        self.responseNum = 2
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
                        self.responseNum = 3
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
                        self.responseNum = 4
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
                        self.responseNum = 5
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
                        self.responseNum = 6
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
                    .fill(Color.white))
            .overlay(RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.black, lineWidth: 2))
                    
            Text("Response (Test feature): " + String(responseNum))
          //  Text("Real Date (Test feature): " + date.Index[1...2])
        }
       
    }
}
struct CalendarImage_Previews: PreviewProvider {
    static var previews: some View {
        CalendarImage()
            .previewDevice("iPhone 11")
    }
}
