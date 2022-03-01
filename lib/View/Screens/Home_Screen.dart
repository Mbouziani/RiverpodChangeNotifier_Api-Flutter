import 'package:demo_riverpod_api/Controler/data_api.dart';
import 'package:demo_riverpod_api/View/Widget/Card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.read(DataFuture);
    print(data.user.length);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Demo Api App with Riverpod Provider',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: data.user.length,
          itemBuilder: (context, index) => CardItem(
            index: index,
          ),
        ),
      ),
    );
  }
}
