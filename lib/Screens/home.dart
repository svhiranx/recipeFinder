import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipefinder/Models/Datas.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cookbook')),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              child: Text('print'),
              onPressed: () {},
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 30,
        width: 30,
        child: FloatingActionButton(
            elevation: 0,
            backgroundColor: Colors.white,
            onPressed: () => Navigator.pushNamed(context, '/search'),
            child: const Icon(
              Icons.search,
              color: Colors.blue,
            )),
      ),
    );
  }
}
