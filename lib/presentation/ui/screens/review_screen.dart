
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import 'create_review_screen.dart';

class ProductReviewsScreen extends StatefulWidget {
  const ProductReviewsScreen({super.key});

  @override
  State<ProductReviewsScreen> createState() => _ProductReviewsScreenState();
}

class _ProductReviewsScreenState extends State<ProductReviewsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text("Reviews", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(

                  child: ListView.separated(
                    itemCount: 10,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      return review();
                    },
                  ),
                ),
              ),
            ),


            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                  color: AppColors.themeColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16)
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Reviews (10)" , style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),)
                    ],
                  ),

                  InkWell(
                    onTap: (){
                      Get.to(const CreateReviewScreen());
                    },
                    child: const SizedBox(
                      child: CircleAvatar(
                          radius: 18,
                          backgroundColor: AppColors.themeColor,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 18,
                          )
                      ),
                    ),
                  )
                ],
              ),
            )

          ],

        ),
      ),
    );
  }
  ListTile review() {
    return  ListTile(
      title: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
              radius: 12,
              backgroundColor: AppColors.themeColor,
              child: Icon(
                Icons.person_outline_outlined,
                color: Colors.grey,
                size: 18,
              )
          ),
          SizedBox(width: 10),
          Text("Hasib", style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w500
          ),),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type.''',style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
      subtitleTextStyle: const TextStyle(
        fontSize: 14,
      ),
    );
  }
}