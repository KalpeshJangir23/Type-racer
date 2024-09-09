import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:type_racer/provider/clientStateProvider.dart';
import 'package:type_racer/provider/game_state_provider.dart';
import 'package:type_racer/screen/create_screen.dart';
import 'package:type_racer/screen/game_screen.dart';
import 'package:type_racer/screen/homeScreen.dart';
import 'package:type_racer/screen/joinRoomScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GameStateProvider()),
        ChangeNotifierProvider(
          create: (context) => ClientStateProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Type racer Clone',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 234, 78)),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/create-room': (context) => const CreateRoomScreen(),
          '/join-room': (context) => const JoinRoomScreen(),
          '/game-screen': (context) => const GameScreen(),
        },
      ),
    );
  }
}
