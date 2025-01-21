import UIKit

// tipo implícito
var greeting = "Hello, playground fernando"

// tipo explícito
var name: String = "Fernando"

// tipo constante - não pode ser alterado
let lastName: String = "Felício"

// lastName = "da Costa" // dará o seguinte erro: Cannot assign to value: 'sobrenome' is a 'let' constant

// definição de tipos
var carName: String = "Ford KA"
var engine: String = "8V"
var numberOfWheels: Int = 4
var numberOfPassengers: Int = 5

// class
class Car {
    var carName: String
    var engine: String
    var numberOfWheels: Int
    var numberOfPassengers: Int

    // init - construtor
    init(carName: String, engine: String, numberOfWheels: Int, numberOfPassengers: Int) {
        self.carName = carName
        self.engine = engine
        self.numberOfWheels = numberOfWheels
        self.numberOfPassengers = numberOfPassengers
    }
    
    public func getNumberOfPassengers() -> Int {
        return self.numberOfPassengers
    }
}

// usando a classe
let fordKA: Car = Car(carName: "Ford KA", engine: "8V", numberOfWheels: 4, numberOfPassengers: 5)
fordKA.getNumberOfPassengers()
let onix: Car = Car(carName: "Ônix", engine: "8V", numberOfWheels: 4, numberOfPassengers: 5)
onix.getNumberOfPassengers()

// Optional (null - kotlin/java)
// on iOS there is no protected modifier, there is only private or public (default)
class Car2 {
    var carName: String
    var engine: String
    var numberOfWheels: Int
    private var numberOfPassengers: Int
    var wheelHeight: Int?

    // init - construtor
    init(carName: String, engine: String, numberOfWheels: Int, numberOfPassengers: Int, wheelHeight: Int? = nil) {
        self.carName = carName
        self.engine = engine
        self.numberOfWheels = numberOfWheels
        self.numberOfPassengers = numberOfPassengers
        self.wheelHeight = wheelHeight
    }
    
    public func getNumberOfPassengers() -> Int {
        return self.numberOfPassengers
    }
    
    public func getWheelHeight() -> Int? {
        return self.wheelHeight
    }
}

let mobi: Car2 = Car2(carName: "Mobi", engine: "8V", numberOfWheels: 4, numberOfPassengers: 5)
print(mobi.getWheelHeight()) // show "nil"

let civic: Car2 = Car2(carName: "Mobi", engine: "8V", numberOfWheels: 4, numberOfPassengers: 5, wheelHeight: 16)
print(civic.getWheelHeight()) // show "Optional(16)"

if mobi.getWheelHeight() == civic.getWheelHeight() {
    print("same wheels")
} else {
    print("impossible wheels")
}

// creates the variable only if there is a value
// the approach below avoids allocating unnecessary memory due to the "wheelHeightFordKA" and "wheelHeightCivic" variables
// be created and used only within the scope
if let wheelHeightFordKA = mobi.getWheelHeight(), let wheelHeightCivic = civic.getWheelHeight() {
    // variables will only exist here within the block
    if wheelHeightFordKA == wheelHeightCivic {
        print("same wheels")
    } else {
        print("impossible wheels")
    }
} else {
    print("one of the variables does not exist")
}

func conferWheelHeight(car: Car2) -> Int {
    // return car.wheelHeight! // never use this format, can occurs crash
    return car.wheelHeight ?? 0
}

func conferWheelHeight2(car: Car2) -> Int {
    // the "guard let" is often used when using Optional
    // it stores the value in the variable if it satisfies, but it can be used outside the scope of the function
    guard let wheelHeightFromCar: Int = car.wheelHeight else {
        print("wheel height not exists")
        return 0
    }
    return wheelHeightFromCar
}

conferWheelHeight(car: mobi)
print(mobi.wheelHeight)

print(conferWheelHeight2(car: mobi))
