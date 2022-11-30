//
//  DeadlineCardUtils.swift
//  TCCApp
//
//  Created by Vitor Souza on 23/11/22.
//

import Foundation

struct DeadlineCardUtils {
    static func createLabels(to endDate: Date) -> (String, String, String) {
        let components = Calendar.current.dateComponents([.day, .month], from: endDate)
        let day: String = { () -> String in
            if let day = components.day {
                return "\(day)"
            }
            return ""
        }()
        let month: String = Date.getMonthName(from: components.month, style: .short)
        let dateDistance: String = getDateDistante(from: endDate)
        
        return (day, month, dateDistance)
    }
    
    public static func getDateDistante(from date: Date) -> String {
        let components = Calendar.current.dateComponents([.day, .month, .year], from: .now, to: date)
        
        if let years = components.year, years >= 1 {
            if years == 1 {
                return "Próximo ano"
            }
            return "Daqui \(years) anos"
        } else if let months = components.month, months >= 1 {
            if months == 1 {
                return "Próximo mês"
            }
            return "Daqui \(months) meses"
        } else if let days = components.day, days >= 1 {
            if days > 7 {
                let weeks = days / 7
                if weeks == 1 {
                    return "Próxima semana"
                }
                return "Daqui \(weeks) semanas"
            } else if days == 1 {
                return "Amanhã"
            }
            
            return "Daqui \(days) dias"
        }
        return ""
    }
}
