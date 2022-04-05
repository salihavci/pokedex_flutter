import 'package:flutter/material.dart';
import 'package:pokedex_flutter/widgets/app_title.dart';
import 'package:pokedex_flutter/widgets/pokemon_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => Column(
          children: [
            AppTitle(),
            Expanded(
              child: PokemonList(),
            ),
          ],
        ),
      ),
    );
  }
}
