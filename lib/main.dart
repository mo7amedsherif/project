import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final List<AudioPlayer> _player = List.generate(8, (_) => AudioPlayer());
  final List<bool> isPlaying = List.generate(8, (_) => false);

  Future<void> playSound(int index, String audiopath) async {
    if (!isPlaying[index]) {
      await _player[index].play(AssetSource(audiopath));
    }

    setState(() {
      isPlaying[index] = true;
    });
  }

  // إيقاف الصوت
  Future<void> stopSound(int index) async {
    await _player[index].stop();
    setState(() {
      isPlaying[index] = false;
    });
  }

  @override
  void dispose() {
    for (var player in _player) {
      player.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(238, 81, 87, 90),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 42, 43, 43),
          title: const Row(
            children: [
              Icon(
                Icons.headphones,
                color: Colors.amber,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'iBookCast',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 210,
              ),
            ],
          ),
          actions: [
            Icon(
              Icons.menu_rounded,
              color: Colors.amber[400],
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            _audiosourc(0, 'assets/image/img1.png', 'assets/audio/aud1.mp3',
                'التركيز الفائق: كيف تكون أكثر إنتاجية في عالم من التشتت'),
            const SizedBox(height: 20),
            _audiosourc(1, 'assets/image/img2.png', 'assets/audio/aud2.mp3',
                'مراجعة الكاريزما الأكثر تأثيرًا '),
            const SizedBox(height: 20),
            _audiosourc(2, 'assets/image/img3.png', 'assets/audio/aud3.mp3',
                'كيف يعمل الخوف؟ ثقافة الخوف في القرن الواحد والعشرين'),
            const SizedBox(height: 20),
            _audiosourc(3, 'assets/image/img4.png', 'assets/audio/aud4.mp3',
                'مراجعة علم نفس الغباء '),
            const SizedBox(height: 20),
            _audiosourc(4, 'assets/image/img5.png', 'assets/audio/aud5.mp3',
                'صيام الدوبامين: وصفة التحكم في المادة السحرية للتركيز والسعادة والنشاط'),
            const SizedBox(height: 20),
            _audiosourc(5, 'assets/image/img6.png', 'assets/audio/aud6.mp3',
                'خازوقولوجي: علم دراسة الخازوق'),
            const SizedBox(height: 20),
            _audiosourc(5, 'assets/image/img7.png', 'assets/audio/aud7.mp3',
                'ماذا حدث لك؟ محادثات حول الصدمة، الصمود، والشفاء'),
            const SizedBox(height: 20),
            _audiosourc(5, 'assets/image/img8.png', 'assets/audio/aud8.mp3',
                'لماذا لا تذهب الخراف إلى الطبيب'),
            const SizedBox(height: 20),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 42, 43, 43),
          selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
          unselectedItemColor: Colors.amber[400],
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }

  Widget _audiosourc(
      int index, String imagepath, String audiopath, String name) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 98, 118, 123),
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagepath,
            width: 90,
            height: 90,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
            width: 50,
          ),
          Text(
            name,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 253, 254, 254)),
          ),
          const SizedBox(
            height: 10,
            width: 30,
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => playSound(index, audiopath),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 202, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Icon(
                  Icons.play_circle_outline,
                  color: Colors.lightGreen,
                ),
              ),
              const SizedBox(
                width: 20,
                height: 10,
              ),
              ElevatedButton(
                onPressed: () => stopSound(index),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 202, 40)),
                child: const Icon(
                  Icons.stop_circle_outlined,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
