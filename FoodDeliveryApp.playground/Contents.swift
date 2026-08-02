import UIKit

protocol Restaurant {
    var name: String{ get }
    func prepareFood()
}

class AsianRestaurant: Restaurant {
    let name: String
    init(name: String) {
        self.name = name
    }
    func prepareFood() {
    }
}
class AfricanRestaurant: Restaurant {
    let name: String
    init(name: String) {
        self.name = name
    }
    func prepareFood() {
    }
}

protocol PaymentMethod {
    func Pay(amount: Double)->Bool
}

class DebitCard: PaymentMethod {
    func Pay(amount: Double) -> Bool {
        return true
    }
}

class CreditCard: PaymentMethod {
    func Pay(amount: Double) -> Bool {
        return false
    }
}

//declaring the order
struct Order {
    let orderName: String
    let orderPrice: Double
}

// declaring the foodDeliver, we have the restaurant, payment and order in one class
class OrderPlacement {
    let restaurant: Restaurant
    let paymentMethod: PaymentMethod
    
    init(restaurant: Restaurant, paymentMethod: PaymentMethod) {
        self.restaurant = restaurant
        self.paymentMethod = paymentMethod
    }
    
//    we place order in this func params becz it is related to order
    func placeOrder(order: Order, placementMessage:(String)-> Void){
        let isPaid = paymentMethod.Pay(amount: order.orderPrice)
        
        if(isPaid){
            placementMessage("Order Placed with success")
            restaurant.prepareFood()
        }else{
            placementMessage("Placement Failed")
        }
    }
    
}
//now assigning the variables and functions in order
let asianRestaurant = AsianRestaurant(name: "Dragon Cusine")
let paymentMethod = CreditCard()
let order = Order(orderName: "Fried Rice", orderPrice: 10.90)

let orderPlacement = OrderPlacement(restaurant: asianRestaurant, paymentMethod: paymentMethod)

//now call the function that should print
orderPlacement.placeOrder(order: order){
    value in  print(value)
}
