import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerproject/Shared/JokeCard.dart';
import 'package:providerproject/services/jokes_Service.dart';

class JokePage extends StatelessWidget {
  const JokePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<JokeService>().fetchJoke;
    return Scaffold(
      body: RefreshIndicator(child: Center(
        child: Consumer<JokeService>(
          builder: (context, value, child) {
            return value.jokesmap.length == 0 && !value.error
                ? CircularProgressIndicator()
                : value.error
                    ? Text('Oops something went wrong ${value.errorMessage}',
                        textAlign: TextAlign.center)
                    : ListView.builder(
                        itemCount: value.jokesmap['jokes'].length,
                        itemBuilder: (context, index) {
                          return JokeCard(
                              jokemap: value.jokesmap['jokes'][index]);
                        });
          },
        ),
      ), onRefresh: () async {
       await context.read<JokeService>().fetchJoke;
      }),
    );
  }
}
