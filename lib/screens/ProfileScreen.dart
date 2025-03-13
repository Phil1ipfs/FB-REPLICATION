import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fb_replication/widgets/custom_button.dart';
import 'package:fb_replication/widgets/customfont.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

List<String> photoUrls = [
  'https://cdn.fstoppers.com/styles/large-16-9/s3/lead/2023/09/cover_3.jpg',
  'https://cdn.fstoppers.com/styles/full/s3/media/2019/12/04/nando-jpeg-quality-001.jpg',
  'https://cdn.fstoppers.com/styles/full/s3/media/2019/12/04/nando-jpeg-quality-001.jpg',
  'https://miro.medium.com/v2/resize:fit:1200/1*JZ4uz6BTlYurdpAh1b9gPQ.jpeg',
  'https://dat.bus-tour.his-j.com/upload/image/31/tour/15513/5dd652b2028f7.jpg',
  'https://m.media-amazon.com/images/S/aplus-media-library-service-media/826ff8cb-2a9c-47bc-831d-a4740f850feb.__CR0,0,1464,625_PT0_SX1464_V1___.jpg',
];

class _ProfileScreenState extends State<ProfileScreen> {
  int likes = 0;
  String username = '';
  String coverPhotoPath = 'https://i.ebayimg.com/images/g/i3MAAOSwvVlimWVw/s-l1200.jpg';
  String userIcon = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-5fHAyMKEWI8ZhCcD-KPOi471JuUhj_ikyQ&s';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments;
    if (args is String) {
      setState(() {
        username = args;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CachedNetworkImage(
                              imageUrl: coverPhotoPath,
                              height: 250.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                            Positioned(
                              bottom: -50,
                              left: 20.w,
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: CachedNetworkImageProvider(userIcon),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 55.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomFont(
                                text: username,
                                fontSize: 20.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                children: [
                                  CustomFont(text: '1M', fontSize: 15.sp, color: Colors.black,fontStyle: FontStyle.normal,),
                                  SizedBox(width: 10.w),
                                  CustomFont(text: 'Followers', fontSize: 15.sp, color: Colors.black,fontStyle: FontStyle.normal,),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                children: [
                                  CustomButton(buttonName: 'Follow', onPressed: () {}, buttonType: 'outlined'),
                                  SizedBox(width: 10.w),
                                  CustomButton(buttonName: 'Message', onPressed: () {}, buttonType: 'outlined'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                body: Column(
                  children: [
                    TabBar(
                      indicatorColor: Colors.black,
                      tabs: [
                        Tab(child: CustomFont(text: 'Posts', fontSize: 15.sp, color: Colors.black,fontStyle: FontStyle.normal,)),
                        Tab(child: CustomFont(text: 'About', fontSize: 15.sp, color: Colors.black,fontStyle: FontStyle.normal,)),
                        Tab(child: CustomFont(text: 'Photos', fontSize: 15.sp, color: Colors.black,fontStyle: FontStyle.normal,)),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ListView.builder(
                            padding: EdgeInsets.all(15.w),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return _buildPost(
                                context,
                                userName: "User $index",
                                timeAgo: "${index + 1}h ago",
                                content: "Sample post content $index",
                                imagePath: 'https://cdn.fstoppers.com/styles/large-16-9/s3/lead/2023/09/cover_3.jpg${index + 1}',
                              );
                            },
                          ),
                          Center(child: Text("About Section")),
                          GridView.builder(
                            padding: EdgeInsets.all(10.w),
                            itemCount: photoUrls.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10.w,
                              mainAxisSpacing: 10.h,
                            ),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                      backgroundColor: Colors.transparent,
                                      child: InteractiveViewer(
                                        panEnabled: true,
                                        boundaryMargin: EdgeInsets.all(20),
                                        minScale: 0.5,
                                        maxScale: 2.0,
                                        child: CachedNetworkImage(
                                          imageUrl: photoUrls[index],
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: CachedNetworkImage(
                                  imageUrl: photoUrls[index],
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPost(
    BuildContext context, {
    required String userName,
    required String timeAgo,
    required String content,
    required String imagePath,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 20, backgroundImage: NetworkImage(userIcon)),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFont(text: userName, fontSize: 15.sp, color: Colors.black, fontWeight: FontWeight.bold,fontStyle: FontStyle.normal, ),
                    CustomFont(text: timeAgo, fontSize: 12.sp, color: Colors.grey, fontStyle: FontStyle.normal,),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.h),
            CustomFont(text: content, fontSize: 14.sp, color: Colors.black, fontStyle: FontStyle.normal,),
            SizedBox(height: 10.h),
            CachedNetworkImage(imageUrl: imagePath, fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}
