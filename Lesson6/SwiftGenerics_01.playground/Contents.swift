protocol Summable {
    static func +(firstValue: Self, secondValue: Self) -> Self
}

extension String: Summable {}

func sumTwoValues <T: Summable>(_ firstValue: T, _ secondValue: T) -> T {
    firstValue + secondValue
}

let c = "ABC"
let d = "DEF"

let resultString = sumTwoValues(c, d)
print(resultString)
