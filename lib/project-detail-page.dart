import 'package:flutter/material.dart';
import 'package:crochet_app/part-detail-page.dart';
import 'package:crochet_app/add-new-part.dart';


class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({Key? key}) : super(key: key);

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  final List<String> _names = ['Part A', 'Part B', 'Part C'];
  Set<String> favoriteProject = Set<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Project 1"),

      ),
      body: ListView.builder(
        itemBuilder: (_, i) {
          String name = _names[i];
          bool isFavorite = favoriteProject.contains(name);
          return Column(
            children: <Widget>[
              ListTile(
                // leading: Icon(),
                title: Text('$name'),
                // <Add>
                trailing: PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        value: 'edit',
                        child: Text('Edit Name'),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete'),
                      )
                    ];
                  },
                  onSelected: (String value) {
                    print('You Click on po up menu item');
                  },
                ),
                // </Add>
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PartDetailPage()),
                  );
                },
              ),
              Divider(),
            ],
          );
        },
        itemCount: _names.length,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNewPart()),
          );
        },
        label: const Text('New Part'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}