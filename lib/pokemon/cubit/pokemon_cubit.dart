import 'package:batara_pokedex/core/core.dart';
import 'package:batara_pokedex/pokemon/model/model.dart';
import 'package:batara_pokedex/pokemon/repositories/pokemon_repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(PokemonInitial());

  Future<void> getSpecificPokemon(String pokeId) async {
    ApiReturnValue<Pokemon> result = await PokemonRepository.getSpecificPokemon(pokeId);
    if (result.value != null) {
      emit(SpecificPokemonLoaded(result.value));
    } else {
      emit(PokemonLoadingFailed());
    }
  }
}
