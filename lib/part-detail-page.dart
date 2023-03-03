import 'package:flutter/material.dart';


class PartDetailPage extends StatefulWidget {
  const PartDetailPage({Key? key}) : super(key: key);

  @override
  State<PartDetailPage> createState() => _PartDetailPageState();
}

class _PartDetailPageState extends State<PartDetailPage> {
  final List<String> _names = ['Part A', 'Part B', 'Part C'];
  Set<String> favoriteProject = Set<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Part A"),

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
                // onTap: (){
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => ProjectDetailPage()),
                //   );
                // },
              ),
              Divider(),
            ],
          );
        },
        itemCount: _names.length,
      ),
    );
  }
}