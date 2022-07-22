import 'package:flutter/material.dart';
class Adoption extends StatefulWidget {
  const Adoption({Key? key}) : super(key: key);

  @override
  State<Adoption> createState() => _AdoptionState();
}

class _AdoptionState extends State<Adoption> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter name of Child',
              labelText: 'Child Name',
              prefixIcon: Icon(Icons.person,color: Colors.red[900],),

            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.numberWithOptions(decimal: false),
            decoration: InputDecoration(
              hintText: 'Enter age of Child',
              labelText: 'Age',
              prefixIcon: Icon(Icons.onetwothree_rounded,color: Colors.red[900],),

            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter name of person adopting',
              labelText: 'Person Name',
              prefixIcon: Icon(Icons.person,color: Colors.red[900],),

            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.numberWithOptions(decimal: false),
            decoration: InputDecoration(
              hintText: 'Enter Person CNIC',
              labelText: 'CNIC',
              prefixIcon: Icon(Icons.numbers,color: Colors.red[900],),

            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.numberWithOptions(decimal: false),
            decoration: InputDecoration(
              hintText: 'Enter Person Contact Number',
              labelText: 'Contact No',
              prefixIcon: Icon(Icons.phone,color: Colors.red[900],),

            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter Address of person adopting',
              labelText: 'Person Address',
              prefixIcon: Icon(Icons.home,color: Colors.red[900],),

            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150,vertical: 16.00),

            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red[900]),
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Add'),
            ),
          ),
        ],
      ),
    );
  }
}
