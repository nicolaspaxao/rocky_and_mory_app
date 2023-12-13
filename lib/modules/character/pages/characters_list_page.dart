import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricky_and_mory_app/app_export.dart';

class CharactersListPage extends StatelessWidget {
  const CharactersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rich and Morty'),
      ),
      body: GetBuilder<CharactersController>(
        builder: (_) {
          if (charactersController.characters.isEmpty) {
            return const StandartLoading();
          }
          return ListView.builder(
            controller: charactersController.scrollController,
            itemCount: charactersController.characters.length + 1,
            itemBuilder: (context, index) {
              if (index < charactersController.characters.length) {
                final character = charactersController.characters[index];
                return ListTile(
                  leading: Image.network(character.image!),
                  title: Text('${character.name}'),
                );
              } else {
                return const StandartLoading();
              }
            },
          );
        },
      ),
    );
  }
}

class StandartLoading extends StatelessWidget {
  const StandartLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.blueAccent,
      ),
    ).paddingAll(8);
  }
}
