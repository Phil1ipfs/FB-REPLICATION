import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/customfont.dart';
import '../widgets/constant.dart';

class NotificationWidget extends StatelessWidget {
  final String name;
  final String post;
  final String description;
  final String date;
  final int numOfLikes;

  const NotificationWidget({
    super.key,
    required this.name,
    required this.post,
    required this.description, 
    required this.date,
    required  this.numOfLikes, 

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(ScreenUtil().setSp(10)),
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.person,
                  size: ScreenUtil().setSp(80),
                  color: FB_DARK_PRIMARY,
                ),
                SizedBox(width: ScreenUtil().setSp(10)),
                CustomFont(
                  text: name,
                  fontSize: ScreenUtil().setSp(16),
                  color: FB_DARK_PRIMARY,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            CustomFont(
              text: post,
              fontSize: ScreenUtil().setSp(14),
              color: FB_DARK_PRIMARY,
              fontStyle: FontStyle.normal,
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            CustomFont(
              text: description,
              fontSize: ScreenUtil().setSp(12),
              color: FB_DARK_PRIMARY,
              fontStyle: FontStyle.normal,
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            CustomFont(
              text: date,
              fontSize: ScreenUtil().setSp(12),
              color: FB_DARK_PRIMARY,
              fontStyle: FontStyle.normal,
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            TextButton(
              onPressed: () {
                // You can add navigation logic to show more details here
              },
              child: CustomFont(
                text: '',
                fontSize: ScreenUtil().setSp(14),
                color: FB_DARK_PRIMARY, fontStyle: FontStyle.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
