import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: PageView(
              children: [
                Container(
                  color: Colors.red,
                  child: const Center(
                    child: Text('Page 1'),
                  ),
                ),
                Container(
                  color: Colors.indigo,
                  child: const Center(
                    child: Text('Page 2'),
                  ),
                ),
                Container(
                  color: Colors.green,
                  child: const Center(
                    child: Text('Page 3'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('SKIP'),
                  ),
                  TextButton(onPressed: () {}, child: const Text('NEXT'))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
