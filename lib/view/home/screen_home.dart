import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_api/controller/blocs/post/bloc/post_bloc.dart';
import 'package:posts_api/view/add_post/screen_add_post.dart';
import 'package:posts_api/view/home/widgets/floating_button.dart';
import 'package:posts_api/view/view_post/screen_view_post.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    print('build() --> called');
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<PostBloc>().add(FetchPostApiEvent());
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () async {
                context.read<PostBloc>().add(FetchPostApiEvent());
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: BlocConsumer<PostBloc, PostState>(
        listenWhen: (previous, current) => current.status,
        listener: (context, state) {
          if (state.status) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                'data added successfully',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green,
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                'Unable to insert data',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (context, state) {
          print('bloc() --> called');
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.postList.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            return ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ScreenViewPost(post: state.postList[index])));
                  },
                  title: Text(
                    state.postList[index].title,
                  ),
                  leading: const CircleAvatar(),
                  trailing: SizedBox(
                    width: MediaQuery.of(context).size.width * .245,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ScreenAddPost(
                                    action: PostAction.edit,
                                    post: state.postList[index])));
                          },
                          icon: const Icon(Icons.edit, color: Colors.black),
                        ),
                        IconButton(
                          onPressed: () async {
                            context.read<PostBloc>().add(
                                DeletePostEvent(id: state.postList[index].id));
                          },
                          icon: const Icon(Icons.delete, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: state.postList.length,
            );
          }
        },
      ),
      floatingActionButton: const FloatingButton(),
    );
  }
}
