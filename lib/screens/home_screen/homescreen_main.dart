import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:smart_journal/screens/home_screen/icon_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 500,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/background_image/background home.jpeg',
                  ),
                  fit: BoxFit.cover),
            ),
            child: Stack(
              children: [
                const Positioned(
                  right: 12,
                  top: 68,
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/avater_image/smart kuri.jpeg'),
                    radius: 22,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 190,
                  child: Center(
                    child: Marquee(
                      text: 'New scheme add to chitty,enjoy investment!',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Positioned(
                  top: 220,
                  left: 25,
                  right: 25,
                  bottom: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircularIconhome(
                        icontype: Symbols.finance,
                        buttonpress: () {},
                        iconname: 'Statistics',
                      ),
                      CircularIconhome(
                        icontype: Symbols.keyboard_command_key,
                        buttonpress: () {},
                        iconname: 'Scheme',
                      ),
                      CircularIconhome(
                        icontype: Symbols.group,
                        buttonpress: () {},
                        iconname: 'Members',
                      ),
                      CircularIconhome(
                        icontype: Symbols.alarm,
                        buttonpress: () {},
                        iconname: 'Reminder',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.65,
            minChildSize: 0.6,
            maxChildSize: 1,
            builder: (context, controller) => Container(
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(199, 245, 245, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Notification',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(29, 27, 32, 1)),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'See All',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(29, 27, 32, 1)),
                              ))
                        ],
                      ),
                      //
                    ],
                  ),
                )
                //
                ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          label: const Text(
            'Update',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
          icon: const Icon(
            Icons.add,
            color: Colors.white,
            weight: 800,
          ),
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Adjust radius as needed
          ),
          onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
