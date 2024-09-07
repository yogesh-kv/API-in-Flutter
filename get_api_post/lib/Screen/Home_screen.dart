import 'package:flutter/material.dart';
import 'package:get_api_post/model/Model.dart';
import 'package:get_api_post/service/getapiservice.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostsModel> postsmodel = [];

  GetPost() {
    Getapiservice().getPostsModel().then((value) {
      setState(() {
        postsmodel = value!;
      });
    });
  }

  @override
  void initState() {
    GetPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Get Post Api"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: postsmodel.length,
        itemBuilder: (context, index) {
          final apidata = postsmodel[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(200),
                      ),
                      child: Center(
                        child: Text(
                          apidata.id.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            apidata.title.toString(),
                            maxLines: 1,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            apidata.body.toString(),
                            maxLines: 4,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
