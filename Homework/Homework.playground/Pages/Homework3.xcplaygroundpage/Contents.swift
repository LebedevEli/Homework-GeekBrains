//: [Previous](@previous)

import Foundation

enum trunkVolume {
    case full, empty
}

//: 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.✅
//:2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.✅
//:3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.✅
//:4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.✅
//:5. Инициализировать несколько экземпляров структур. Применить к ним различные действия. // Вроде сделал, но немного недопонял эту тему. Не уверен в правильности решения.❓
//:6. Вывести значения свойств экземпляров в консоль.✅
struct sportCar {
    var brand: String
    var year: Int
    var trunkValue: Double
    var  engine: Bool
    var  window: Bool
    var  trunkVolume: trunkVolume
    
    init(brand: String, year: Int, trunkValue: Double, engine: Bool, window: Bool, trunkVolume: trunkVolume) {
        self.brand = brand
        self.year = year
        self.trunkValue = trunkValue
        self.engine = engine
        self.window = window
        self.trunkVolume = trunkVolume
    }
    
    mutating func trunkVolEmp() {
        self.trunkVolume = .empty
        
    }
    mutating func trunkVolFull() {
        self.trunkVolume = .full
    }
    mutating func carWindowOpen() {
        self.window = true
    }
    mutating func carWindowClose() {
        self.window = false
    }
    mutating func carEngineStart() {
        self.engine = true
    }
    mutating func carEngineStop() {
        self.engine = false
    }
}





func carCar(car: sportCar) {
    print("-----------------------------------")
    print("Модель: \(car.brand)")
    print("Год выпуска: \(car.year)")
    print("Двигатель: \(car.engine ? "запущен" : "заглушен")")
    print("Окна: \(car.window ? "открыты" : "закрыты")")
    print("Объем багажника: \(car.trunkValue)л.")
    switch car.trunkVolume {
    case .full:
        print("Багажник: заполнен")
    case .empty:
        print("Багажник: пустой")
    }
    
}

var sportCar1 = sportCar.init(brand: "Audi", year: 2014, trunkValue: 454, engine: true, window: false, trunkVolume: .empty)
sportCar1.brand = "Mercedes"
sportCar1.year = 2015
sportCar1.engine = false
carCar(car: sportCar1)

var car = sportCar(brand: "BMW", year: 2016, trunkValue: 450.5, engine: true, window: false, trunkVolume: .empty)
var car1 = sportCar(brand: "Mercedes", year: 2015, trunkValue: 400, engine: false, window: false, trunkVolume: .full)
var car2 = sportCar(brand: "Lada", year: 2012, trunkValue: 350.5, engine: false, window: true, trunkVolume: .full)
car2.trunkVolEmp()
car1.carWindowOpen()
car.carEngineStop()
carCar(car: car)
carCar(car: car1)
carCar(car: car2)

print("-----------------------------------------")

struct TrunkCar {
    var brand: String
    var year: Int
    var trunkValue: Double
    var  engine: Bool
    var  window: Bool
    var  trunkVolume: trunkVolume
    
    init(brand: String, year: Int, trunkValue: Double, engine: Bool, window: Bool, trunkVolume: trunkVolume) {
        self.brand = brand
        self.year = year
        self.trunkValue = trunkValue
        self.engine = engine
        self.window = window
        self.trunkVolume = trunkVolume
    }
    
    mutating func trunkVolEmp() {
        self.trunkVolume = .empty
        
    }
    mutating func trunkVolFull() {
        self.trunkVolume = .full
    }
    mutating func trunkWindowOpen() {
        self.window = true
    }
    mutating func trunkWindowClose() {
        self.window = false
    }
    mutating func trunkEngineStart() {
        self.engine = true
    }
    mutating func trunkEngineStop() {
        self.engine = false
    }
}

func trunkCar(car: TrunkCar) {
    print("Модель: \(car.brand)")
    print("Год выпуска: \(car.year)")
    print("Двигатель: \(car.engine ? "запущен" : "заглушен")")
    print("Окна: \(car.window ? "открыты" : "закрыты")")
    print("Объем багажника: \(car.trunkValue)л.")
    switch car.trunkVolume {
    case .full:
        print("Багажник: заполнен")
    case .empty:
        print("Багажник: пустой")
    }
    print("-----------------------------------")
    
}
var trunk3 = TrunkCar.init(brand: "OAZIK", year: 1970, trunkValue: 1000, engine: true, window: true, trunkVolume: .full)
trunk3.brand = "ВАЗ"
trunk3.year = 1979
trunk3.trunkValue = 1115.5
trunkCar(car: trunk3)


var trunk = TrunkCar(brand: "GAZEL", year: 1999, trunkValue: 1500.5, engine: false, window: false, trunkVolume: .full)
var trunk1 = TrunkCar(brand: "Mercedes", year: 2020, trunkValue: 2000, engine: true, window: true, trunkVolume: .empty)
var trunk2 = TrunkCar(brand: "BMW", year: 2016, trunkValue: 1750.4, engine: false, window: true, trunkVolume: .full)

trunk.trunkEngineStart()
trunk2.trunkVolEmp()
trunk1.window = false
trunkCar(car: trunk1)
trunk.brand = "GAZ"
trunkCar(car: trunk)
trunkCar(car: trunk2)

