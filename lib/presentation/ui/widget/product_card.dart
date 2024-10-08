import 'package:crafty_bay/presentation/ui/screens/products_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/assets_path.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>const ProductsDetailsScreen());
      },
      child: Card(
        color: Colors.white,
        elevation: 3,
        child: SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 120,
                height: 100,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  image: const DecorationImage(
                      image: AssetImage(
                        AssetsPath.monitor,
                      ),
                      fit: BoxFit.scaleDown),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Product Name',style: TextStyle(fontWeight: FontWeight.w500),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$120',style:TextStyle(color: AppColors.themeColor,),),
                        Wrap(
                          children: [
                            Icon(Icons.star,color: Colors.amber,),
                            Text('3'),
                          ],
                        ),
                        Card(
                          color: AppColors.themeColor,

                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(Icons.favorite_border_outlined,size: 16,color: Colors.white,),
                          ),
                        )

                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}