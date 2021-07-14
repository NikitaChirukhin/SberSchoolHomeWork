import UIKit

final class Singleton {
    
    private static var uniqueSingleton = Singleton()
    
    static func shared() -> Singleton {
        return Singleton()
    }
    
    private init () {}
}

Singleton.shared()
