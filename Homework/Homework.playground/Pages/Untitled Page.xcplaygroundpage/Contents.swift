import Cocoa


//: 1. Решить квадратное уравнение

let a:Float = 2.25
let b:Float = 4.5
let c:Float = 6
var x1:Float
var x2:Float
var d:Float
var discriminant:Float

d = pow(b, 2) - 4 * a * c

if d >= 0 {
    discriminant = sqrt(d)
    x1 = (-b + discriminant) / (2 * a)
    x2 = (-b - discriminant) / (2 * a)
    
    print(x1, x2)

} else if d < 0 {
    d = (4 * a * c - pow(b, 2)) / (2 * a)
    print("Задание 1: Квадратное уравнение", d)
}

//: 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

var cathetA:Float = 4
var cathetB:Float = 6
var hypotenuse = sqrt(pow(a, 2) + pow(b, 2))
var perimeter = cathetA + cathetB + hypotenuse
var square = (cathetA * cathetB) / 2
print("Задание 2: Площадь равна", square, "Периметр равен", perimeter, "Гипотенуза равна", hypotenuse)

//:3.  *Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

var summ: Decimal = 1500
var percent: Decimal = 12.21

var money = (summ / 100) * percent
print("Сумма вашего вклада за первый год равен ", +(summ + money))
print("Сумма вашего вклада за второй год равен ", +(summ + money * 2))
print("Сумма вашего вкладад за третий год равен ", +(summ + money * 3))
print("Сумма вашего вклада за четвертый год равен ", +(summ + money * 4))
print("Сумма вашего вклада за пятый год равен ", +(summ + money * 5))
