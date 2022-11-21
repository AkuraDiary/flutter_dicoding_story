import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(

      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 200,
          width: 250,
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CircularProgressIndicator(
                  color: Colors.deepOrange,
                  backgroundColor: Colors.blue,
                  strokeWidth: 5,
                ),
                Text(
                  "Masih Loading YGY",
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
