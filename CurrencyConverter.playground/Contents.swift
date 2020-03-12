import UIKit

enum Currency {
    case usd
    case cad
    case mxn
}

let usToCad: Double = 1.38
let usToMxn: Double = 21.92

var currency: Currency = .cad

func convert(dollars: Double) -> Double {
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

