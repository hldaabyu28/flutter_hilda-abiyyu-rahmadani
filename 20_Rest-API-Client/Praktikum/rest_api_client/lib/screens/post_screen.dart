import 'package:flutter/material.dart';


import '../models/post_model.dart';
import '../services/post_service.dart';

class PostScreen extends StatefulWidget {
  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  Post? _post;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Screen'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            
            ElevatedButton(
              onPressed: () async {
         
                final postService = PostService();
                try {
                  final post = await postService.fetchPost(1); 
                  setState(() {
                    _post = post;
                    _titleController.text = post.title;
                    _bodyController.text = post.body;
                  });
                } catch (error) {
                  print('Error fetching post: $error');
                
                }
              },
              child: Text('Fetch Post'),
            ),
        
            if (_post != null)
              Column(
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                    controller: _bodyController,
                    decoration: InputDecoration(labelText: 'Body'),
                    maxLines: null, 
                  ),
                  ElevatedButton(
                    onPressed: () async {
                  
                      final postService = PostService();
                      final updatedPost = Post(
                        id: _post!.id,
                        title: _titleController.text,
                        body: _bodyController.text,
                        userId: _post!.userId,
                      );
                      _titleController.clear();
                      _bodyController.clear();
                      try {
                        await postService.updatePost(updatedPost);
                 
                      } catch (error) {
                        print('Error updating post: $error');
                      
                      }
                    },
                    child: Text('Update Post'),
                  ),
                  
                ],
              ),
          ],
        ),
      ),
    );
  }
}
