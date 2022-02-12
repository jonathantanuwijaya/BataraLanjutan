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
                // var dd = state.pokemon!.types
                //     .map(
                //         (e) => e.type.name)
                //     .toList();
                // print('LIST OF ABILITY = $dd');
                // Future.wait<void>(
                //     [context.read<AllpokemonCubit>().getAllPokemon()]);
                return PokemonList();
                // return Scaffold(
                //     body: Center(
                //         child: Container(
                //           child: Text(dd.toString()),
                //   // child: ListView.builder(
                //   //   itemCount: 8,
                //   //   itemBuilder: (BuildContext context, int index) {
                //   //     return Container(child: Text(state.pokemon!..toString()));
                //   //   },
                //   // ),
                //   // child: ListView(
                //   //   scrollDirection: Axis.vertical,
                //   //   children: [
                //   //     Column(
                //   //         children: (state.pokemon!.types.length > 0)
                //   //             ? state.pokemon!.abilities
                //   //                 .map(
                //   //                     (e) => Container(child: Text(e.ability.name)))
                //   //                 .toList()
                //   //             : Container(child: Text('Hello World')) as List<Widget>)
                //   //   ],
                //   // ),
                // )));
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
