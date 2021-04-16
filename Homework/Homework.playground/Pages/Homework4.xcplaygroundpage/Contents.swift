//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
//: HOMEWORK4
//:1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//:2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//:3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//:4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//:5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//:6. Вывести значения свойств экземпляров в консоль.
enum trunkVolume {
    case full, empty
}
enum window {
    case open, close
}
enum engine {
    case benzine, diesel
}

enum spoiler {
    case yes, no
}

enum
hatch {
    case yes, no
}

enum hindcarriage {
    case yes, no
}

enum carcase {
    case close, tent, open
}


class Car {
    var brand: String
    var year: Int
    var trunkValue: Double
    var engine: engine
    var window: window
    var trunkVolume: trunkVolume
    
    init(brand: String, year: Int, trunkValue: Double, engine: engine, window: window, trunkVolume: trunkVolume) {
        self.brand = brand
        self.year = year
        self.trunkValue = trunkValue
        self.engine = engine
        self.window = window
        self.trunkVolume = trunkVolume
    }
    func benzineCar() {
        engine = .benzine
    }
    func dieselCar()  {
        engine = .diesel
    }
    func fullTrunk()  {
        trunkVolume = .full
    }
    func emptyTrunk() {
        trunkVolume = .empty
    }
    func openWindow() {
        window = .open
    }
    func closeWindow() {
        window = .close
    }
    
}
var car1 = Car(brand: "BMW", year: 2015, trunkValue: 400, engine: .diesel, window: .open, trunkVolume: .full)
car1
class SportCar: Car {
    var spoiler: spoiler
    var hatch: hatch
    init(brand: String, year: Int, trunkValue: Double, engine: engine, window: window, trunkVolume: trunkVolume, spoiler: spoiler, hatch: hatch) {
        self.spoiler = spoiler
        self.hatch = hatch
        super.init(brand: brand, year: year, trunkValue: trunkValue, engine: engine, window: window, trunkVolume: trunkVolume)
    }
    func yesSpoiler() {
        spoiler = .yes
    }
    func noSpoiler() {
        spoiler = .no
    }
    func yesHatch() {
        hatch = .yes
    }
    func nohatch() {
        hatch = .no
    }
    func char(Car: SportCar) {
        print("Модель: \(Car.brand)")
        print("Год выпуска: \(Car.year)")
        switch Car.engine {
        case .benzine:
            print("Двигатель: Бензиновый")
        default:
            print("Двигатель: Дизельный")
        }
        switch window {
        case .open:
            print("Окна: Открыты")
        default:
            print("Окна: Закрыты")
        }
        print("Объем багажника: \(Car.trunkValue)л.")
        switch Car.trunkVolume {
        case .full:
            print("Багажник: Заполнен")
        case .empty:
            print("Багажник: Пустой")
        }
        switch spoiler {
        case .yes:
            print("Спойлер: Есть")
        default:
            print("Спойлер: Отсутствует")
        }
        switch hatch {
        case .yes:
            print("Панорамная крыша: Есть")
        default:
            print("Панорамная крыша: Отсутствует")
        }
        print("-----------------------------------")
    }
}



var sportcar1 = SportCar(brand: "BMW", year: 2015, trunkValue: 300, engine: .benzine, window: .close, trunkVolume: .empty, spoiler: .yes, hatch: .yes)
var sportcar2 = SportCar(brand: "Lambo", year: 2017, trunkValue: 250, engine: .diesel, window: .open, trunkVolume: .empty, spoiler: .yes, hatch: .no)

sportcar1.openWindow()
sportcar2.benzineCar()

sportcar2.char(Car: sportcar2)
sportcar1.char(Car: sportcar1)



class TrunkCar: Car {
    var hindcarriage: hindcarriage
    var carcase: carcase
    init(brand: String, year: Int, trunkValue: Double, engine: engine, window: window, trunkVolume: trunkVolume, hindcarriage: hindcarriage, carcase: carcase) {
        self.hindcarriage = hindcarriage
        self.carcase = carcase
        super.init(brand: brand, year: year, trunkValue: trunkValue, engine: engine, window: window, trunkVolume: trunkVolume)
    }
    func openCarcase()  {
        carcase = .open
    }
    
    func closeCarcase()  {
        carcase = .close
    }
    func tentCarcase() {
        carcase = .tent
    }
    func yesHindcarriage()  {
        hindcarriage = .yes
    }
    
    func noHindcarriage() {
        hindcarriage = .no
    }
    func char(Car: TrunkCar) {
        print("Модель: \(Car.brand)")
        print("Год выпуска: \(Car.year)")
        switch Car.engine {
        case .benzine:
            print("Двигатель: Бензиновый")
        default:
            print("Двигатель: Дизельный")
        }
        switch window {
        case .open:
            print("Окна: Открыты")
        default:
            print("Окна: Закрыты")
        }
        print("Объем багажника: \(Car.trunkValue)л.")
        switch Car.trunkVolume {
        case .full:
            print("Багажник: Заполнен")
        case .empty:
            print("Багажник: Пустой")
        }
        switch carcase {
        case .open:
            print("Кузов: Открытый")
        case .close:
            print("Кузов: Закрытый")
        default:
            print("Кузов: Тентованный")
        }
        switch hindcarriage {
        case .yes:
            print("Прицеп: Есть")
        default:
            print("Прицеп: Отсутствует")
        }
        print("-----------------------------------")
    }
}

var conteineroVoz = TrunkCar(brand: "ВАЗ", year: 2010, trunkValue: 2444.5, engine: .benzine, window: .close, trunkVolume: .full, hindcarriage: .yes, carcase: .close)
//: trunk car 1,2,3
var samosval = TrunkCar(brand: "KAMAZ", year: 1999, trunkValue: 2500, engine: .benzine, window: .open, trunkVolume: .empty, hindcarriage: .no, carcase: .open)

conteineroVoz.openWindow()
conteineroVoz.brand = "Mercedes"


samosval.fullTrunk()
samosval.year = 2012
samosval.yesHindcarriage()


conteineroVoz.char(Car: conteineroVoz)
samosval.char(Car: samosval)
