import 'package:flutter/material.dart';
import 'package:get_api_photos/Model/model_photo.dart';
import 'package:get_api_photos/Service/getapiservice.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PhotosModel> photosModel = [];

  GetPhotos() {
    Getapiservice().GetPhotosModel().then((value) {
      setState(() {
        photosModel = value!;
      });
    });
  }

  @override
  void initState() {
    GetPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text("Get APi Photos"),
      ),
      body: GridView.builder(
        shrinkWrap: true,
        itemCount: photosModel.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.5,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        ),
        itemBuilder: (context, index) {
          final getphotos = photosModel[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Image.network(
                    getphotos.url.toString(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.network(
                    getphotos.thumbnailUrl.toString(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    getphotos.title.toString(),
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
