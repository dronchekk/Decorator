import UIKit

protocol Coffee {
    func getCost() -> Int
    func getIngredients() -> String
}

class SimpleCoffee: Coffee {
    func getCost() -> Int {
        return 60
    }

    func getIngredients() -> String {
        return "Кофе"
    }
}

class CoffeeDecorator: Coffee {
    let decoratedCoffee: Coffee
    let ingerientSeparator: String = ", "

    required init(decoratedCoffee: Coffee) {
        self.decoratedCoffee = decoratedCoffee
    }

    func getCost() -> Int {
        return decoratedCoffee.getCost()
    }

    func getIngredients() -> String {
        return decoratedCoffee.getIngredients()
    }
}


class Milk:CoffeeDecorator {

    required init(decoratedCoffee: Coffee) {
        super.init(decoratedCoffee: decoratedCoffee)
    }

    override func getCost() -> Int {
        return decoratedCoffee.getCost() + 20
    }

    override func getIngredients() -> String {
        return decoratedCoffee.getIngredients() + ingerientSeparator + "Молоко"
    }
}

class Whip: CoffeeDecorator {
    required init(decoratedCoffee: Coffee) {
        super.init(decoratedCoffee: decoratedCoffee)
    }

    override func getCost() -> Int {
        return decoratedCoffee.getCost() + 30
    }

    override func getIngredients() -> String {
        return decoratedCoffee.getIngredients() + ingerientSeparator + "Взбитые сливки"
    }
}

class Sugar: CoffeeDecorator {
    required init(decoratedCoffee: Coffee) {
        super.init(decoratedCoffee: decoratedCoffee)
    }

    override func getCost() -> Int {
        return decoratedCoffee.getCost() + 10
    }

    override func getIngredients() -> String {
        return decoratedCoffee.getIngredients() + ingerientSeparator + "Сахар"
    }
}


var someCoffee = SimpleCoffee()
print("Стоимость напитка: \(someCoffee.getCost()), ингредиенты: \(someCoffee.getIngredients())")
let milkCoffee = Milk(decoratedCoffee: someCoffee)
print("Стоимость напитка: \(milkCoffee.getCost()), ингредиенты: \(milkCoffee.getIngredients())")
let premiumCoffee = Whip(decoratedCoffee: milkCoffee)
print("Стоимость напитка: \(premiumCoffee.getCost()), ингредиенты: \(premiumCoffee.getIngredients())")
let milkSugarCofee = Sugar(decoratedCoffee: milkCoffee)
print("Стоимость напитка: \(milkSugarCofee.getCost()), ингредиенты: \(milkSugarCofee.getIngredients())")
