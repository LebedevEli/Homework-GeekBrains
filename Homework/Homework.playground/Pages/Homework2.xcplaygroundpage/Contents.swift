//: [Previous](@previous)

import Foundation

// 1. Написать функцию, которая определяет, четное число или нет.

var array = 1...100

for arr in array{
    if arr % 2 != 0 {
        print((arr), "нечетное число")
    } else {
        print((arr), "четное число")
}
}

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.

for arr in array {
    if arr % 3 == 0 {
        print((arr), "делится на 3 без остатка")
    }
    else {
        print((arr), "делится на 3 с остатком")
    }
}
// 3. Создать возрастающий массив из 100 чисел.

var mass = Array(1...100)
print(mass)

// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

for arr in mass {
    if arr % 2 != 0 && arr % 3 != 0 {
        print((arr), "Нечетное число, которое не делится на 3")
    }
}

// 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
// Нашёл ответ, сам бы не справился... Буду разбирать параллельно, пока не пойму :)

func fibonacciArray(_ n: Int) -> [Double] {
    var fibonacci: [Double] = [1, 1]
    (2...n).forEach{ i in
        fibonacci.append(fibonacci[i - 1] + fibonacci[i - 2])
    }
    return fibonacci
}
print(fibonacciArray(50))

//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу.
// Нашёл ответ, сам бы не справился... Буду разбирать параллельно, пока не пойму :)

func primeNumbers(arrayPassed: [Int]) -> [Int] {
    var primes: [Int] = []
    var newArr = arrayPassed
    while let newP = newArr.first {
        primes.append(newP)
        newArr = newArr.filter { $0 % newP != 0 }
    }
    return primes
}
print(primeNumbers(arrayPassed: Array(2...100)))

// Понял, что с функциями придется еще потрудиться, нелегко даются

