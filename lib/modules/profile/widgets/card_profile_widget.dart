import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:loviser/modules/profile/pages/edit_profile_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../providers/page/message_page/card_profile_provider.dart';

class CardProfileWidget extends StatelessWidget {
  final bool isMe;
  final User? user;
  const CardProfileWidget({super.key, this.isMe = false, required this.user});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size.height);
    return SizedBox(
      height: 380,
      width: size.width,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(20, 50, 20, 30),
            padding: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 30,
                  spreadRadius: 0,
                  offset: Offset(0, 10),
                  color: Color.fromRGBO(123, 87, 182, 0.18),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // button edit
                isMe
                    ? Padding(
                        padding: const EdgeInsets.only(right: 15.0, top: 20),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 110,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 10,
                            ),
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFEE5E4),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: InkWell(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const EditProfilePage(),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  // text edit
                                  Text(
                                    'Chỉnh sửa',
                                  ),
                                  // icon
                                  Icon(
                                    Icons.edit,
                                    size: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(
                        height: 60,
                      ),
                // name
                Text(
                  '${user?.name}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                // tel
                const Text(
                  'Tel: 0399720685',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 5),
                // email
                const Text(
                  'Email: maiphamquochung@gmail.com',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 20),
                // rating and number
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FC),
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          const Text(
                            '100',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Lượt tư vấn',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        color: const Color.fromRGBO(151, 151, 151, 0.7),
                        width: 1,
                        height: 80,
                        child: const SizedBox(),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Đánh giá: ',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '43',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: size.width * 0.05,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: const [
                              Text(
                                '25 lượt ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color.fromRGBO(63, 19, 228, 1),
                                ),
                              ),
                              Text(
                                'đánh giá',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(63, 19, 228, 1),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: size.width / 2 - 55,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(100, 100, 111, 0.3),
                    offset: Offset(0, 5),
                    blurRadius: 29,
                  ),
                ],
              ),
              width: 100,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: const NetworkImage(
                    'https://loviser.herokuapp.com/file/fcf4b4c6347e43bb7daf28e2bc62a262.gif',
                  ),
                  backgroundColor: Colors.grey[300],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
