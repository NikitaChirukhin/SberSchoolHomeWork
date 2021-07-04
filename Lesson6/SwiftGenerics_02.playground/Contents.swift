protocol Container {
    
    associatedtype T
    mutating func add(element: T)
    var count: Int { get }
    subscript(_ index: Int) -> T? { get }
}

class LinkedListNode<T> {
    
    var value: T
    var nextValue: LinkedListNode?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    
    typealias Node = LinkedListNode<T>
    
    private var head: Node?
    private var tail: Node?
    
    var isEmpty: Bool {
        head == nil
    }
}

extension LinkedList: Container {
    
    public func add(element value: T) {
        
        let newNode = Node(value: value)
        if let tailNode = tail {
            tailNode.nextValue = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    var count: Int {
        
        var node = head
        var count = 0
        
        if node == nil {
            return count
        } else {
            while node != nil {
                count += 1
                node = node!.nextValue
            }
        }
        return count
        
    }
    
    subscript(_ index: Int) -> T? {
        
        var node = head
        var i = 0
        while i != index {
            i += 1
            node = node!.nextValue
        }
        return node?.value
    }
    
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        var text = "["
        var node = head
        while node != nil {
            text += "\(node!.value)"
            node = node!.nextValue
            if node != nil { text += ", " }
        }
        return text + "]"
    }
    
}

extension LinkedListNode: CustomStringConvertible {
    
    public var description: String {
        return "\(value)"
    }
    
}

struct Queue<T> {
    
    var queue: [T] = []
    
    var count: Int {
        return queue.count
    }
    
    mutating func add(element: T) {
        queue.append(element)
    }
    
    private var head: T? {
        return queue.first
    }
    private var tail: T? {
        return queue.last
    }
}

extension Queue: Container {

    subscript(_ index: Int) -> T? {
        return queue[index]
    }
}

print("FIFO:")

var fifo = Queue<String>()

fifo.add(element: "Mouse")
fifo.add(element: "Dog")
fifo.add(element: "Cat")
if let sumValue = fifo[2] {
    print(sumValue)
}
print(fifo.count)
print(fifo.queue)


print()
print("LinkedList:")

var queue = LinkedList<Int>()

queue.add(element: 1)
queue.add(element: 5)
queue.add(element: 8)
if let sumValue = queue[2] {
    print(sumValue)
}
print(queue.count)
print(queue.isEmpty)
print(queue.description)
