import 'dart:convert';

import 'package:ecomerce/model/Restaurant_model.dart';
import 'package:ecomerce/provider/restaurant_provider.dart';
import 'package:ecomerce/screens/restaurant_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:provider/provider.dart';

class RestaurantSearch extends StatefulWidget {
  const RestaurantSearch({Key? key}) : super(key: key);

  @override
  _RestaurantSearchState createState() => _RestaurantSearchState();
}

Future<Map> getRestoruntsData() async {
  var data = await RestaurantService.getAllProducts();

  return data;
}

class _RestaurantSearchState extends State<RestaurantSearch> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  // final jsondata =  rootBundle.rootBundle
  //    .loadString('assets/kuriftujson/Kuriftu_restaurant.json');
  // final List<Map<String, dynamic>> _allUsers = [
  //   {"id": 1, "name": "Andy", "age": 29},
  //   {"id": 2, "name": "Aragon", "age": 40},
  //   {"id": 3, "name": "Bob", "age": 5},
  //   {"id": 4, "name": "Barbara", "age": 35},
  //   {"id": 5, "name": "Candy", "age": 21},
  //   {"id": 6, "name": "Colin", "age": 55},
  //   {"id": 7, "name": "Audra", "age": 30},
  //   {"id": 8, "name": "Banana", "age": 14},
  //   {"id": 9, "name": "Caversky", "age": 100},
  //   {"id": 10, "name": "Becky", "age": 32},
  // ];
  // List info = [];
  // @override
  // _inItData() {
  //   DefaultAssetBundle.of(context)
  //       .loadString("assets/kuriftujson/Kuriftu_restaurant.json")
  //       .then((value) {
  //     setState(() {
  //       info = json.decode(value);
  //       print(info);
  //     });
  //   });
  // }

  // This list holds the data for the list view
  List<Restaurants>? _foundUsers = [];
  Future<Map>? RestaurantList;
  late RestaurantProvider productProvider;

  @override
  initState() {
    var snap = getRestoruntsData();
    // // at the beginning, all users are shown
    // List<Restaurants> res = snap as List<Restaurants>;
    RestaurantList = getRestoruntsData();
    // _foundUsers = res as Future<Map>?;
    super.initState();
    //_inItData();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword, List<Restaurants>? _allUser) {
    print(_allUser!.length);
    print("this is all");
    List<Restaurants> results;
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUser;
    } else {
      results = _allUser
          .where((element) =>
              element.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kuriftu Restaurants'),
        ),
        body: FutureBuilder<Map>(
          future: RestaurantList,
          builder: (BuildContext context, AsyncSnapshot<Map> snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return Container(
                child: Center(child: CircularProgressIndicator()),
              );
            } else if (snapShot.hasData) {
              List<Restaurants> res =
                  snapShot.data!['data'] as List<Restaurants>;
              context.read<RestaurantProvider>().initRestaurants(res);
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      onChanged: (value) => _runFilter(value, res),
                      decoration: const InputDecoration(
                          labelText: 'Search', suffixIcon: Icon(Icons.search)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: _foundUsers!.isNotEmpty
                          ? ListView.builder(
                              itemCount: _foundUsers!.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  key: ValueKey(_foundUsers![index].code),
                                  color: Colors.amberAccent,
                                  elevation: 4,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: ListTile(
                                    leading: Text(
                                      _foundUsers![index].name,
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    title: Text(_foundUsers![index]
                                        .childrens
                                        .length
                                        .toString()),
                                    subtitle: Text(
                                        '${_foundUsers![index].qty.toInt()} '),
                                  ),
                                );
                              })
                          : const Text(
                              'No results found',
                              style: TextStyle(fontSize: 24),
                            ),
                    ),
                  ],
                ),
              );
            } else {
              return Text("No data to find");
            }
          },
        ));
  }
}
