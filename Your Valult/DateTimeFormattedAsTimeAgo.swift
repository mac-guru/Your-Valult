//
//  DateTimeFormattedAsTimeAgo.swift
//  Swift Time Ago
//
//  Created by Julien Colin on 4/17/15.
//  Copyright (c) 2015 Toldino. All rights reserved.
// This is open source library which i used to format date

import Foundation

public func dateTimeFormattedAsTimeAgo(date: NSDate, referenceDate now: NSDate = NSDate()) -> String {

  let secondsFromDate = now.secondsFrom(date)
  if secondsFromDate < 60 {
    return secondsFormatter()
  }
  
  let minutesFromDate = now.minutesFrom(date)
  if minutesFromDate < 60 {
    return minutesFormatter(minutesFromDate)
  }
  
  let hoursFromDate = now.hoursFrom(date)
  if hoursFromDate < 24 {
    return hoursFormatter(hoursFromDate)
  }
  
  let daysFromDate = now.daysFrom(date)
  switch daysFromDate {
  case 1:
    return yesterdayFormatter()
  case 2...6:
    return daysFormatter(daysFromDate)
  default:
    break
  }
  
  let weeksFromDate = now.weeksFrom(date)
  let monthsFromDate = now.monthsFrom(date)
  switch monthsFromDate {
  case 0:
    return weeksFormatter(weeksFromDate)
  case 1...11:
    return monthsFormatter(monthsFromDate)
  default:
    break
  }
  
  let yearsFromDate = now.yearsFrom(date)
  return yearsFormatter(yearsFromDate)
}

// MARK: Formatter functions

func classicFormatterAgo(quantity: Int, unit: String) -> String {
  var formattedString = "\(quantity) \(unit)"
  if quantity > 1 {
    formattedString += "s"
  }
  formattedString += " ago"
  return formattedString
}

func secondsFormatter() -> String {
  return "Just now"
}

func minutesFormatter(minutes: Int) -> String {
  return classicFormatterAgo(minutes, unit: "minute")
}

func hoursFormatter(hours: Int) -> String {
  return classicFormatterAgo(hours, unit: "hour")
}

func yesterdayFormatter() -> String {
  return "Yesterday"
}

func daysFormatter(days: Int) -> String {
  return classicFormatterAgo(days, unit: "day")
}

func weeksFormatter(weeks: Int) -> String {
  return classicFormatterAgo(weeks, unit: "week")
}

func monthsFormatter(months: Int) -> String {
  return classicFormatterAgo(months, unit: "month")
}

func yearsFormatter(years: Int) -> String {
  return classicFormatterAgo(years, unit: "year")
}

// MARK: Extension of NSDate

private extension NSDate {
  func yearsFrom(date:NSDate) -> Int{
    return NSCalendar.currentCalendar().components(NSCalendarUnit.Year, fromDate: date, toDate: self, options: []).year
  }
  func monthsFrom(date:NSDate) -> Int{
    return NSCalendar.currentCalendar().components(NSCalendarUnit.Month, fromDate: date, toDate: self, options: []).month
  }
  func weeksFrom(date:NSDate) -> Int{
    return NSCalendar.currentCalendar().components(NSCalendarUnit.WeekOfYear, fromDate: date, toDate: self, options: []).weekOfYear
  }
  func daysFrom(date:NSDate) -> Int{
    return NSCalendar.currentCalendar().components(NSCalendarUnit.Day, fromDate: date, toDate: self, options: []).day
  }
  func hoursFrom(date:NSDate) -> Int{
    return NSCalendar.currentCalendar().components(NSCalendarUnit.Hour, fromDate: date, toDate: self, options: []).hour
  }
  func minutesFrom(date:NSDate) -> Int{
    return NSCalendar.currentCalendar().components(NSCalendarUnit.Minute, fromDate: date, toDate: self, options: []).minute
  }
  func secondsFrom(date:NSDate) -> Int{
    return NSCalendar.currentCalendar().components(NSCalendarUnit.Second, fromDate: date, toDate: self, options: []).second
  }
}