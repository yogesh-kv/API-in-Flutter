import 'package:flutter/material.dart';
import 'package:get_user_details_api/Model/user_model.dart';
import 'package:get_user_details_api/Service/getuserapiservice.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserDetails> userdetails = [];

  getUserDetails() {
    Getuserapiservice().getUserDetails().then((value) {
      setState(() {
        userdetails = value!;
      });
    });
  }

  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        shrinkWrap: true,
        itemCount: userdetails.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final getdata = userdetails[index];
          return Container(
            child: Column(
              children: [
                Text(
                  userdetails.first.toString(),
                  style: TextStyle(),
                ),
                Text(
                  userdetails.username
                  style: TextStyle(),
                ),
                Text(
                  userdetails.first.toString(),
                  style: TextStyle(),
                ),
                Text(
                  userdetails.first.toString(),
                  style: TextStyle(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
