import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ricky_and_mory_app/app_export.dart';
import 'package:shimmer/shimmer.dart';

class CharactersListPage extends StatelessWidget {
  const CharactersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rich and Morty',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'Characters',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        actions: [
          Obx(() {
            return IconButton(
              onPressed: () => themeController.changeTheme(),
              color: themeController.isDark.value
                  ? AppColors.whiteColor
                  : AppColors.darkBlue3.withOpacity(.6),
              icon: FaIcon(
                themeController.isDark.value
                    ? FontAwesomeIcons.solidSun
                    : FontAwesomeIcons.solidMoon,
                size: 20,
              ),
            );
          })
        ],
      ),
      body: GetBuilder<CharactersController>(
        builder: (_) {
          if (charactersController.characters.isEmpty) {
            return GridView.builder(
              clipBehavior: Clip.none,
              controller: ScrollController(),
              itemCount: 6,
              itemBuilder: (context, index) {
                return const LoaderCustom();
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 16,
              ),
            ).paddingSymmetric(horizontal: 10, vertical: 20);
          }
          return GridView.builder(
            clipBehavior: Clip.none,
            controller: charactersController.scrollController,
            itemCount: charactersController.characters.length + 1,
            itemBuilder: (context, index) {
              if (index < charactersController.characters.length) {
                final character = charactersController.characters[index];
                return CharacterCard(character: character);
              } else if (charactersController.hasNext.value) {
                return const LoaderCustom();
              }
              return null;
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 16),
          ).paddingSymmetric(horizontal: 10, vertical: 20);
        },
      ),
    );
  }
}

class LoaderCustom extends StatelessWidget {
  const LoaderCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Get.isDarkMode
          ? const Color.fromARGB(255, 53, 53, 53)
          : const Color.fromARGB(255, 233, 233, 233),
      highlightColor: Get.isDarkMode
          ? const Color.fromARGB(255, 114, 114, 114)
          : const Color.fromARGB(255, 235, 235, 235),
      child: Container(
        width: 296,
        height: 149,
        decoration: BoxDecoration(
          color: Get.isDarkMode
              ? AppColors.lighterGreyColor
              : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key, required this.character});

  final CharactersModel character;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
      child: Ink(
        decoration: BoxDecoration(
          color: Get.isDarkMode
              ? const Color.fromARGB(255, 53, 53, 53)
              : Colors.white,
          boxShadow: AppBoxShadow.headerBoxShadow,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 120,
                child: CachedNetworkImage(
                  imageUrl: character.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  character.name!,
                  style: Theme.of(context).textTheme.titleSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ).paddingSymmetric(horizontal: 4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
