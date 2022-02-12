import 'package:batara_pokedex/core/core.dart';
import 'package:batara_pokedex/pokemon/model/model.dart';
import 'package:batara_pokedex/pokemon/repositories/pokemon_repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'allpokemon_state.dart';

class AllpokemonCubit extends Cubit<AllPokemonState> {
  AllpokemonCubit() : super(AllPokemonInitial());

  Future<void> getAllPokemon() async {
    ApiReturnValue<List<AllPokemon>> result = await PokemonRepository.getAllPokemon();
    if (result.value != null) {
      emit(AllPokemonLoaded(result.value));
    } else {
      emit(AllPokemonLoadingFailed());
    }
  }
}
