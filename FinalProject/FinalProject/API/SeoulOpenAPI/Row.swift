//
//  Row.swift
//  FinalProject
//
//  Created by idinaloq on 2023/10/10.
//

struct Row: Decodable {
    let parkingCode, parkingName, address, parkingType: String
    let parkingTypeName, operationRule, operationRuleName, tel: String
    let queStatus, queStatusName: String
    let capacity, currentParking: Int
    let currentParkingTime, pay, payName, nightFreeOpen: String
    let nightFreeOpenName, weekdayBeginTime, weekdayEndTime, weekendBeginTime: String
    let weekendEndTime, holidayBeginTime, holidayEndTime, saturdayPay: String
    let saturdayPayName, holidayPay, holidayPayName, fulltimeMonthly: String
    let grpParkNumber: String
    let rates, timeRate, addRates, addTimeRate: Int
    let dayMaximum: Int
    let lat, lng: Double

    enum CodingKeys: String, CodingKey {
        case parkingCode = "PARKING_CODE"
        case parkingName = "PARKING_NAME"
        case address = "ADDR"
        case parkingType = "PARKING_TYPE"
        case parkingTypeName = "PARKING_TYPE_NM"
        case operationRule = "OPERATION_RULE"
        case operationRuleName = "OPERATION_RULE_NM"
        case tel = "TEL"
        case queStatus = "QUE_STATUS"
        case queStatusName = "QUE_STATUS_NM"
        case capacity = "CAPACITY"
        case currentParking = "CUR_PARKING"
        case currentParkingTime = "CUR_PARKING_TIME"
        case pay = "PAY_YN"
        case payName = "PAY_NM"
        case nightFreeOpen = "NIGHT_FREE_OPEN"
        case nightFreeOpenName = "NIGHT_FREE_OPEN_NM"
        case weekdayBeginTime = "WEEKDAY_BEGIN_TIME"
        case weekdayEndTime = "WEEKDAY_END_TIME"
        case weekendBeginTime = "WEEKEND_BEGIN_TIME"
        case weekendEndTime = "WEEKEND_END_TIME"
        case holidayBeginTime = "HOLIDAY_BEGIN_TIME"
        case holidayEndTime = "HOLIDAY_END_TIME"
        case saturdayPay = "SATURDAY_PAY_YN"
        case saturdayPayName = "SATURDAY_PAY_NM"
        case holidayPay = "HOLIDAY_PAY_YN"
        case holidayPayName = "HOLIDAY_PAY_NM"
        case fulltimeMonthly = "FULLTIME_MONTHLY"
        case grpParkNumber = "GRP_PARKNM"
        case rates = "RATES"
        case timeRate = "TIME_RATE"
        case addRates = "ADD_RATES"
        case addTimeRate = "ADD_TIME_RATE"
        case dayMaximum = "DAY_MAXIMUM"
        case lat = "LAT"
        case lng = "LNG"
    }
}
