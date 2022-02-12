part of 'allpokemon_cubit.dart';

abstract class AllPokemonState extends Equatable {
  const AllPokemonState();
}

class AllPokemonInitial extends AllPokemonState {
  @override
  List<Object> get props => [];
}
class AllPokemonLoadingFailed extends AllPokemonState {
  @override
  List<Object> get props => [];
}

class AllPokemonLoaded extends AllPokemonState{
  final List<AllPokemon?>? allPokemon;

  AllPokemonLoaded(this.allPokemon);

  @override
  List<Object?> get props => [allPokemon];

}