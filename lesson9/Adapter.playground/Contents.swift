
class Target {

    func request() -> String {
        return "Default print"
    }
}

class Reversed {
    
    public func specificRequest() -> String {
        return "tnirp desreveR"
    }
}

class Adapter: Target {

    private var reversed: Reversed

    init(_ reversed: Reversed) {
        self.reversed = reversed
    }

    override func request() -> String {
        return "Adapter: (TRANSLATED) " + reversed.specificRequest().reversed()
    }
}

class Client {

    static func someClientCode(target: Target) {
        print(target.request())
    }
}

class AdapterConceptual {

    func testAdapterConceptual() {
        
        Client.someClientCode(target: Target())
        let reversed = Reversed()

        print("reversed: " + reversed.specificRequest())

        Client.someClientCode(target: Adapter(reversed))
    }
}
