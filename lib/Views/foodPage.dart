import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerproject/Shared/FoodCard.dart';
import 'package:providerproject/services/food_Service.dart';

class FoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<FoodService>().fetchData;
    return Scaffold(
      body: RefreshIndicator(onRefresh: () async {
        await context.read<FoodService>().fetchData;
      }, child:
          Center(
            child: Consumer<FoodService>(builder: (context, value, child) {
        return value.map.length == 0 && !value.error
            ? CircularProgressIndicator()
            : value.error
                ? Text('Oops something went wrong ${value.errorMessage}',
                    textAlign: TextAlign.center)
                : ListView.builder(
                    itemCount: value.map['results'].length,
                    itemBuilder: (context, index) {
                      return FoodCard(map: value.map['results'][index]);
                    });
      }
      )
      )
      ),
    );
  }
}
