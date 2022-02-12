part of 'widget.dart';
class PokeData extends StatelessWidget {
  final List<String> ability;
  final Pokemon pokemon;
  final List<int> stat;

  const PokeData({required this.ability, required this.pokemon, required this.stat});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ability',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.6),
                  height: 0.8,
                ),
              ),
              Text(
                ability.join(", ").toString(),
                style: TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Weight',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.6),
                  height: 0.8,
                ),
              ),
              Text(
                pokemon.weight.toString(),
                style: TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'HP',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.6),
                  height: 0.8,
                ),
              ),
              Text(
                stat[0].toString(),
                style: TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Attack',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.6),
                  height: 0.8,
                ),
              ),
              Text(
                stat[1].toString(),
                style: TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Defense',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.6),
                  height: 0.8,
                ),
              ),
              Text(
                stat[2].toString(),
                style: TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Special Attack',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.6),
                  height: 0.8,
                ),
              ),
              Text(
                stat[3].toString(),
                style: TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Special Defense',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.6),
                  height: 0.8,
                ),
              ),
              Text(
                stat[4].toString(),
                style: TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Speed',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.6),
                  height: 0.8,
                ),
              ),
              Text(
                stat[5].toString(),
                style: TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
          SizedBox(height: 5,),
        ],
      ),
    );
  }
}
