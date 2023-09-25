import 'package:flutter/material.dart';
import 'package:grocery_shop_app/images/my_images.dart';

class CartModel extends ChangeNotifier{

  final List _shopItems = [
    ['Avocado','5.00',(MyImages.avocado),Colors.green],
    ['Banana','3.25',(MyImages.banana),Colors.yellow],
    ['Chicken','10.04',(MyImages.chicken),Colors.brown],
    ['Water','1.00',(MyImages.water),Colors.blue],
  ];


  final List _cartItems = [];

  // add item into cart
  void addItem(int index){
    _cartItems.add(_shopItems[index]);

    notifyListeners();
  }

  // remove item from cart
  void removeItem(int index){
    _cartItems.removeAt(index);

    notifyListeners();
  }

  // calculateTotalPrice
  String calculateTotalPrice(){
    double totalPrice = 0;

    for(int i=0; i<_cartItems.length; i++){
      totalPrice += double.parse(_cartItems[i][1]);
    }

    return totalPrice.toStringAsFixed(2);
  }


  get shopItems => _shopItems;
  get cartItems => _cartItems;
}