part of 'post_bloc.dart';

class PostEvent {}

class FetchPostApiEvent extends PostEvent {}

class AddPostEvent extends PostEvent {
  PostModel post;
  AddPostEvent({required this.post});
}

class UpdatePostEvent extends PostEvent {
  PostModel post;
  UpdatePostEvent({required this.post});
}

class DeletePostEvent extends PostEvent {
  int id;
  DeletePostEvent({required this.id});
}
