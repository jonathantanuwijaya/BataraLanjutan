part of 'pages.dart';

class PokemonDetailPage extends StatefulWidget {
  final String pokeId;

  const PokemonDetailPage({required this.pokeId});

  @override
  _PokemonDetailPageState createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<PokemonCubit, PokemonState>(
            builder: (context, state) {
              Pokemon? pokemon = (state as SpecificPokemonLoaded).pokemon;
              var type = state.pokemon!.types.map((e) => e.type.name).toList();
              return Container(
                color: Colors.teal[300],
                child: Column(
                  children: <Widget>[
                    _buildAppBar(widget.pokeId, pokemon!.name),
                    SizedBox(height: 9),
                    _buildPokemonName(pokemon.name),
                    SizedBox(height: 9),
                    _buildPokemonTypes(type),
                    SizedBox(height: 25),
                    _buildPokemonImage(context),
                    _buildPokemonData(pokemon),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(String pokeId, String name) {
    return Padding(
      padding: EdgeInsets.only(
        left: 28,
        right: 28,
        top: 60,
        bottom: 22,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.arrow_back, color: Colors.white)),
          ),
          GestureDetector(
            onTap: () {
              context.read<MypokemonCubit>().StoreMyPokemon(name);
            },
            child: Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.favorite_border, color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildPokemonName(String name) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Material(
            color: Colors.transparent,
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 22,
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: Text(
              "#${widget.pokeId}",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPokemonTypes(List<String> type) {
    return Container(
      height: 30,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: type.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      PokemonTypeCard(
                        type[index],
                        large: true,
                      ),
                      SizedBox(
                        width: 7,
                      )
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }

  Widget _buildPokemonImage(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: screenHeight * 0.24,
        child: Image.network(
          "$imageUrl/${widget.pokeId}.png",
          width: screenHeight * 0.28,
          height: screenHeight * 0.28,
          alignment: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Widget _buildPokemonData(Pokemon pokemon) {
    var ability = pokemon.abilities.map((e) => e.ability.name).toList();
    var stat = pokemon.stats.map((e) => e.baseStat).toList();
    return Expanded(
      child: Container(
          padding: EdgeInsets.only(top: 15),
          height: 400,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(40.0),
                topRight: const Radius.circular(40.0),
              )),
          child: Column(
            children: [
              Text('Information and Statistics',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 30,
              ),
              PokeData(ability: ability, pokemon: pokemon, stat: stat),
            ],
          )),
    );
  }
}
