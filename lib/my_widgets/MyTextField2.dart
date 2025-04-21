import 'package:flutter/material.dart';

class MyTextFiled2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyTextFieldSate();
}

class _MyTextFieldSate extends State<MyTextFiled2> {
  final _textController = TextEditingController();
  String _inputText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My app'),
        backgroundColor: Colors.blue,
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () {
              print("b1");
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print("b2");
            },
            icon: Icon(Icons.abc),
          ),
          IconButton(
            onPressed: () {
              print("b3");
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: "Nhap thong tin",
                  hintText: "Thong tin cua ban",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _textController.clear();
                    },
                    icon: Icon(Icons.clear),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _inputText = value;
                  });
                },
              ),
              SizedBox(height: 50),
              Text('Ban da nhap $_inputText', style: TextStyle(
                fontSize: 30
              )),
            ],
          ),
        ),
      ),
    );
  }
}
