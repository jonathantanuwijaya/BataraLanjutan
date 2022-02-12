import 'package:batara_pokedex/pokemon/cubit/allpokemon_cubit.dart';
import 'package:batara_pokedex/pokemon/cubit/mypokemon_cubit.dart';
import 'package:batara_pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:batara_pokedex/pokemon/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>PokemonCubit()),
        BlocProvider(create: (_)=>MypokemonCubit()),
        BlocProvider(create: (_)=>AllpokemonCubit()..getAllPokemon())
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Batara Pokedex',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: BlocBuilder<AllpokemonCubit, AllPokemonState>(
            builder: (context, state) {

              if (state is AllPokemonLoaded) {
                return PokemonList();
              } else {
                return Scaffold(
                    body: Center(child: CircularProgressIndicator()));
              }
            },
          ),
        ),
      ),
    );
  }
}
