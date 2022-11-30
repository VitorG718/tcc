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

extension Date {
    public enum ResultFormatStyle {
        case short, long
    }
    
    public static func getMonthName(from month: Int?, style: ResultFormatStyle) -> String {
        let monthName: String = {
            switch month {
            case 1: return "Janeiro"
            case 2: return "Fevereiro"
            case 3: return "Março"
            case 4: return "Abril"
            case 5: return "Maio"
            case 6: return "Junho"
            case 7: return "Julho"
            case 8: return "Agosto"
            case 9: return "Setembro"
            case 10: return "Outubro"
            case 11: return "Novembro"
            case 12: return "Dezembro"
            default: return ""
            }
        }()
        
        switch style {
        case .short:
            return String(monthName.prefix(3))
        case .long:
            return monthName
        }
    }
}
