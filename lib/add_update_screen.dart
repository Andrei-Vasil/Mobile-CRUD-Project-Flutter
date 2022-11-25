import 'package:crup_app_v2/model/repository.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'model/cat.dart';

class AddUpdateScreen extends StatefulWidget {
  const AddUpdateScreen({Key? key}) : super(key: key);

  @override
  State<AddUpdateScreen> createState() => _AddUpdateScreenState();
}

class _AddUpdateScreenState extends State<AddUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    var catIdMap = ModalRoute.of(context)!.settings.arguments as Map;
    String catId = catIdMap[CAT_KEY];

    Cat? cat = repository.getCatById(catId);
    cat ??= Cat.empty();

    return Scaffold(
        backgroundColor: Colors.greenAccent, body: CatForm(catId, cat));
  }
}

class CatForm extends StatefulWidget {
  final String catId;
  final Cat cat;

  const CatForm(this.catId, this.cat);

  @override
  State<CatForm> createState() => _CatFormState();
}

class _CatFormState extends State<CatForm> {
  String name = '';
  String age = '';
  String breed = '';
  String owner = '';
  String date = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          EditTextField("Name", widget.cat.name, 'name'),
          EditTextField("Age", widget.cat.age, 'age'),
          EditTextField("Breed", widget.cat.breed, 'breed'),
          EditTextField("Owner", widget.cat.owner, 'owner'),
          EditTextField("Date", widget.cat.date, 'date'),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
            onPressed: () {
              if (name != '') {
                widget.cat.name = name;
              }
              if (age != '') {
                widget.cat.age = age;
              }
              if (breed != '') {
                widget.cat.breed = breed;
              }
              if (owner != '') {
                widget.cat.owner = owner;
              }
              if (date != '') {
                widget.cat.date = date;
              }

              if (widget.cat.name.isEmpty ||
                  widget.cat.age.isEmpty ||
                  widget.cat.breed.isEmpty ||
                  widget.cat.owner.isEmpty ||
                  widget.cat.date.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Some fields are empty!'),
                ));
              } else {
                Cat toAddCat = Cat(
                  name: widget.cat.name,
                  age: widget.cat.age,
                  breed: widget.cat.breed,
                  owner: widget.cat.owner,
                  date: widget.cat.date,
                );

                if (widget.catId.compareTo("") == 0) {
                  repository.addCat(toAddCat);
                } else {
                  repository.updateCat(widget.catId, toAddCat);
                }

                Navigator.of(context).pop();
              }
            },
            child: widget.catId.compareTo("") == 0
                ? const Text('Save')
                : const Text('Update'),
          )
        ],
      ),
    );
  }

  Widget EditTextField(
          String fieldName, String initialValue, String stateVariable) =>
      Padding(
        padding: EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: fieldName,
          ),
          initialValue: initialValue,
          onChanged: (value) => setState(() {
            switch (stateVariable) {
              case 'name':
                {
                  name = value;
                }
                break;

              case 'age':
                {
                  age = value;
                }
                break;
              case 'breed':
                {
                  breed = value;
                }
                break;

              case 'owner':
                {
                  owner = value;
                }
                break;

              case 'date':
                {
                  date = value;
                }
                break;
            }
          }),
        ),
      );
}
