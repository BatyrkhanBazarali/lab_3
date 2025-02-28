import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widgets Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showFirstImage = true;

  void _toggleImage() {
    setState(() {
      _showFirstImage = !_showFirstImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Widgets Demo')),
      body: Stack(
        children: [
          Image.asset(
            _showFirstImage ? 'assets/image1.jpg' : 'assets/image2.jpg',
            fit: BoxFit.cover, // Меняй для тестирования
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to Flutter',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('SnackBar Shown!')));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(200, 50),
                  ),
                  child: Text(
                    'Show SnackBar',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondScreen()),
                    );
                  },
                  style: TextButton.styleFrom(minimumSize: Size(200, 50)),
                  child: Text(
                    'Go to Second Screen',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ),
                SizedBox(height: 10),
                OutlinedButton(
                  onPressed: _toggleImage,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.black),
                    minimumSize: Size(200, 50),
                  ),
                  child: Text(
                    'Toggle Image',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: Text(
          'Welcome to the Second Screen!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
