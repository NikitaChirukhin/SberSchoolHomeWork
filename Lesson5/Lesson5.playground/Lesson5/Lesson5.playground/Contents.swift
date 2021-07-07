func sum (firstTerm: String, secondTerm: String) -> String {
    var sum: String = ""
    var str1 = firstTerm
    var str2 = secondTerm
    var num2: String = ""
    var num1: String = ""
    var ost = 0
    if str1.count > str2.count {
        for _ in 1...str1.count {
            if let value = str2.last {
                num2 = String(value)
                str2.removeLast()
            } else {
                num2 = "0"
            }
            if let value = str1.last {
                num1 = String(value)
                str1.removeLast()
            } else {
                num1 = "0"
            }
            if ((Int(num1) ?? 0) + (Int(num2) ?? 0) + ost < 10) {
                sum += String(((Int(num1) ?? 0) + (Int(num2) ?? 0) + ost) % 10)
                ost = 0
            } else {
                sum += String(((Int(num1) ?? 0) + (Int(num2) ?? 0) + ost) % 10)
                ost = 1
            }
        }
    }
    return String(sum.reversed())
}

let firstValue = "10000000000000000000001"
let secondValue = "9999999999999"


print(sum(firstTerm: firstValue, secondTerm: secondValue))
