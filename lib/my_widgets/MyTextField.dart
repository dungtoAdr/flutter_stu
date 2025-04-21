import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

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
              SizedBox(height: 50,),
              TextField(
                decoration: InputDecoration(
                  labelText: "Ho va ten",
                  hintText: "Nhap vao ho va ten",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Exaple@gmail.com",
                  helperText: "Nhap vao email ca nhan",
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: Icon(Icons.clear),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  filled: true,
                  fillColor: Colors.green,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(
                  labelText: "So dien thoai",
                  hintText: "Nhap vao sdt",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(
                  labelText: "Mat khau",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                obscuringCharacter: "*",
              ),
              SizedBox(height: 30,),
              TextField(
                // onChanged: (value){
                //   print("Dang nhap vao: $value");
                // },
                onSubmitted: (value){
                  print("Da hoan thanh noi dung: $value");
                },
                decoration: InputDecoration(
                  labelText: "Cau hoi bi mat",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.headphones),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chu'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Tim kiem'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Ca nhan'),
        ],
      ),
    );
  }
}
