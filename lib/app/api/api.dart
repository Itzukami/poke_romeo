import 'package:get/get.dart';
import 'package:poke_romeo/app/models/allPokemon.dart';
import 'package:poke_romeo/app/models/indexpokemon.dart';

class ApiConnect extends GetConnect {
  Future<Index> getAllPokemon() async {
    final response = await get(
      'https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0',
    );

    /* var data = <Data>[];
    var data1 = <Result>[];
     if (response.body['results'] != null) {
      for (var element in response.body['results']) {
        data.clear();
        data.add(
          await getPokemon(element['url']),
        );
        data1.add(Result(name: element['name'], data: data[0]));
      }
    } 

    final resultado = AllPokemon(
      count: response.body['count'],
      results: data1,
    );
*/
    Index data = Index.fromMap(response.body);
    return data;
  }

  Future<AllPokemon> getPokemon(String url) async {
    final response = await get(
      url,
    );
    AllPokemon data = AllPokemon.fromMap(response.body);
    return data;
  }
}
