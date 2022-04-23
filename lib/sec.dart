import 'package:flutter/material.dart';

class Todoagain extends StatefulWidget {
  const Todoagain({Key? key}) : super(key: key);

  @override
  State<Todoagain> createState() => _TodoagainState();
}

class _TodoagainState extends State<Todoagain> {
  List<dynamic> lst = [1, 2, 3, 4];

  var output = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Friends")),
      body: Container(
          child: ListView.builder(
        itemCount: lst.length,
        itemBuilder: (context, index) {
          return Container(
            height: 30,
            margin: EdgeInsets.only(top: 20),
            color: Colors.grey,
            child: ListTile(
                title: Text("${lst[index]}"),
                trailing: GestureDetector(
                  onTap: () {
                    setState(() {
                      lst.removeAt(index);
                    });
                  },
                  child: Icon(Icons.delete),
                )),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add Item"),
                  content: TextField(
                    onChanged: (value) {
                      output = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            lst.add(output);
                          });
                        },
                        child: Text("Add"))
                  ],
                );
              });
        },
        child: Text("+"),
      ),
    );
  }
}
