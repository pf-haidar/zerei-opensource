import 'package:flutter/material.dart';
import 'package:zerei_opensource/core/models/game_status_model.dart';

const gameStatusData = [
  GameStatusModel(
    id: '0',
    title: 'Quero Jogar',
    color: Colors.cyan,
  ),
  GameStatusModel(
    id: '1',
    title: 'Jogando',
    color: Colors.green,
  ),
  GameStatusModel(
    id: '2',
    title: 'Zerado!',
    color: Colors.indigoAccent,
  ),
  GameStatusModel(
    id: '3',
    title: 'Engavetado',
    color: Colors.orange,
  ),
  GameStatusModel(
    id: '4',
    title: 'Abandonado',
    color: Colors.red,
  ),
];