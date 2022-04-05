import 'package:flutter/material.dart';

class PokeImageAndBall extends StatelessWidget {
  const PokeImageAndBall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = 'images/pokeball.png';
    return Stack(
      children: [
        Image.asset(pokeballImageUrl),
      ],
    );
  }
}
