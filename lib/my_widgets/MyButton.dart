import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

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

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),

            //Kha nut nhan
            ElevatedButton(
              onPressed: null,
              child: Text("ElevatedButton", style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 15,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Pressed");
              },
              onLongPress: () {
                print("Pressed_Long");
              },
              child: Text("ElevatedButton", style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 15,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
            ),

            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                print("Text Button");
              },
              child: Text("TextButton", style: TextStyle(fontSize: 24)),
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),

            OutlinedButton(
              onPressed: () {
                print("outlineBuuton");
              },
              child: Text("OutlineButton", style: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: 20),

            IconButton(
              onPressed: () {
                print("iconbutton");
              },
              icon: Icon(Icons.favorite),
              style: IconButton.styleFrom(foregroundColor: Colors.red),
            ),
            SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {
                print("Floating action Button");
              },
              child: Icon(Icons.add),
            ),
            SizedBox(height: 20),

            InkWell(
              onTap: () {
                print("Inkwsell duoc nhan!");
              },
              onDoubleTap: () {
                print("Inkwell duoc nhan 2 lan");
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                ),
                child: Text("button tuy chinh voi inkwell"),
              ),
            ),
            SizedBox(height: 20,),
            TextButton.icon(
              onPressed: () {},
              label: Text("Yeu thich",style: TextStyle(
                color: Colors.blue,
              ),),
              icon: Icon(Icons.favorite),
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
                backgroundColor: Colors.amber
              ),
            ),
            GestureDetector(
              onTap: (){
                print("Noi dung duoc tap");
              },
              onDoubleTap: (){
                print("Noi dung dc tap 2 cai");
              },
              onPanUpdate: (details){
                print("Keo - di chuyen ${details.delta}");
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Center(child: Text("Cham vao toi"),),
              ),
            )
          ],
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
