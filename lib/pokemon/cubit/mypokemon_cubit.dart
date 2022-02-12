import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mypokemon_state.dart';

class MypokemonCubit extends Cubit<MypokemonState> {
  MypokemonCubit() : super(MyPokemonLoaded([]));
  List<String> favPokemon = [];

  Future<void> getMyPokemon() async {

    emit(MyPokemonLoaded(favPokemon));
  }

  Future<void> StoreMyPokemon(String name) async {
    favPokemon.add(name);
    emit(MyPokemonLoaded(favPokemon));
  }
}
