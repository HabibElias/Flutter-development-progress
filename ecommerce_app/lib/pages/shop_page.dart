import 'package:ecommerce_app/model/cart.dart';
import 'package:ecommerce_app/model/shoe.dart';
import 'package:ecommerce_app/model/shoe_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // methods for adding to the cart
  void addToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addToUser(shoe);

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
          title: Text('Successfully Added!'),
          content: Text('Check your cart.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // search bar
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
            padding: const EdgeInsets.all(20.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          // message
          Text('Everybody flies.. some fly more than others',
              style: TextStyle(color: Colors.grey[600])),

          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Hot Picks🔥',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'See All',
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
          ),

          // hotpics bar
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                Shoe shoe = value.getShoeList()[index];
                return ShoeTile(
                  shoe: shoe,
                  onTap: () => addToCart(shoe),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25, top: 25, right: 25),
            child: Divider(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
