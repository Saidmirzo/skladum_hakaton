import 'package:flutter/material.dart';
import 'package:skladum/common/constants.dart';
import 'package:skladum/features/home/data/model/product_model.dart';

import '../../../../common/all_contants.dart';

class HomeProductItemWidget extends StatelessWidget {
  const HomeProductItemWidget({
    super.key,
    required this.productModel,
    required this.onTap,
  });
  final ProductModel productModel;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      subtitleTextStyle: AppTextStyles.body12w3,
      titleTextStyle: AppTextStyles.body15w3,
      leading: const DefImageWidget(),
      title: Text(productModel.name ?? 'Unknown'),
      subtitle: Row(
        children: [
          Text(productModel.measure ?? ''),
        ],
      ),
      trailing: Text(
        productModel.price.toString(),
        style: AppTextStyles.body18w7,
      ),
    );
  }
}
