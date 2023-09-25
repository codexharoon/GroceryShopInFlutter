import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String itemPath;
  final dynamic color;
  final Function()? onPressed;

  const GroceryItemTile({
    Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.itemPath,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(  
          color: color[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //image 
            Image.asset(itemPath,height: 65,),
    
            //name
            Text(itemName),
    
            //price + button
            MaterialButton(  
              color: color[800],
              onPressed: onPressed,
              child: Text('\$$itemPrice',
                style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
