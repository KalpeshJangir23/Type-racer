import 'package:flutter/material.dart';
import 'package:type_racer/widgets/custom_buttons.dart';
import 'package:type_racer/widgets/custom_textfield.dart';
import 'package:type_racer/utils/socket_client.dart';
import 'package:type_racer/utils/socket_methods.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _createController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void dispose() {
    _createController.dispose();
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
                  "Create Room",
                  style: TextStyle(fontSize: 23),
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
                CustomTextField(
                  controller: _createController,
                  hintText: "Enter your name",
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  text: 'Create',
                  onpress: () {
                    _socketMethods.createGame(_createController.text);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
