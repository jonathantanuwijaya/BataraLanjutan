import 'package:batara_pokedex/core/core.dart';
import 'package:batara_pokedex/pokemon/model/allpokemon.dart';
import 'package:batara_pokedex/pokemon/model/model.dart';

class PokemonRepository {
  static final _http = HttpServices();
  static final _log = AppLogger('PokemonRepository');

  static Future<ApiReturnValue<Pokemon>> getSpecificPokemon(String pokeId) async {
    String url = '$baseUrl/$pokeId';
    try {
      var response = await _http.get(url);
      _log.info('Response from GET Request (Get Specific Pokemon) : $response');
      Pokemon value = Pokemon.fromMap(response);
      return ApiReturnValue(value: value);
    } on ApiResponseException catch (e) {
      _log.error('ERROR Message == ${e.message}');
      return ApiReturnValue(message: e.message);
    }
  }

  static Future<ApiReturnValue<List<AllPokemon>>> getAllPokemon() async {
    String url = '$baseUrl?limit=100';
    try {
      var response = await _http.get(url);
      _log.info('Response from GET Request (Get All Pokemon) : $response');
      List<AllPokemon> value = (response['results'] as Iterable)
          .map((e) => AllPokemon.fromMap(e))
          .toList();
      return ApiReturnValue(value: value);
    } on ApiResponseException catch (e) {
      _log.error('ERROR Message == ${e.message}');
      return ApiReturnValue(message: e.message);
    }
  }
}
