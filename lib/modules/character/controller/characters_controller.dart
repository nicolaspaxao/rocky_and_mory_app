import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricky_and_mory_app/app_export.dart';

class CharactersController extends GetxController {
  final ICharacterRepository _repository;

  CharactersController(this._repository);

  ScrollController scrollController = ScrollController();

  void scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setPage(page.value + 1);
      getCharacters();
    }
  }

  RxInt page = 1.obs;
  RxBool hasNext = true.obs;

  @override
  void onInit() {
    getCharacters();
    scrollController.addListener(scrollListener);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void setPage(int page) {
    this.page.value = page;
    update();
  }

  void sethasNext(bool hasNext) {
    this.hasNext.value = hasNext;
    update();
  }

  List<CharactersModel> characters = [];

  Future<void> getCharacters() async {
    if (!hasNext.value) return;
    final result = await _repository.getCharacters(page.value);

    if (result.data != null) {
      CharactersPaginationResponse data = result.data!;
      hasNext(data.info!.next != null);
      characters.addAll(data.results!);
      update();
    }
  }
}
