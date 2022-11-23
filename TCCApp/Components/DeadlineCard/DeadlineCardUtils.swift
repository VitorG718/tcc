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
        let month: String = getMonth(from: components.month)
        let dateDistance: String = getDateDistante(from: endDate)
        
        return (day, month, dateDistance)
    }
    
    public static func getMonth(from month: Int?) -> String {
        switch month {
        case 1: return "Jan"
        case 2: return "Fev"
        case 3: return "Mar"
        case 4: return "Abr"
        case 5: return "Mai"
        case 6: return "Jun"
        case 7: return "Jul"
        case 8: return "Ago"
        case 9: return "Set"
        case 10: return "Out"
        case 11: return "Nov"
        case 12: return "Dez"
        default: return ""
        }
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
