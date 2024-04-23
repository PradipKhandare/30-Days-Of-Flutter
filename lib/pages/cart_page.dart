import 'package:flutter/material.dart';
import 'package:thirty_days_of_flutter/main.dart';
import 'package:thirty_days_of_flutter/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyApp.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          const _CartList().p32().expand(),
          const Divider(),
          _cartTotal()
        ],
      ),
    );
  }
}

class _cartTotal extends StatelessWidget {
  _cartTotal({super.key});
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}"
              .text
              .xl5
              .color(const Color.fromARGB(255, 43, 42, 42))
              .make(),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying not supported yet".text.make()));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurple)),
                  child: "Buy".text.color(Colors.white).make())
              .w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items?.length,
      itemBuilder: ((context, index) => ListTile(
            leading: const Icon(Icons.done),
            trailing: IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () {}),
            title: _cart.items[index].name.text.make(),
          )),
    );
  }
}
