import 'package:flutter/material.dart'; // Flutter UI кітапханасын импорттау

void main() {
  runApp(MyApp()); // Қолданбаны іске қосу
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Виджеттер Демо', // Қолданбаның тақырыбы
      theme: ThemeData(primarySwatch: Colors.blue), // Негізгі тақырыпты орнату
      home: HomeScreen(), // Негізгі экранды көрсету
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState(); // Экран күйін жасау
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showFirstImage = true; // Суретті ауыстыру үшін айнымалы

  void _toggleImage() {
    setState(() {
      _showFirstImage = !_showFirstImage; // Суреттің күйін өзгерту
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Виджеттер Демо')), // Жоғарғы панель
      body: Stack(
        children: [
          Image.asset(
            _showFirstImage ? 'assets/image1.jpg' : 'assets/image2.jpg', // Суретті таңдау
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.5), // Артқы фонды күңгірттеу
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Ортаға туралау
              children: [
                Text(
                  'Flutter-ге қош келдіңіз',
                  style: TextStyle(fontSize: 24, color: Colors.white), // Қош келдіңіз мәтіні
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('SnackBar көрсетілді!')), // Хабарлама көрсету
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(200, 50),
                  ),
                  child: Text(
                    'SnackBar көрсету',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Scaffold(
                        appBar: AppBar(title: Text('Екінші экран')), // Екінші экран
                        body: Center(child: Text('Екінші экранға қош келдіңіз!',
                          style: TextStyle(fontSize: 20),)),
                      )),
                    );
                  },
                  style: TextButton.styleFrom(minimumSize: Size(200, 50)),
                  child: Text(
                    'Екінші экранға өту',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ),
                SizedBox(height: 10),
                OutlinedButton(
                  onPressed: _toggleImage, // Суретті ауыстыру
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.black),
                    minimumSize: Size(200, 50),
                  ),
                  child: Text(
                    'Суретті ауыстыру',
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



