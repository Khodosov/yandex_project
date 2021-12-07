import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width / 5.5,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          margin: const EdgeInsets.all(8),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                color: Colors.black,
                onPressed: () {},
                icon: const Icon(Icons.favorite),
              ),
              IconButton(
                color: Colors.black,
                onPressed: () {},
                icon: const Icon(Icons.menu),
              ),
              IconButton(
                color: Colors.black,
                onPressed: () {},
                icon: const Icon(Icons.casino),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
