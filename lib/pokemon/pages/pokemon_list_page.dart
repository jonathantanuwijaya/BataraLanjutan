part of 'pages.dart';

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color(0xFFF6F7F9),
        child: BlocBuilder<AllpokemonCubit, AllPokemonState>(
            builder: (context, state) => (state is AllPokemonLoaded)
                ? ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 28, right: 28, top: 20, bottom: 22),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Pokedex",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                                onTap: () async {
                                  context.read<MypokemonCubit>().getMyPokemon();
                                  await Future<void>.delayed(
                                      const Duration(milliseconds: 500));
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyPokemonListPage()));
                                },
                                child: Text('My Pokemon'))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2.44,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 12,
                            ),
                            itemCount: state.allPokemon!.length,
                            itemBuilder: (context, index) {
                              String pokeId =
                                  state.allPokemon![index]!.url.split('/')[6];
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 3),
                                child: PokeCard(
                                  state.allPokemon![index],
                                  onPress: () async {
                                    context
                                        .read<PokemonCubit>()
                                        .getSpecificPokemon(pokeId);

                                    await Future<void>.delayed(
                                        const Duration(milliseconds: 500));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PokemonDetailPage(
                                                    pokeId: pokeId)));
                                  },
                                ),
                              );
                            }),
                      ),
                    ],
                  )
                : Container(
                    child: Text('No data at the moment'),
                  )),
      ),
    );
  }
}
