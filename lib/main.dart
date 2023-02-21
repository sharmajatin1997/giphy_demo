import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:giphy_picker/giphy_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Giphy Picker Demo',
      home: MyHomePage(title: 'Giphy Picker Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GiphyGif? _gif;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_gif?.title ?? 'Giphy Picker'),
      ),
      body: SafeArea(
        child: Center(
          child: _gif == null
              ? const Text('Pick a gif..')
              : GiphyImage.original(gif: _gif!,showGiphyAttribution: false,),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: () async {
          final gif = await GiphyPicker.pickGif(
            context: context,
            showGiphyAttribution: false,
            //Use Your API Key Of GIPHY
            apiKey: '',
          );

          if (gif != null) {
            setState(() => _gif = gif);
            print(gif);
          }
        },
      ),
    );
  }
}