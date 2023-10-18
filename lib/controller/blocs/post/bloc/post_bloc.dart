import 'package:bloc/bloc.dart';
import 'package:posts_api/controller/api_services/api_calls.dart';
import 'package:posts_api/model/post_model.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    final api = ApiCalls();

    on<FetchPostApiEvent>((event, emit) async {
      emit(PostState(postList: [], isLoading: true));
      final posts = await api.fetchAllPost();
      emit(PostState(postList: posts, isLoading: false));
    });

    on<AddPostEvent>((event, emit) async {
      emit(PostState(postList: [], isLoading: true, isAdding: true));
      final bool success = await api.addPost(event.post);
      final List<PostModel> posts = await api.fetchAllPost();
      emit(PostState(
          postList: posts, isLoading: false, isAdding: false, status: success));
    });

    on<UpdatePostEvent>((event, emit) async {
      emit(PostState(postList: [], isLoading: true, isAdding: true));
      await api.updatePost(event.post);
      final List<PostModel> posts = await api.fetchAllPost();
      emit(PostState(postList: posts, isLoading: false, isAdding: false));
    });

    on<DeletePostEvent>((event, emit) async {
      emit(PostState(postList: [], isLoading: true, isDeleted: true));
      await api.deletePost(event.id);
      final List<PostModel> posts = await api.fetchAllPost();
      emit(PostState(postList: posts, isLoading: false, isDeleted: false));
    });
  }
}
