// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_flutter/model/pokemon_model.dart';
import 'package:pokedex_flutter/services/pokedex_api.dart';
import 'package:pokedex_flutter/widgets/pokelist_items.dart';

class PokemonList extends StatefulWidget {
  PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _data;
  @override
  void initState() {
    super.initState();
    _data = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> _listem = snapshot.data!;
          // return ListView.builder(
          //   itemBuilder: (context, index) {
          //     var oAnkiPokemon = _listem[index];
          //     return PokeListItem(pokemon: oAnkiPokemon);
          //   },
          //   itemCount: _listem.length,
          // );

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  ScreenUtil().orientation == Orientation.portrait ? 2 : 3,
            ),
            itemBuilder: (context, index) {
              return PokeListItem(
                pokemon: _listem[index],
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      future: _data,
    );
  }
}
