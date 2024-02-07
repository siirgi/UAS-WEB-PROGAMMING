import 'package:flutter/material.dart';
import 'package:sopo/screens/post_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<String> entries = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J'
  ];
  final List<int> colorCodes = <int>[
    600,
    400,
    300,
    200,
    100,
    600,
    400,
    300,
    200,
    100
  ];
  final List<int> images = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildListView(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => PostScreen()))),
    );
  }

  Widget _buildListView() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Scrollbar(
            thumbVisibility: true,
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Colors.blue[colorCodes[index]],
                  child: Center(
                      child: Row(
                    children: [
                      Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: Text('Entry ${entries[index]}')),
                      Image.network(
                          'https://picsum.photos/250?image=${images[index]}')
                    ],
                  )),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Row(children: [
                Icon(Icons.comment, color: Colors.amberAccent),
                Icon(Icons.share, color: Colors.amber),
                Icon(Icons.thumb_up, color: Colors.amber)
              ]),
            )));
  }
}
