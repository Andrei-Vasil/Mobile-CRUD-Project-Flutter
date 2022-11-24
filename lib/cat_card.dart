import 'package:flutter/material.dart';
import 'model/cat.dart';

class CatCard extends StatelessWidget {
  final Cat cat;
  final Function onTap;

  const CatCard({required this.cat, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 6.0),
      child: Center(
        child: GestureDetector(
          onTap: () {
            onTap();
          },
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    cat.name,
                    style: TextStyle(fontSize: 22),
                  ),
                  subtitle: Text(
                    "Age: ${cat.name} \tBreed: ${cat.breed} \nOwner: ${cat.owner} \tAdoption date: ${cat.date}",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
