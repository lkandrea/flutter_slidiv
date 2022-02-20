import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  RectangularMaze maze = RectangularMaze.create(RectangularMaze_7x7());

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  double inverse(int num) {
    if (num == 1) {
      return 0;
    }
    return 1;
  }

  bool hasBorder(int num) {
    return num != 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '7x7 Maze'
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Column(
              children: List.generate(maze.tiles.length, (columnIndex) {
                if (columnIndex % maze.width == 0) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(maze.width, (rowIndex) {
                      RectangularTile tile = maze.tiles.elementAt(columnIndex + rowIndex);
                      RectangularSide tileSide = tile.side;
                      
                      return Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: hasBorder(tileSide.down) ? BorderSide(width: inverse(tileSide.down)) : BorderSide.none,
                            left: hasBorder(tileSide.left) ? BorderSide(width: inverse(tileSide.left)) : BorderSide.none,
                            right: hasBorder(tileSide.right) ? BorderSide(width: inverse(tileSide.right)) : BorderSide.none,
                            top: hasBorder(tileSide.up) ? BorderSide(width: inverse(tileSide.up)) : BorderSide.none
                          ),
                          color: Colors.green[100],
                        ),
                        child: tile.occupied ? Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red
                          )
                        ) : Container()
                      );
                    })
                  );
                }
                return Container();
              })
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
