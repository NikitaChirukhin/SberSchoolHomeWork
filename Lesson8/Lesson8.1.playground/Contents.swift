import UIKit

enum MistakeInTerms: Error {
    case isEmpty(message: HomeWorkError)
    case aLotOfMistake(message: HomeWorkError)
    case invalid(message: HomeWorkError)
}

struct HomeWorkError: Error {
    
    var localizedDescription: String
}

class HomeWork {
    
    var homeWorkTask: [String]
    var mistake = 0.0
    private var listOfMistake: [String] = []
    
    private func isValid(task: String) -> Bool {

        let element = task.split(separator: " ")

        if element.count <= 4 {
            return false
        }

        if (element[1] == "+" || element[1] == "-") && element[3] == "=" {
            if let _ = Int(element[0]), let _ = Int(element[2]),
               let _ = Int(element[4]) {
                return true
            }
        }
        return false
    }
    
    func checkTask (task: String) -> String {

        let element = task.split(separator: " ")
        
        if element[1] == "+" {
            if let element1 = Int(element[0]), let element2 = Int(element[2]),
               let result = Int(element[4]) {
                if element1 + element2 == result {
                    return "\(task) - молодец"
                } else {
                    mistake += 1
                    listOfMistake.append(task)
                    return "\(task) - неправильно, Правильный ответ \(element1 + element2)"
                }
            }
        } else {
            if let element1 = Int(element[0]), let element2 = Int(element[2]),
               let result = Int(element[4]) {
                if element1 - element2 == result {
                    return "\(task) - молодец"
                } else {
                    mistake += 1
                    return "\(task) - неправильно, Правильный ответ \(element1 - element2)"
                }
            }
        }
        return "Fatal Error"
    }
    
    func checkHomeWork() -> MistakeInTerms {
        if homeWorkTask.count == 0 {
            print("Нет примеров")
            return .isEmpty(message: HomeWorkError(localizedDescription: "нет примеров"))
        }
        for element in homeWorkTask {
            if !isValid(task: element) {
                print("Переделывай")
                return .invalid(message: HomeWorkError(localizedDescription: "переделывай"))
            }
            print(checkTask(task: element))
        }
        if mistake / Double(homeWorkTask.count) > 0.75 {
            for task in listOfMistake {
                print(task)
            }
            print("Делай заново")
            return .aLotOfMistake(message: HomeWorkError(localizedDescription: "делай заново"))
        }
        return .isEmpty(message: HomeWorkError(localizedDescription: "TEST"))
    }
    
    init (homeWorkTask: [String]) {
        self.homeWorkTask = homeWorkTask
    }
}

let arrayTask = ["22 + 11 = 33", "213 + 1 = 214", "21 + 9 = 30"]

let arrayInvalidInput = ["kdfnkdnf"]

let emptyArray = [String]()

let invalidArrayTask = ["22 * 11 = 33", "213 + 1 = 214", "21 + 9 = 30"]

let array75 = ["22 - 11 = 33", "213 - 1 = 214", "21 - 9 = 30", "1 + 1 = 2", "1 + 2 = 5", "0 + 1 = 6"]

HomeWork(homeWorkTask: arrayTask).checkHomeWork()
HomeWork(homeWorkTask: arrayInvalidInput).checkHomeWork()
HomeWork(homeWorkTask: emptyArray).checkHomeWork()
HomeWork(homeWorkTask: invalidArrayTask).checkHomeWork()
HomeWork(homeWorkTask: array75).checkHomeWork()


