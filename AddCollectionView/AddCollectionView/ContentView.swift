//
//  ContentView.swift
//  AddCollectionView
//
//  Created by Xavier Polisetty on 8/19/21.
//

import SwiftUI

struct ContentView: View {
    
    private var sixColumnGrid = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    func createDateRangeFor1Day(currentDate: Date) -> [Date] {
        let userCalendar: Calendar = Calendar.current
        // Should this be autoupdatingCurrent ???
        
        
        let startOfCurrentDate: Date = getStartofDay(userCalendar: userCalendar, currentDate: currentDate, value: 0)
        let endOfCurrentDate: Date = getStartofDay(userCalendar: userCalendar, currentDate: currentDate, value: 1)
        
        return generateTenMin(from: startOfCurrentDate, to: endOfCurrentDate)
    }
    
   
    
    
    var body: some View {
        
        
        
        
        ScrollView(showsIndicators: true) {
            LazyVGrid(columns: sixColumnGrid, spacing: 20) {
                
                ForEach(tenMinArray, id: \.self) { date in
                    
                    let formatter = DateFormatter()
                    formatter.dateFormat = "mm"
                    let minutes: String = formatter.string(from: date)
                    TimeCodeCell(minutes: minutes)
                    

                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func getStartofDay(userCalendar: Calendar, currentDate: Date, value: Int) -> Date {
    var components = DateComponents()
    components.day = value
    var newDay: Date = userCalendar.date(byAdding: components, to: currentDate)!
    newDay = userCalendar.startOfDay(for: newDay)
    return newDay
}

func generateTenMin(from: Date, to: Date) -> [Date] {
    // in case of the "from" date is more than "to" date,
    // it should returns an empty array:
    
    
    if from > to { return [Date]() }

    var tempDate = from
    var array = [tempDate]

    while tempDate < to {
        tempDate = Calendar.current.date(byAdding: .minute, value: 10, to: tempDate)!
        array.append(tempDate)
    }

    array.removeLast()
    
    return array
}
