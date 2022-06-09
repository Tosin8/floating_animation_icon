import 'package:flutter/material.dart';
import 'package:animator/animator.dart';

void main() {
  runApp(
    const MaterialApp(home: MyCustomWidget()),
  );
}

class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({Key? key}) : super(key: key);

  @override
  State<MyCustomWidget> createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
            child: SizedBox(
                height: width / 2.75,
                width: width / 4,
                child: Animator<double>(
                    duration: const Duration(milliseconds: 2000),
                    cycles: 0,
                    curve: Curves.easeInOut,
                    tween: Tween<double>(begin: 0.0, end: 10.0),
                    builder: (context, animatorState, child) =>
                        Column(children: [
                          SizedBox(
                            height: animatorState.value * 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.pink.withOpacity(.15),
                                  blurRadius: 20,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.pink,
                              size: 80,
                            ),
                          )
                        ])))));
  }
}
