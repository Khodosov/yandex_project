import 'package:flutter/material.dart';
import 'package:yandex_project/presentation/screens/home/widgets/bottom_bar.dart';
import 'package:yandex_project/presentation/screens/home/widgets/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Stack(
        children: [
          ListView(),
          const Positioned(
            bottom: 10,
            child: SearchBar(),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
