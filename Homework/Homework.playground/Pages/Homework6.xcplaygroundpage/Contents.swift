//: [Previous](@previous)

import Foundation


//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//Стек (представьте стопку тарелок):
//- объекты заходят с конца
//- объекты выходят с конца (то есть последний, вошедший в стек, выйдет первым)
//Очередь (как обычная очередь на кассе):
//- объекты заходят с конца
//- объекты выходят из начала (то есть последний, вошедший в очередь, выйдет последним)
//
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//Вам нужно придумать метод, который будет описан внутри "очереди". Этот метод в качестве одного из аргументов должен принимать замыкание (либо это будет единственный аргумент). Замыкание будет описано в основном коде и будешь лишь передаваться в метод очереди при вызове.
//
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
//Не забудьте проверить индекс, переданный в subscript. Можно для начала попробовать не усложнять логику и просто вернуть элемент из очереди по переданному индексу, а потом уже сделать реализацию сложнее, если есть желание.

class Woman {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
extension Woman: CustomStringConvertible {
    var description : String {
        return "Woman name: \(name), age: \(age) \n"
    }
}
struct Queue<T> {
    private var elements: [T] = []
    mutating func queue(_ element: T) {
        elements.append(element)
    }
    mutating func popFirst() ->T? {
        guard elements.count > 0
        else {return nil }
        return elements.removeFirst()
    }
    mutating func unQueue(_ element: T) {
        elements.append(element)
    }
    mutating func popLast() -> T? {
        guard elements.count > 0
        else {return nil}
        return elements.removeLast()
    }
    func printMyQueue() {
        print(elements)
    }
}
//: Очень сложно понять, как создать фунцкии в расширениях, вот прям очень долго доходит
extension Queue{
    func myFilter(filter: (T) -> Bool) -> [T] {
        var res = [T]()
        for i in elements {
            if filter(i){
                res.append(i)
            }
        }
        return res
    }
}
//extension Queue {
//    func myShuffle(shuffle: T) -> [T] {
//        let resultShuffle = [T]()
//        for _ in elements {
//            resultShuffle.shuffled()
//        }
//        return resultShuffle
//    }
//}

var stack = Queue<Woman>()
stack.queue(Woman(name: "Alexandra", age: 41))
stack.queue(Woman(name: "Nataly", age: 15))
stack.queue(Woman(name: "Anastasia", age: 47))
stack.queue(Woman(name: "Kate", age: 40))
stack.queue(Woman(name: "Alice", age: 13))
stack.queue(Woman(name: "Helga", age: 51))


stack.printMyQueue()
stack.popLast()
stack.popFirst()
stack.printMyQueue()
let filterAge = stack.myFilter(filter: {$0.age <= 40}) //: Пробовал поставить 2 класса (Man и Woman), но получил ошибку при расчетах
print(filterAge)

//: Сабскрипты я вообще не понял, постараюсь самостоятельно изучить, как будет время
