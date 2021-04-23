//: [Previous](@previous)

import Foundation

//: HOMEWORK5
//:1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//:2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//:3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//:4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//:5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//:6. Вывести сами объекты в консоль.

enum TrunkVolume {
    case full, empty
}
enum Window {
    case open, close
}
enum Engine {
    case benzine, diesel
}

enum Spoiler {
    case yes, no
}

enum Hatch {
    case yes, no
}

enum Hindcarriage {
    case yes, no
}

enum Carcase {
    case close, tent, open
}


protocol CarProtocol: AnyObject {
    var brand: String {get}
    var year: Int {get}
    var trunkValue: Double {get}
    var engine: Engine {get set}
    var window: Window {get set}
    var trunkVolume: TrunkVolume {get set}
}

extension CarProtocol {
    func changeEngine(engine: Engine) {
        self.engine = engine
    }
    func changeWindow(window: Window) {
        self.window = window
    }
    func  changeTrunkVolume(trunkVolume: TrunkVolume) {
        self.trunkVolume = trunkVolume
    }
    
}


//class Car: CarProtocol {
//    var brand: String
//    var year: Int
//    var trunkValue: Double
//    var engine: Engine = .benzine
//    var window: Window = .close
//    var trunkVolume: TrunkVolume = .empty
//
//    init(brand: String, year: Int, trunkValue: Double) {
//        self.brand = brand
//        self.year = year
//        self.trunkValue = trunkValue
//    }
//}

class SportCar: CarProtocol, CustomStringConvertible {
    var brand: String
    var year: Int
    var trunkValue: Double
    var engine: Engine = .benzine
    var window: Window = .close
    var trunkVolume: TrunkVolume = .empty
    var spoiler: Spoiler = .yes
    var hatch: Hatch = .no
    init(brand: String, year: Int, trunkValue: Double) {
        self.brand = brand
        self.year = year
        self.trunkValue = trunkValue
    }
    var description: String {
        return """
Brand: \(brand)
Year: \(year)
Engine: \(engine)
Windows: \(window)
Trunk volume: \(trunkVolume)
Spoiler: \(spoiler)
Hatch: \(hatch)
"""
    }
}
extension SportCar {
    func changeSpoiler(spoiler: Spoiler) {
        self.spoiler = spoiler
    }
    func changeHatch(hatch: Hatch)  {
        self.hatch = hatch
    }
}

extension SportCar {
    func windowStatus() {
        if window == .open{
            print("""
------------------------
Please close the window
------------------------
""")
        }
        else {
            print("""
------------------------
Window closed
------------------------
""")
        }
    }
}


var mercedesSportCar = SportCar(brand: "Mercedes", year: 2019, trunkValue: 415.5)


mercedesSportCar.engine = .diesel
mercedesSportCar.window = .open
print(mercedesSportCar)
mercedesSportCar.windowStatus()

var lamborginiSportCar = SportCar(brand: "Lamborgini", year: 2014, trunkValue: 250)

lamborginiSportCar.spoiler = .no
lamborginiSportCar.hatch = .yes
print(lamborginiSportCar)
lamborginiSportCar.windowStatus()

class TrunkCar: CarProtocol, CustomStringConvertible {
    var brand: String
    var year: Int
    var trunkValue: Double
    var engine: Engine = .benzine
    var window: Window = .close
    var trunkVolume: TrunkVolume = .empty
    var hindcarriage: Hindcarriage = .yes
    var carcase: Carcase = .open
    init(brand: String, year: Int, trunkValue: Double) {
        self.brand = brand
        self.year = year
        self.trunkValue = trunkValue
    }
    var description: String {
        return """
Brand: \(brand)
Year: \(year)
Engine: \(engine)
Windows: \(window)
Trunk volume: \(trunkVolume)
Hindcarriage: \(hindcarriage)
Carcase: \(carcase)
"""
    }
}

extension TrunkCar {
    func changeHindcarriage(hindcarriage: Hindcarriage) {
        self.hindcarriage = hindcarriage
    }
    func changeCarcase(carcase: Carcase) {
        self.carcase = carcase
    }
}

extension TrunkCar {
    func repair() {
        if year <= 2010 {
            print("""
------------------------
The car needs repair
------------------------
""")
        }
        else {
            print( """
------------------------
The car does not need repair
------------------------
""" )
        }
    }
}

var vazTrunk = TrunkCar(brand: "Vaz", year: 2009, trunkValue: 1000)

vazTrunk.carcase = .tent
vazTrunk.window = .open
print(vazTrunk)
vazTrunk.repair()

var bmwTrunk = TrunkCar(brand: "BMW", year: 2016, trunkValue: 1200)

bmwTrunk.engine = .diesel
bmwTrunk.hindcarriage = .no
print(bmwTrunk)
bmwTrunk.repair()
