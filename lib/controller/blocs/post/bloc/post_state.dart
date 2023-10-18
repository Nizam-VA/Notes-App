part of 'post_bloc.dart';

class PostState {
  final List<PostModel> postList;
  final bool isLoading;
  final bool isAdding;
  final bool isAdded;
  final bool isDeleted;
  final bool status;

  PostState({
    required this.postList,
    this.isLoading = false,
    this.isAdding = false,
    this.isAdded = false,
    this.isDeleted = false,
    this.status = false,
  });
}

class PostInitial extends PostState {
  PostInitial() : super(postList: []);
}
