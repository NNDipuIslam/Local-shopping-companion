import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prac2/pages/NavBar.dart';
import 'package:prac2/pages/cart.dart';

class Product {
  final String name;
  final double price;
  final String imageAsset;

  Product({
    required this.name,
    required this.price,
    required this.imageAsset,
  });
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 0});
}

class shopname extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navBar(),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Center(child: Text("ShopName")),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to the cart page.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: ProductsList(),
    );
  }
}

class ProductsList extends StatefulWidget {
  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  List<Product> products = [
    Product(name: "Lentis", price: 100.0, imageAsset: "lib/images/lentil.jpg"),
    Product(
        name: "Chilly", price: 200.0, imageAsset: "lib/images/greenchili.jpg"),
    Product(name: "Rice", price: 60.0, imageAsset: "lib/images/rice.jpg"),
    Product(
        name: "Soyabean oil", price: 10.0, imageAsset: "lib/images/oil.jpg"),
    // Add more products here.
  ];

  List<CartItem> cart = [];
  Product? selectedProduct; // Track the selected product

  void addToCart(Product product) {
    int index = cart.indexWhere((item) => item.product == product);
    if (index != -1) {
      setState(() {
        cart[index].quantity++;
      });
    } else {
      setState(() {
        cart.add(CartItem(product: product, quantity: 1));
      });
    }
  }

  void removeFromCart(Product product) {
    int index = cart.indexWhere((item) => item.product == product);
    if (index != -1 && cart[index].quantity > 0) {
      setState(() {
        cart[index].quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  leading: Container(
                      height: 60,
                      width: 60,
                      child: Image(image: AssetImage(product.imageAsset))),
                  title: Text(
                    product.name,
                    style: GoogleFonts.nunito(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          removeFromCart(product);
                        },
                      ),
                      Text(cart
                          .firstWhere((item) => item.product == product,
                              orElse: () => CartItem(product: product))
                          .quantity
                          .toString()),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          addToCart(product);
                        },
                      ),
                    ],
                  ),
                  // Add GestureDetector to detect taps on ListTile
                  onTap: () {
                    setState(() {
                      selectedProduct = product; // Set the selected product
                    });
                  },
                );
              },
            ),
          ),
          // Add a button at the bottom to add the selected product to the cart
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                if (selectedProduct != null) {
                  addToCart(
                      selectedProduct!); // Add the selected product to the cart
                  selectedProduct = null; // Reset selected product
                  // Navigate to the cart page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(),
                      settings: RouteSettings(
                        arguments: cart,
                      ),
                    ),
                  );
                } else {
                  // Display a message or handle the case where no product is selected
                }
              },
              child: Text("Add to Cart"),
            ),
          ),
        ],
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<CartItem> cart =
        ModalRoute.of(context)!.settings.arguments as List<CartItem>;

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final cartItem = cart[index];
                return ListTile(
                  leading:
                      Image(image: AssetImage(cartItem.product.imageAsset)),
                  title: Text(cartItem.product.name),
                  subtitle:
                      Text('\$${cartItem.product.price.toStringAsFixed(2)}'),
                  trailing: Text("Quantity: ${cartItem.quantity}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



