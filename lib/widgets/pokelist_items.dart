import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_flutter/constants/poke_constants.dart';
import 'package:pokedex_flutter/constants/ui_helper.dart';
import 'package:pokedex_flutter/model/pokemon_model.dart';
import 'package:pokedex_flutter/pages/detail_page.dart';
import 'package:pokedex_flutter/widgets/poke_image_and_ball.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeListItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(pokemon: pokemon),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.w),
        ),
        elevation: 3,
        shadowColor: Colors.white,
        color: UIHelper.getColorFromType(pokemon.type![0]),
        child: Padding(
          padding: UIHelper.getDefaultPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pokemon.name ?? "N/A",
                style: Constants.getPokemonNameStyle(),
              ),
              Chip(
                label: Text(
                  pokemon.type!.first,
                  style: Constants.getTypeChipStyle(),
                ),
              ),
              Expanded(
                child: PokeImageAndBall(pokemon: pokemon),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
