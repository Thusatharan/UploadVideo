import 'dart:io';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upload_video/energy_lost_information.dart';

import 'performance_details.dart';

class UploadVideo extends StatefulWidget {
  const UploadVideo({Key? key}) : super(key: key);

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  File? selectedVideo;
  bool? isImageUploaded = false;
  Future pickImage(ImageSource source) async {
    try {
      print('hello');
      final selectedVideo = await ImagePicker().pickVideo(source: source);
      if (selectedVideo == null) return;

      final imageTemporary = File(selectedVideo.path);
      setState(() {
        this.selectedVideo = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      'assets/images/gym1.jpg',
      'assets/images/gym2.jpg',
      'assets/images/gym3.jpg',
    ];
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/gymbg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   title: const Text(
        //     '',
        //     style: TextStyle(color: Colors.purple),
        //   ),
        //   elevation: 0,
        // ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  child: CarouselSlider(
                    items: imageList
                        .map((e) => ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.asset(
                                    e,
                                    width: 1050,
                                    height: 350,
                                    fit: BoxFit.cover,
                                  )
                                ],
                              ),
                            ))
                        .toList(),
                    options: CarouselOptions(
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        autoPlay: true),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(top: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () => pickImage(ImageSource.camera),
                        icon: Icon(Icons.video_call_outlined),
                        color: Colors.orange,
                        iconSize: 100,
                      ),
                      selectedVideo != null
                          ? Text(
                              'Video Catured',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 22),
                            )
                          : Text(
                              'Click the icon to capture a video',
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 22),
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          selectedVideo != null
                              ? ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EnergyLostInformation()),
                                    );
                                  },
                                  child: Text('Energy Lost'),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.deepOrangeAccent),
                                      textStyle: MaterialStateProperty.all(
                                          TextStyle(fontSize: 14))),
                                )
                              : ElevatedButton(
                                  onPressed: null,
                                  child: Text('Energy Lost'),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.grey),
                                      textStyle: MaterialStateProperty.all(
                                          TextStyle(fontSize: 14))),
                                ),
                          selectedVideo != null
                              ? ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PerformaceDetails()),
                                    );
                                  },
                                  child: Text('Performance'),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.deepOrangeAccent),
                                      textStyle: MaterialStateProperty.all(
                                          TextStyle(fontSize: 14))),
                                )
                              : ElevatedButton(
                                  onPressed: null,
                                  child: Text('Performance'),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.grey),
                                      textStyle: MaterialStateProperty.all(
                                          TextStyle(fontSize: 14))),
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
