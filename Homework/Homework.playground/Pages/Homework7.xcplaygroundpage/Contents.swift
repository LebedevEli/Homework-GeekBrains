//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
//: 1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.

struct Beer {
    var price: Double
    var count: UInt
    let beer: BeerName
}
struct BeerName {
    let name: String
}

class BeerRefrigerator {
    var invertoty = [
        
        "Бельгийское пиво": Beer(price: 150, count: 14, beer: BeerName(name: "Бельгийское пиво")),
        "Немецкое пиво": Beer(price: 180, count: 9, beer: BeerName(name: "Немецкое пиво")),
        "Российское пиво": Beer(price: 120, count: 0, beer: BeerName(name: "Российское пиво"))
    ]
    
    
    var buyerDeposit: Double = 160.5
    
    func buy(beerName name: String) -> BeerName? {
        guard let Beer = invertoty[name] else {
            return nil
        }
        guard  Beer.count > 0 else {
            return nil
        }
        guard Beer.price <= buyerDeposit else {
            return nil
        }
        buyerDeposit -= Beer.price
        let newBeer = Beer
        invertoty[name] = newBeer
        print("Выдача \(name)")
        return newBeer.beer
    }
}

let beerBuy = BeerRefrigerator()
beerBuy.buy(beerName: "Бельгийское пиво")
beerBuy.buy(beerName: "Российское пиво")
beerBuy.buy(beerName: "Germany beer")

enum BeerRefrigeratorError: Error {
    case invalidSelection
    case outOfStock
    case insufficientFunds(depositNeed: Double)
    
    var errorDescription: String {
        switch self {
        case .invalidSelection:
            return "Данного вида пива нет в ассортименте."
        case .outOfStock:
            return "Данного вида пива нет в наличии."
        case.insufficientFunds(depositNeed: let depositNeed):
            return "Недостаточно средств, не хватает \(depositNeed) рублей"
        }
    }
}

extension BeerRefrigerator {
    func buyBeerWithError(beerName name: String) -> (beer: BeerName?, error: BeerRefrigeratorError?) {
        guard let Beer = invertoty[name] else {
            return(beer: nil, error: BeerRefrigeratorError.invalidSelection)
        }
        guard Beer.count > 0 else {
            return (beer: nil, error: BeerRefrigeratorError.outOfStock)
        }
        guard Beer.price <= buyerDeposit else {
            return (beer: nil, error: BeerRefrigeratorError.insufficientFunds(depositNeed: Beer.price - buyerDeposit))
        }
        buyerDeposit -= Beer.price
        var newBeer = Beer
        newBeer.count -= 1
        invertoty[name] = newBeer
        return (beer: newBeer.beer, error: nil)
    }
}

let sellBeer = beerBuy.buyBeerWithError(beerName: "Бельгийское пиво")
let sellBeer1 = beerBuy.buyBeerWithError(beerName: "Российское пиво")
let sellBeer2 = beerBuy.buyBeerWithError(beerName: "Немецкое пиво")

if let beer = sellBeer.beer {
    print("Вы купили \(beer.name)")
}
else if let error = sellBeer.error {
    print("Произошла ошибка: \(error.errorDescription)")
}
if let beer = sellBeer1.beer {
    print("Вы купили \(beer.name)")
}
else if let error = sellBeer1.error {
    print("Произошла ошибка: \(error.errorDescription)")
}
if let beer = sellBeer2.beer {
    print("Вы купили \(beer.name)")
}
else if let error = sellBeer2.error {
    print("Произошла ошибка: \(error.errorDescription)")
}

//:2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

extension BeerRefrigerator {
    func correctBeerRefrigerator(beerName name: String) throws -> BeerName {
        guard let beer = invertoty[name] else {
            throw BeerRefrigeratorError.invalidSelection
        }
        guard beer.count > 0 else {
            throw BeerRefrigeratorError.outOfStock
        }
        guard beer.price <= buyerDeposit else {
            throw BeerRefrigeratorError.insufficientFunds(depositNeed: beer.price - buyerDeposit)
        }
        buyerDeposit -= beer.price
        var newBeer = beer
        newBeer.count -= 1
        invertoty[name] = newBeer
        return newBeer.beer
    }
}
beerBuy.buyerDeposit

do {
    let someBuyBeer = try beerBuy.correctBeerRefrigerator(beerName: "Бельгийское пиво")
    print("Вы купили \(someBuyBeer.name)")

} catch BeerRefrigeratorError.invalidSelection {
    print("Данного вида пива нет в ассортименте.")
}
catch BeerRefrigeratorError.insufficientFunds(let depositNeed) {
    print("Недостаточно средств, не хватает \(depositNeed) рублей")
}
catch BeerRefrigeratorError.outOfStock {
    print("Данного вида пива нет в наличии.")
}
catch let error {
    print(error)
}
beerBuy.buyerDeposit += 150

let sellBeer4 = try? beerBuy.correctBeerRefrigerator(beerName: "Бельгийское пиво")
let sellBeer5 = try? beerBuy.correctBeerRefrigerator(beerName: "Российское пиво")

enum BuyError: Error {
    case buyerNotFound
}

let buyerBeer = [
    "Олег": "Российское пиво",
    "Александр": "Бельгийское пиво",
    "Илья": "Немецкое пиво"
]
func buyBeerByBuyers(person: String, BeerRefrigerator: BeerRefrigerator) throws -> BeerName {
    guard let name = buyerBeer[person] else {
        throw BuyError.buyerNotFound
    }
    return try BeerRefrigerator.correctBeerRefrigerator(beerName: name)
}

let someBeerRefregirator = BeerRefrigerator()

do {
    let buyerAlexandr = try buyBeerByBuyers(person: "Александр", BeerRefrigerator: someBeerRefregirator)
    print("Александр купил \(buyerAlexandr.name)")
} catch BeerRefrigeratorError.invalidSelection {
    print("Данного вида пива нет в ассортименте.")
} catch BeerRefrigeratorError.outOfStock {
    print("Данного вида пива нет в наличии.")
} catch BeerRefrigeratorError.insufficientFunds(let depositNeed) {
    print("Недостаточно средств, не хватает \(depositNeed) рублей")
} catch let error {
    print(error)
}

do {
    let buyerIlya = try buyBeerByBuyers(person: "Илья", BeerRefrigerator: someBeerRefregirator)
    print("Илья купил \(buyerIlya.name)")
} catch BeerRefrigeratorError.invalidSelection {
    print("Данного вида пива нет в ассортименте.")
} catch BeerRefrigeratorError.outOfStock {
    print("Данного вида пива нет в наличии.")
} catch BeerRefrigeratorError.insufficientFunds(let depositNeed) {
    print("Недостаточно средств, не хватает \(depositNeed) рублей")
} catch let error {
    print(error)
}
do {
    let buyerOleg = try buyBeerByBuyers(person: "Олег", BeerRefrigerator: someBeerRefregirator)
    print("Олег купил \(buyerOleg.name)")
} catch BeerRefrigeratorError.invalidSelection {
    print("Данного вида пива нет в ассортименте.")
} catch BeerRefrigeratorError.outOfStock {
    print("Данного вида пива нет в наличии.")
} catch BeerRefrigeratorError.insufficientFunds(let depositNeed) {
    print("Недостаточно средств, не хватает \(depositNeed) рублей")
} catch let error {
    print(error)
}

