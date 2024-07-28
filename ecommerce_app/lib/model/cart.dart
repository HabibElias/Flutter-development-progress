import 'package:flutter/material.dart';
import 'package:ecommerce_app/model/shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoes in the store
  List<Shoe> shoeShop = const [
    Shoe(
        name: 'Nike zoom',
        price: '2000',
        description: 'real nice and cozy flight',
        imagePath: 'lib/images/shoe (1).jpg'),
    Shoe(
        name: 'Air Jordan',
        price: '2200',
        description: 'Swag and Swap',
        imagePath: 'lib/images/shoe (2).jpg'),
    Shoe(
        name: 'Freez Cold',
        price: '2300',
        description: 'Leave your budies in the breeze',
        imagePath: 'lib/images/shoe (3).jpg'),
    Shoe(
        name: 'Dome kebele',
        price: '2500',
        description: 'It\'s our place to shine',
        imagePath: 'lib/images/shoe (4).jpg'),
  ];
  // the shoe in the cart
  List<Shoe> userCart = [];

  // a method to get the shoping list
  List<Shoe> getShoeList() {
    return shoeShop;
  }


  // a method to get the usercart
  List<Shoe> getUserCart() {
    return userCart;
  }
  // add a shoe to the user cart
  void addToUser(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove a shoe from the user cart
  void removeFromUser(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
