extension Array
{
    func mapUsingReduce<T>(_ transform: (Element) -> T) -> [T] {
        return reduce([]) { result, x in
            return result + [transform(x)]
        }
    }
    func filterUsingReduce(_ includeElement: (Element) -> Bool) -> [Element] {
        return reduce([]) { result, x in
            return includeElement(x) ? result + [x] : result
        }
    }
}

var array = [1, 2, 4, 6]
let mapReduce = array.mapUsingReduce { $0 * $0 }
let filterReduce = array.filterUsingReduce { $0 > 3 }

print(mapReduce)
print(filterReduce)
