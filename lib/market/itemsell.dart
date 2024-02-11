import 'package:flutter/material.dart';

class itemsell extends StatefulWidget {
  const itemsell({super.key});

  @override
  State<itemsell> createState() => _itemsellState();
}

class _itemsellState extends State<itemsell> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Listing",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    box(context, "Product Name", 20),
                    SizedBox(
                      height: 29,
                    ),
                    box(context, "Price", 20),
                    SizedBox(
                      height: 30,
                    ),
                    box(context, "Product Description", 70),
                    SizedBox(
                      height: 30,
                    ),
                    box(context, "Delivery Description", 70),
                    SizedBox(
                      height: 30,
                    ),
                    box(context, "Add Photos", 40),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "backtomarket");
                },
                child: Text(
                  "Submit",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
          ),
        ]),
      ),
    );
  }
}

Widget box(BuildContext context, String check, double size) {
  return TextField(
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: size, horizontal: 10),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.black,
        ),
      ),
      hintText: check,
      hintStyle: TextStyle(
        color: Color.fromARGB(255, 184, 181, 181),
        fontSize: 20,
      ),
    ),
  );
}
