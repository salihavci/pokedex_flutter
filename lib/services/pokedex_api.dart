import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/model/pokemon_model.dart';

class PokeApi {
  static const String _url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  static Future<List<PokemonModel>> getPokemonData() async {
    List<PokemonModel> _list = [];
    var result = await Dio().get(_url);
    var pokemonList = jsonDecode(result.data)['pokemon'];
    // debugPrint(pokemonList['pokemon'].toString());
    if (pokemonList is List) {
      _list = pokemonList
          .map(
            (e) => PokemonModel.fromMap(e),
          )
          .toList();
    } else {
      return [];
    }
    debugPrint(_list.length.toString());
    debugPrint(_list.first.toString());
    return _list;
  }
}
