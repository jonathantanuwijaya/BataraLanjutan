part of 'mypokemon_cubit.dart';

abstract class MypokemonState extends Equatable {
  const MypokemonState();
}

class MypokemonInitial extends MypokemonState {
  @override
  List<Object> get props => [];
}

class MyPokemonLoaded extends MypokemonState {
  List<String> pokemon;

  MyPokemonLoaded(this.pokemon);

  @override
  // TODO: implement props
  List<Object?> get props => [pokemon];
}
