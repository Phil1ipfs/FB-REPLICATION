// ignore: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fb_replication/widgets/customfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostCard extends StatefulWidget {
  final String userName;
  final String postContent;
  final String userIcon;
  final String imageUrl;

  const PostCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.userIcon,
    required this.imageUrl,
  });

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  int likes = 0; // Track the number of likes
  bool isLiked = false; // Track whether the post is liked by the user

  void incrementLike() {
  setState(() {
    likes++; // Increment likes on every click
  });
}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text(widget.userName),
              ),
              body: Padding(
                padding: EdgeInsets.all(ScreenUtil().setSp(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: widget.userIcon,
                          height: ScreenUtil().setSp(30),
                          width: ScreenUtil().setSp(30),
                        ),
                        SizedBox(width: ScreenUtil().setSp(10)),
                        CustomFont(
                          text: widget.userName,
                          fontSize: ScreenUtil().setSp(18),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setSp(10)),
                    CustomFont(
                      text: widget.postContent,
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                    ),
                    SizedBox(height: ScreenUtil().setSp(10)),
                     CachedNetworkImage(
                          imageUrl: widget.imageUrl,
                      height: ScreenUtil().setHeight(300),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: ScreenUtil().setSp(10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  incrementLike();
                                });
                              },
                              icon: Icon(
                                isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                                color: isLiked ? Colors.blue : Colors.grey,
                              ),
                            ),
                            Text(
                              '$likes Likes',
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(12),
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            // Handle comment action in detail view
                          },
                          icon: Icon(Icons.comment, color: Colors.grey),
                        ),
                        IconButton(
                          onPressed: () {
                            // Handle share action in detail view
                          },
                          icon: Icon(Icons.share, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: Padding(
          padding: EdgeInsets.all(ScreenUtil().setSp(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                   CachedNetworkImage(
                    imageUrl: widget.userIcon,
                    height: ScreenUtil().setSp(20),
                    width: ScreenUtil().setSp(20),
                  ),
                  SizedBox(width: ScreenUtil().setSp(10)),
                  CustomFont(
                    text: widget.userName,
                    fontSize: ScreenUtil().setSp(15),
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                  const Spacer(),
                  Icon(
                    Icons.more_vert,
                    size: ScreenUtil().setSp(20),
                    color: Colors.grey[700],
                  ),
                ],
              ),
              SizedBox(height: ScreenUtil().setSp(5)),
              CustomFont(
                text: widget.postContent,
                fontSize: ScreenUtil().setSp(12),
                color: Colors.black,
                fontStyle: FontStyle.normal,
              ),
              SizedBox(height: ScreenUtil().setSp(10)),
               CachedNetworkImage(
                imageUrl: widget.imageUrl,
                height: ScreenUtil().setHeight(200),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: ScreenUtil().setSp(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: incrementLike,
                        icon: Icon(
                          Icons.thumb_up,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        '$likes Likes',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle comment action
                    },
                    icon: Icon(Icons.comment, color: Colors.grey),
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle share action
                    },
                    icon: Icon(Icons.share, color: Colors.grey),
                  ),
                ],
              ),
              const Divider(color: Colors.grey),
              Row(
                children: [
                   CachedNetworkImage(
                    imageUrl: widget.userIcon,
                    height: ScreenUtil().setSp(20),
                    width: ScreenUtil().setSp(20),
                  ),
                  SizedBox(width: ScreenUtil().setSp(10)),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Write a comment...",
                        hintStyle: TextStyle(fontSize: ScreenUtil().setSp(12)),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle send comment action
                    },
                    icon: Icon(
                      Icons.send,
                      color: Colors.blue,
                      size: ScreenUtil().setSp(20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
