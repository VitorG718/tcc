//
//  Date+MonthName.swift
//  TCCApp
//
//  Created by Vitor Souza on 30/11/22.
//

import Foundation

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
