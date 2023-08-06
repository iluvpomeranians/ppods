import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        backgroundColor: Colors.grey[200],
      ),
      home: const MyHomePage(title: 'Plant Pods'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter1 = 0;
  int _counter2 = 0;
  int _counter3 = 0;
  int _counter4 = 0;
  int _counter5 = 0;
  int _counter6 = 0;


  void _incrementCounter(int index) {
    setState(() {
      if (index == 1) _counter1++;
      if (index == 2) _counter2++;
      if (index == 3) _counter3++;
      if (index == 4) _counter4++;
      if (index == 5) _counter5++;
      if (index == 6) _counter6++;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<GridItemData> gridItems = [
      GridItemData(
        imageAsset: 'lib/Images/Square-cuts/amazononianwarrior-removebg.png',
        text: 'Daily Statistics',
        counter: _counter1,
      ),
      GridItemData(
        imageAsset: 'lib/Images/Square-cuts/charliebrown-removebg.png',
        text: 'Treatment',
        counter: _counter2,
      ),
      GridItemData(
        imageAsset: 'lib/Images/Square-cuts/tropicalhouseplant-removebg.png',
        text: 'Water',
        counter: _counter3,
      ),
      GridItemData(
        imageAsset: 'lib/Images/Square-cuts/lovelyyellow-removebg.png',
        text: 'Light',
        counter: _counter4,
      ),
      GridItemData(
        imageAsset: 'lib/Images/Square-cuts/redplant-removebg.png',
        text: 'Tips & Tricks',
        counter: _counter5,
      ),
      GridItemData(
        imageAsset: 'lib/Images/Square-cuts/smallficcus-removebg.png',
        text: 'Explore',
        counter: _counter6,
      ),

    ];

     return Scaffold(
     
     backgroundColor: Colors.grey[350],
     
     appBar: AppBar(
        backgroundColor: Colors.grey[350],
        titleSpacing: 0, // Reduce the spacing between the leading and title widgets
        leading: Image.asset(
          'lib/Images/Square-cuts/littlecactus-removebg.png',
          width: 30,
          height: 30,
        ),
        title: ElevatedButton(
          onPressed: () {
            // Add your title button functionality here
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),

      body: Align(
        alignment: Alignment.center,
        
        child: GridView.builder(
          
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          
          itemCount: gridItems.length,
          itemBuilder: (context, index) {
            
            return InkWell(
              onTap: () {
                _incrementCounter(index + 1); // Increment the counter based on the index (1-based).
              },
              
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.transparent,
                    width: 12,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [Colors.yellow, Colors.deepPurple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      gridItems[index].imageAsset,
                      width: 150,
                      height: 150,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          gridItems[index].text,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '${gridItems[index].counter} ml',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter(1); // Increment the first counter
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class GridItemData {
  final String imageAsset;
  final String text;
  final int counter;

  GridItemData({required this.imageAsset, required this.text, required this.counter});
}