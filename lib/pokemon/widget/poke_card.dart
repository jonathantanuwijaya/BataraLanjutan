part of 'widget.dart';

class PokeCard extends StatelessWidget {
  const PokeCard(
      this.allpokemon, {
        required this.onPress,
      }) ;

  final AllPokemon? allpokemon;
  final VoidCallback onPress;

  Widget _buildCardContent() {
    String pokeId = allpokemon!.url.split('/')[6];
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Text(
              allpokemon!.name,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "#$pokeId",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildDecorations(double itemHeight) {
    return [
      Positioned(
        top: -itemHeight * 0.616,
        left: -itemHeight * 0.53,
        child: CircleAvatar(
          radius: itemHeight * 1.03 / 2,
          backgroundColor: Colors.white.withOpacity(0.14),
        ),
      ),
    ];
  }

  Widget _buildShadow(double itemWidth) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: itemWidth * 0.82,
        height: 11,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 3),
              blurRadius: 23,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final itemHeight = constrains.maxHeight;
        final itemWidth = constrains.maxWidth;

        return Stack(
          children: <Widget>[
            _buildShadow(itemWidth),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.all(0),
              color: Colors.teal,
              splashColor: Colors.white10,
              highlightColor: Colors.white10,
              elevation: 0,
              highlightElevation: 2,
              onPressed: onPress,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    _buildCardContent(),
                    ..._buildDecorations(itemHeight),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
