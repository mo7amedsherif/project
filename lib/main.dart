import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() =>MyAppState();
}
class MyAppState extends State<MyApp>{
  final AudioPlayer _player = AudioPlayer();
  Future<void> playSound() async {
    await _player.play(AssetSource('audio/mo3.mp3'));
  }

  // إيقاف الصوت
  Future<void> stopSound() async {
    await _player.stop();
  }
  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 154, 215, 210),
        
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(168, 150, 90, 1),
          title: const Text('iBookCast'),
          //iconTheme: Icon(Icons.headphones_rounded,color:Color.fromRGBO(206, 82, 60,1),),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/image/mo.jpg',width: 50,height: 100,),
              // ignore: prefer_const_constructors
              Text('book1',
              textAlign: TextAlign.center,
              textScaler: const TextScaler.linear(2),
              selectionColor: Colors.deepOrange,
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed:playSound,
              style: ElevatedButton.styleFrom(
                backgroundColor:Colors.green),
              child:const Text('Play'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed:stopSound,
              style: ElevatedButton.styleFrom(
                backgroundColor:Colors.red),
              child:const Text('stop'),
              ),
            ],
            
          ),
        ),
      ),
    );
  }

}
//  child: GestureDetector(
//           onTap: () {
//             AudioPlayer().play(AssetSource('audio/mo3.mp3'));
//           },
//           onDoubleTap: () {
//             AudioPlayer().stop();
//           },
//           child: ElevatedButton.icon(
//               onPressed: null,
//               icon: Image.asset(
//                 'assets/image/mo.jpg',
//                 width: 200,
//                 height: 100,
//               ),
//               label: const Text('book1')),
//         )