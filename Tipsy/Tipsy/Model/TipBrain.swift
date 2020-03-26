//
//  TipBrain.swift
//  Tipsy


import Foundation

struct TipBrain {
    func calculatePerPerson(_ money: Double, _ decimalTip: Double, _ numberPeople: Int) -> Double {
        let totalTax = money * decimalTip
        let totalPerPerson = (totalTax + money) / Double(numberPeople)
        return totalPerPerson
    }
}
