part of 'pokemon_cubit.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();
}

class PokemonInitial extends PokemonState {
  @override
  List<Object> get props => [];
}
class PokemonLoadingFailed extends PokemonState {
  @override
  List<Object> get props => [];
}

class SpecificPokemonLoaded extends PokemonState {
  final Pokemon? pokemon;

  SpecificPokemonLoaded(this.pokemon);

  @override
  // TODO: implement props
  List<Object?> get props => [pokemon];

}
