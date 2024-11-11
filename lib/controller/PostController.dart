// controllers/post_controller.dart

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:latihan_api/ApiService.dart';
import 'package:latihan_api/PostModel.dart';
import 'package:latihan_api/PremierLeagueModel.dart';

class PostController extends GetxController {
  var isLoading = true.obs;
  var postList = <Team>[].obs;

  void goToDetail(Team team) {
    Get.toNamed('/detail', arguments: team);
  }

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var posts = await ApiService().fetchPosts();
      postList.assignAll(posts);
    } finally {
      isLoading(false);
    }
  }
}