import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fb_replication/widgets/Postcard.dart';
import 'package:flutter/material.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({super.key});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  String userprofile = 'https://media.karousell.com/media/photos/products/2023/4/20/popmart_popmart_hirono_city_of_1681978455_820a716a_progressive.jpg';
  String post = 'https://img.lazcdn.com/g/p/4804a91feb79dc42f3915316e0abd6e0.jpg_720x720q80.jpg';

  String userprofile2 = 'https://media.karousell.com/media/photos/products/2023/12/2/hirono_city_of_mercy_1701483742_aef10499_progressive.jpg';
  String post2 = 'https://media.karousell.com/media/photos/products/2022/11/3/hirono_amnesia_the_other_one_p_1667485196_2b9f0fef.jpg';

  final List<Map<String, String>> advertisements = [
    {
      'image': 'https://via.placeholder.com/300x150.png?text=Ad+1',
      'title': 'Super Sale! 50% OFF',
      'description': 'Hurry! Get the best deals on electronics!',
    },
    {
      'image': 'https://via.placeholder.com/300x150.png?text=Ad+2',
      'title': 'New Arrival: Trendy Shoes',
      'description': 'Check out the latest shoe collection today!',
    },
    {
      'image': 'https://via.placeholder.com/300x150.png?text=Ad+3',
      'title': 'Fast Food Discounts',
      'description': 'Buy 1 Get 1 Free on all burgers this weekend!',
    },
    {
      'image': 'https://via.placeholder.com/300x150.png?text=Ad+4',
      'title': 'Luxury Watches',
      'description': 'Exclusive collection now available online.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Existing Posts
        PostCard(
          userName: 'Rodney Estrada',
          postContent: 'Learn how to build awesome apps with Flutter!',
          userIcon: userprofile,
          imageUrl: post,
        ),
        PostCard(
          userName: 'Mark De Luna',
          postContent: 'Flutter is awesome because I am a chill guy.',
          userIcon: userprofile2,
          imageUrl: post2,
        ),

        // Advertisement Section
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sponsored Ads',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              CarouselSlider.builder(
                itemCount: advertisements.length,
                itemBuilder: (context, index, realIndex) {
                  final ad = advertisements[index];
                  return GestureDetector(
                    onTap: () {
                      // Open ad details or website
                      print('Clicked on Ad: ${ad['title']}');
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 4,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
                            child: CachedNetworkImage(
                              imageUrl: ad['image']!,
                              width: double.infinity,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  ad['title']!,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  ad['description']!,
                                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 180.0,
                  enlargeCenterPage: true,
                  viewportFraction: 0.7,
                  aspectRatio: 16 / 9,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                ),
              ),
            ],
          ),
        ),

        // Additional Post
        PostCard(
          userName: 'Mark De Luna',
          postContent: 'Flutter is awesome because I am a chill guy.',
          userIcon: userprofile2,
          imageUrl: post2,
        ),
      ],
    );
  }
}
