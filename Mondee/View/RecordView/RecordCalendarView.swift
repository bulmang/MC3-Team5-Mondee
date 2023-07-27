//
//  RecordCalendarView.swift
//  Mondee
//
//  Created by seunghoria on 2023/07/24.
//

import SwiftUI

struct RecordCalendarView: View {
    let dateFormatter = DateFormatter()
    
    @Binding var currentDate : Date //현재 날짜
    @State var currentMonth : Int = 0 // 화살표 클릭으로 인한 월 세는 변수
    
    //MARK: Database
    let days: [String] = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    let columns = Array(repeating: GridItem(.flexible()), count: 7) //달력 틀
    
    var body: some View {
        VStack(spacing: 10) {
            // 월, 년도, 좌화살표, 우화살표 포함 Stack
            HStack(spacing: 20){
                // 월, 년도 Stack
                HStack(spacing: 5){
                    // 월 Text (ex. May)
                    Text(extraDate()[1])
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(Color("ColorGray"))
                    
                    // 년도 Text (ex. 2023)
                    Text(extraDate()[0])
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(Color("ColorGray"))
                }
                Spacer(minLength: 0)
                
                // 좌화살표 버튼
                Button {
                    print(currentMonth)
                    currentMonth -= 1
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(Color("ColorGray"))
                }
                
                // 우화살표 버튼
                Button {
                    currentMonth += 1
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                        .foregroundColor(Color("ColorGray"))
                }
            }
            .padding(.bottom, 40)

            // 상단 요일 Stack
            HStack(spacing: 14){
                ForEach(days,id: \.self){day in
                    Text(day)
                        .font(.system(size: 13, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color("ColorGray"))
                }
            }
           // .padding(.horizontal, 2)
            
            // Dates....
            // Lazy Grid..
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(extractDate()){ value in
                    CardView(value: value)
                        .font(isSameDay(date1: value.date, date2: Date()) ? .system(size: 20, weight: .bold) : .system(size: 20, weight: .regular))
                        .foregroundColor(isSameDay(date1: value.date, date2: Date()) ? .blue : .black)
//                        .background(
//                            Image("bubbles")
//                        )
                }
            }
            Spacer()
        }
        // 월 변경시 새로운 월 업데이트
        .onChange(of: currentMonth){newValue in
            currentDate = getCurrentMonth()
        }
    }
    
    // 달력 각각 날짜 뷰
    @ViewBuilder
    func CardView(value: DateValue)->some View{
        VStack{
            if value.day != -1 {
                Text("\(value.day)")
            }
        }
        .padding(.vertical, 8)
        .frame(height: 36, alignment: .top)
        
    }

    //MARK: 날짜 확인 코드
    private func isSameDay(date1: Date, date2: Date) -> Bool{
        let calendar = Calendar.current

        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    
    //MARK: YYYY MMMM 형태로 날짜 형식 바꾸는 함수
    private func extraDate()->[String]{
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    
    //MARK: 현재 월 반환해주는 함수
    private func getCurrentMonth()->Date{
        
        let calendar = Calendar.current
        
        //Getting Current Month Date
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else{
            return Date()
        }
        
        return currentMonth
    }
    
    //MARK: 날짜 추출해주는 함수
    private func extractDate()->[DateValue]{
        
        let calendar = Calendar.current
        
        //현재 월 반환
        let currentMonth = getCurrentMonth()
        var days =  currentMonth.getAllDates().compactMap{
            date -> DateValue in
        //날짜 반환
        let day = calendar.component(.day, from: date)
        return DateValue(day: day, date: date)
        }
        
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1{
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        return days
    }
}

struct RecordCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("ColorBgLight")
            RecordCalendarView(currentDate: .constant(Date()))
        }
    }
}
