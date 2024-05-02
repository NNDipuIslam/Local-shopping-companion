import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prac2/bloc/bloc/account_bloc.dart';
import 'package:prac2/pages/home.dart';

class itemSell extends StatefulWidget {
  const itemSell({super.key});

  @override
  State<itemSell> createState() => _itemSellState();
}

class _itemSellState extends State<itemSell> {
  AccountBloc accountBloc = AccountBloc();
  final TextEditingController itemnameController = TextEditingController();
  final TextEditingController itemPriceController = TextEditingController();
  final TextEditingController productInfoController = TextEditingController();
  final TextEditingController deliveryInfoController = TextEditingController();

  File imageFile = File('lib/images/white.jpg');

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        imageFile = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sell New Product'),
        ),
        body: BlocListener<AccountBloc, AccountState>(
          bloc: accountBloc,
          listener: (context, state) {
            if (state is ProductCreateSuccessState) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Container(
                      child: AlertDialog(
                        title: Text("Congartulation"),
                        content: Text("You just post a new Product"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  DialogRoute(
                                    context: context,
                                    builder: (context) => MyHome(),
                                  )); // Close the dialog
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  });
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Container(
                      child: AlertDialog(
                        title: Text("Alert"),
                        content: Text("Sorry!!Somwthing is wrong"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  });
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: itemnameController,
                    decoration: InputDecoration(
                      labelText: 'Item Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: itemPriceController,
                    decoration: InputDecoration(
                      labelText: 'Item Price',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: productInfoController,
                    decoration: InputDecoration(
                      labelText: 'Product Information',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: deliveryInfoController,
                    decoration: InputDecoration(
                      labelText: 'Delivery Information',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _pickImage,
                    icon: Icon(Icons.image),
                    label: Text('Choose Image'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey,
                      onPrimary: Colors.white,
                    ),
                  ),
                  Image.file(
                    imageFile,
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String name = itemnameController.text;
                      String price = itemPriceController.text;
                      String productInfo = productInfoController.text;
                      String deliveryInfo = deliveryInfoController.text;
                      accountBloc.add(NewProduct(
                          ItemName: name,
                          ItemPrice: price,
                          image: imageFile,
                          ProductInformation: productInfo,
                          DeliveryInformation: deliveryInfo));
                    },
                    child: Text('Create Business'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
