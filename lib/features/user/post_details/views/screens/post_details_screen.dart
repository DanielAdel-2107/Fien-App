import 'package:fien/features/user/home/models/lost_found_item_model.dart';
import 'package:fien/features/user/post_details/views/widgets/post_details_screen_body.dart';
import 'package:flutter/material.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var post = LostFoundItemModel.fromJson(args);
    return Scaffold(body: PostDetailsScreenBody(post: post));
  }
}






