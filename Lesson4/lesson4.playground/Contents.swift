protocol MultiSetProtocol {
    associatedtype T
    mutating func add(element: T)
    mutating func remove(element: T)
    func count(of element: T) -> Int
    func totalCount() -> Int
}

struct MultiSet<T: Hashable>: MultiSetProtocol {
    
    private var set = Set<[T: Int]>()
    
    mutating func add(element: T) {
        if contains(element: element) {
            set.forEach { dictionary in
                if let count = dictionary[element] {
                    set.remove(dictionary)
                    set.insert([element: count + 1])
                }
            }
        } else {
            set.insert([element: 1])
        }
    }
    
    mutating func remove(element: T) {
        if contains(element: element) {
            set.forEach { dictionary in
                if let count = dictionary[element] {
                    set.remove(dictionary)
                    if count != 1 {
                        set.insert([element: count - 1])
                    }
                }
            }
        } else {
            print("No such element")
        }
    }
    
    func count(of element: T) -> Int {
        var count = 0
        set.forEach { dictionary in
            if let num = dictionary[element] {
                count = num
            }
        }
        return count
    }
    
    func totalCount() -> Int {
        var count = 0
        set.forEach { dictionary in
            let num = dictionary.values.reduce(0, +)
            count += num
        }
        return count
    }
    
    private func contains(element: T) -> Bool {
        set.contains(where: { dictionary in
            if dictionary[element] != nil {
                return true
            }
            return false
        })
    }
}
