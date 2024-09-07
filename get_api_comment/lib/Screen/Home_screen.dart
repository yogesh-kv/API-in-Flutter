import 'package:api_data/Service/getapiservice.dart';
import 'package:api_data/model/Model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CommandsModel> commandsModel = [];

  GetComments() {
    Getapiservice().GetCommandsModel().then((value) {
      setState(() {
        commandsModel = value!;
      });
    });
  }

  @override
  void initState() {
    GetComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text("Get Data From Api"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: commandsModel.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final apidata = commandsModel[index];
          return Material(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text(
                          apidata.id.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              apidata.name.toString(),
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              apidata.email.toString(),
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              apidata.body.toString(),
                              maxLines: 3,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
