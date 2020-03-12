import UIKit

enum Currency {
    case usd
    case cad
    case mxn
}

let usToCad: Double = 1.38
let usToMxn: Double = 21.92

var currency: Currency = .mxn

let currencyFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter
} ()

func convert(_ dollars: Double) -> Double {
    var total: Double = 0.0
    
    switch currency {
    case .cad:
        total = dollars * usToCad
    case .mxn:
        total = dollars * usToMxn
    default:
        total = dollars
    }
    return total
    
}

func convert(amountString: String) -> String? {
    var total: String? = nil
    
    guard let amount = Double(amountString) else {
        print("We were unable to find your total.")
        return total
    }
    let converted = convert(amount)
    total = String(converted)
    
    guard let convertedTotal = total else {
       return total
    }
    print("The value of your conversion is \(convertedTotal).")
    return convertedTotal
}



convert(amountString: "" ) // error catch
convert(amountString: "1")
convert(amountString: "700")
