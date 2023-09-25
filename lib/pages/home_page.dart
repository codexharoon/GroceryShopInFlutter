import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app/component/grocery_item_tile.dart';
import 'package:grocery_shop_app/model/cart_model.dart';
import 'package:grocery_shop_app/pages/cart_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 48,),

            // greetings text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text('Good morning,'),
            ),

            const SizedBox(height: 4,),

            // order text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:24),
              child: Text('Lets order fresh items for you',
                style: GoogleFonts.roboto(  
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 24,),

            // divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(),
            ),


            const SizedBox(height: 24,),

            // frsh items + grid
            const Padding(
              padding: EdgeInsets.symmetric(horizontal:24.0),
              child: Text('Fresh items',
                style: TextStyle(fontSize: 16),
              ),
            ),

            Expanded(
              child: Consumer<CartModel>(  
                builder: (context, value, child) => GridView.builder(
                  itemCount: value.shopItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
                    crossAxisCount: 2,
                    childAspectRatio: 1/1.2
                  ),
                  itemBuilder: (context, index) => GroceryItemTile(itemName: value.shopItems[index][0], itemPrice: value.shopItems[index][1], itemPath: value.shopItems[index][2], color: value.shopItems[index][3], onPressed: () => value.addItem(index),),
                ),
              ),
            ),
      
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(  
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage(),));
        },
        child: const Icon(Icons.shopping_bag),
      ),
    );
  }
}