import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddStoryPage extends StatefulWidget {
  AddStoryPage({super.key, required this.imageFile});

  /// Variables
  File imageFile;

  @override
  State<AddStoryPage> createState() => _AddStoryPageState();
}

class _AddStoryPageState extends State<AddStoryPage> {
  TextEditingController descriptionController = TextEditingController();

  /// Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.file(
            widget.imageFile,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.18,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Card(
              color: Colors.black.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.send),
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
