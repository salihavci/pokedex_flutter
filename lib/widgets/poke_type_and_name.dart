import 'package:flutter/material.dart';
import 'package:pokedex_flutter/constants/poke_constants.dart';
import 'package:pokedex_flutter/model/pokemon_model.dart';

class PokeTypeAndName extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeTypeAndName({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              pokemon.name ?? '',
              style: Constants.getPokemonNameStyle(),
            ),
            Text(
              '${pokemon.id}',
              style: Constants.getPokemonNameStyle(),
            ),
          ],
        ),
        Chip(
          label: Text(
            pokemon.type?.join(' , ') ?? '',
            style: Constants.getTypeChipStyle(),
          ),
        ),
      ],
    );
  }
}
