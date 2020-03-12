import UIKit

enum Currency {
    case usd
    case cad
    case mxn
    case euro
}

let usToCad: Double = 1.38
let usToMxn: Double = 21.92
let usToEuro: Double = 0.90

var currency: Currency = .euro


func convertTotalToCurrency(amount: Double) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .currency
    return numberFormatter.string(from: NSNumber(value: amount))! //Force unwrappring here not sure how to work around that?
}


func convert(_ dollars: Double) -> Double {
    var total: Double = 0.0
    
    switch currency {
    case .cad:
        total = dollars * usToCad
    case .mxn:
        total = dollars * usToMxn
    case .euro:
        total = dollars * usToEuro
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
    print("THIS IS CONVERTED \(converted)")
    total = convertTotalToCurrency(amount: converted)
    
    guard let convertedTotal = total else {
       return total
    }
    
    print("The value of your conversion is \(convertedTotal).")
    return convertedTotal
}



convert(amountString: "" ) // error catch
convert(amountString: "1")
convert(amountString: "700")
