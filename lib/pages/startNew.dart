import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prac2/bloc/bloc/account_bloc.dart';
import 'package:prac2/pages/home.dart';

class StartNew extends StatefulWidget {
  const StartNew({super.key});

  @override
  State<StartNew> createState() => _startNewState();
}

class _startNewState extends State<StartNew> {
  AccountBloc accountBloc = AccountBloc();
  final TextEditingController shopnameController = TextEditingController();
  final TextEditingController shoplocationController = TextEditingController();
  final TextEditingController shopTypeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  File imageFile = File('lib/images/st5.jpeg');

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        imageFile = File(pickedImage!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Start New Business'),
        ),
        body: BlocListener<AccountBloc, AccountState>(
          bloc: accountBloc,
          listener: (context, state) {
            if (state is BusinessCreateSuccessState) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Container(
                      child: AlertDialog(
                        title: Text("Congartulation"),
                        content: Text("You just creat a new Shop"),
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
                    controller: shopnameController,
                    decoration: InputDecoration(
                      labelText: 'Shop Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: shoplocationController,
                    decoration: InputDecoration(
                      labelText: 'Shop Location',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: shopTypeController,
                    decoration: InputDecoration(
                      labelText: 'Shop Type',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
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
                  imageFile != null
                      ? Image.file(
                          imageFile!,
                          width: 300,
                          height: 300,
                          fit: BoxFit.cover,
                        )
                      : Container(),
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      String name = shopnameController.text;
                      String location = shoplocationController.text;
                      String type = shopTypeController.text;
                      String phone = phoneController.text;
                      accountBloc.add(StartNewBusiness(
                          ShopName: name,
                          ShopLocation: location,
                          ShopType: type,
                          PhoneNumber: phone,
                          image: imageFile));
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
