import 'package:flutter/material.dart';

class AddNewProject extends StatefulWidget {
  const AddNewProject({Key? key}) : super(key: key);

  @override
  State<AddNewProject> createState() => _AddNewProjectState();
}

class _AddNewProjectState extends State<AddNewProject> {
  bool enableFeature = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Project'),
      ),
      body: Stack(
        children: [
          Form(
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
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        ...[
                                        TextFormField(
                                          decoration: const InputDecoration(
                                            border: UnderlineInputBorder(),
                                            filled: true,
                                            hintText: 'Enter project name',
                                            labelText: 'Project Name',
                                          ),
                                        ),
                                        // TextFormField(
                                        //   maxLines: null,
                                        //   decoration: const InputDecoration(
                                        //     border: UnderlineInputBorder(),
                                        //     filled: true,
                                        //     hintText: 'Enter notes',
                                        //     labelText: 'Notes',
                                        //   ),
                                        // ),
                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //   crossAxisAlignment: CrossAxisAlignment.center,
                                        //   children: [
                                        //     Text('Enable feature',
                                        //         style: Theme.of(context).textTheme.bodyLarge),
                                        //     Switch(
                                        //       value: enableFeature,
                                        //       onChanged: (enabled) {
                                        //         setState(() {
                                        //           enableFeature = enabled;
                                        //         });
                                        //       },
                                        //     ),
                                        //   ],
                                        // ),
                                      ].expand(
                                                (widget) => [
                                              widget,
                                              const SizedBox(
                                                height: 24,
                                              )
                                            ]
                                        )
                                      ]
                                  ))))))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(16),
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Add',
                    style: TextStyle(
                      fontSize: 18,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}