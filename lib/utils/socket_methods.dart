import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:type_racer/provider/clientStateProvider.dart';
import 'package:type_racer/provider/game_state_provider.dart';
import 'package:type_racer/utils/socket_client.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  // create game
  createGame(String nickname) {
    if (nickname.isNotEmpty) {
      // emit(String event , Data)
      _socketClient.emit('create-game', {
        'nickname': nickname,
      });
    }
  }

  //join game
  joinGame(String nickname, String gameID) {
    if (gameID.isNotEmpty && nickname.isNotEmpty) {
      _socketClient.emit(
        'join-game',
        {
          'nickname': nickname,
          'gameID': gameID,
        },
      );
    }
  }

  // error handle
  notCorrectGameListener(BuildContext context) {
    _socketClient.on(
      'notCorrectGame',
      (data) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(data),
        ),
      ),
    );
  }

  // timer
  startTimer(playerId, gameID) {
    _socketClient.emit(
      'timer',
      {
        'playerId': playerId,
        'gameID': gameID,
      },
    );
  }

  sendUserInput(String value, String gameID) {
    _socketClient.emit('userInput', {
      'userInput': value,
      'gameID': gameID,
    });
  }

  updateTimer(BuildContext context) {
    final clientStateProvider = Provider.of<ClientStateProvider>(context, listen: false);
    _socketClient.on('timer', (data) {
      clientStateProvider.setClientState(data);
    });
  }

  // listeners
  updateGameListener(BuildContext context) {
    _socketClient.on('updateGame', (data) {
      final gameStateProvider = Provider.of<GameStateProvider>(context, listen: false).updateGameState(
        id: data['_id'],
        players: data['players'],
        isJoin: data['isJoin'],
        words: data['words'],
        isOver: data['isOver'],
      );

      if (data['_id'].isNotEmpty) {
        Navigator.pushNamed(context, '/game-screen');
      }
    });
  }

  updateGame(BuildContext context) {
    _socketClient.on('updateGame', (data) {
      final gameStateProvider = Provider.of<GameStateProvider>(context, listen: false).updateGameState(
        id: data['_id'],
        players: data['players'],
        isJoin: data['isJoin'],
        words: data['words'],
        isOver: data['isOver'],
      );
    });
  }

  gameFinishedListener() {
    _socketClient.on(
      'done',
      (data) => _socketClient.off('timer'),
    );
  }
}
