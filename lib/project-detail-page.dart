import 'package:flutter/material.dart';

class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({Key? key}) : super(key: key);

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project 1'),
      ),
      body: Stack(
        children: [
          Card(
              child: Scrollbar(
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Card(
                          child: SingleChildScrollView(
                              padding: const EdgeInsets.all(16),
                              child: ConstrainedBox(
                                  constraints:
                                  const BoxConstraints(maxWidth: 400),
                                  child: Column(
                                      // mainAxisAlignment:
                                      // MainAxisAlignment.center,
                                      // crossAxisAlignment:
                                      // CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Counter 1',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              icon: Icon(
                                                Icons.remove,
                                                color: Theme.of(context).accentColor,
                                              ),
                                              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
                                              iconSize: 32.0,
                                              color: Theme.of(context).primaryColor,
                                              onPressed: () {
                                                counter--;
                                              },
                                            ),
                                            Text(
                                              '$counter',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Icons.add,
                                                color: Theme.of(context).accentColor,
                                              ),
                                              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
                                              iconSize: 32.0,
                                              color: Theme.of(context).primaryColor,
                                              onPressed: () {
                                                counter++;
                                              },
                                            ),
                                          ],
                                        ),
                                      ]
                                  )
                              )
                          )
                      )
                  )
              )
          ),
        ],
      )
    );
  }
}