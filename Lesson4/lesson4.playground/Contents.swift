protocol MultiSetProtocol {
    associatedtype T
    mutating func add(element: T)
    mutating func remove(element: T)
    func count(element: T) -> Int
    func totalCount() -> Int
}

struct MultiSet<T: Hashable>: MultiSetProtocol {
    
    private var dict = [T: Int]()
    
    mutating func add(element: T) {
        if contains(key: element) {
            dict[element]! += 1
        } else {
            dict[element] = 1
        }
    }
    
    mutating func remove(element: T) {
        if contains(key: element) {
            if dict[element] == 1 {
                dict[element] = nil
                return
            }
            dict[element]! -= 1
        } else {
            print("No such element")
        }
    }
    
    func count(element: T) -> Int {
        return dict[element] ?? 0
    }
    
    func totalCount() -> Int {
        return Array(dict.values).reduce(0, +)
    }
    
    private func contains(key: T) -> Bool {
        return dict[key] != nil
    }
}
