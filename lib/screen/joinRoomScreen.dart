import 'package:flutter/material.dart';
import 'package:type_racer/widgets/custom_buttons.dart';
import 'package:type_racer/widgets/custom_textfield.dart';
import 'package:type_racer/utils/socket_methods.dart';

class JoinRoomScreen extends StatefulWidget {
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _joinController = TextEditingController();
  final TextEditingController _gameIDController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void dispose() {
    _joinController.dispose();
    _gameIDController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _socketMethods.updateGameListener(context);
    _socketMethods.notCorrectGameListener(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Join Room",
                  style: TextStyle(fontSize: 23),
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
                CustomTextField(
                  controller: _joinController,
                  hintText: "Enter your name",
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: _gameIDController,
                  hintText: "Enter the Game-ID",
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  text: 'Join',
                  onpress: () => _socketMethods.joinGame(_joinController.text, _gameIDController.text),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
