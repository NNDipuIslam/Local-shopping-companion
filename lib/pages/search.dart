import 'package:flutter/material.dart';
import 'package:prac2/pages/NavBar.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      body: Expanded(
        child: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextField(
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
          )
        ])),
      ),
    );
  }
}
