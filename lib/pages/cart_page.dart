import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('My Cart',
                style: GoogleFonts.roboto(  
                  fontSize: 36,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: value.cartItems.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: value.cartItems[index][3][100],
                        borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      leading: Image.asset(
                        value.cartItems[index][2],
                        height: 36,
                      ),
                      title: Text(value.cartItems[index][0]),
                      subtitle: Text('\$${value.cartItems[index][1]}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.cancel),
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false)
                              .removeItem(index);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //total price + pay button
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Total Price:'),
                          const SizedBox(height: 4,),
                          Text('\$${value.calculateTotalPrice()}',
                            style: const TextStyle(  
                              fontSize: 18
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(  
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: const Row(  
                        children: [
                          Text('Pay Now'),
                          Icon(Icons.arrow_forward_ios,size: 16,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
