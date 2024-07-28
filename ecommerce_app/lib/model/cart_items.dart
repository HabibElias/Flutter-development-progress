import 'package:ecommerce_app/model/cart.dart';
import 'package:ecommerce_app/model/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CartItems extends StatefulWidget {
  Shoe shoe;
  CartItems({
    required this.shoe,
    super.key,
  });

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  void removeItemCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).removeFromUser(shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePath),
        title: Text(widget.shoe.name),
        subtitle: Text('\$${widget.shoe.price}'),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          color: Colors.grey,
          onPressed: () => removeItemCart(widget.shoe),
        ),
      ),
    );
  }
}
