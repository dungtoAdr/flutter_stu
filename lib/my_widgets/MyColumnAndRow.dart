import 'package:flutter/material.dart';

class MyColumnAndRow extends StatelessWidget {
  const MyColumnAndRow({super.key});

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
            Row(
              children: [
                const SizedBox(height: 50),
                const Icon(Icons.access_alarm_outlined),
                const Icon(Icons.ac_unit),
                const Icon(Icons.accessibility_new_outlined),
              ],
            ),
            Row(
              children: [
                Text("data....."),
                Text("data1......"),
                Text("data2......"),
                Text("data3"),
              ],
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
