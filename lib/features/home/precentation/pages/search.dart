import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skladum/common/all_contants.dart';
import 'package:skladum/common/app_color.dart';
import 'package:skladum/common/app_text_style.dart';
import 'package:skladum/common/assets.dart';
import 'package:skladum/common/custom_textfield.dart';
import 'package:skladum/features/home/data/model/product_model.dart';
import 'package:skladum/features/home/precentation/bloc/home_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: CustomTextField(
            onChanged: (value) {
              context.read<HomeBloc>().add(SearchProductsEvent(text: value));
            },
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(
                Assets.icons.search,
                color: AppColors.black.withOpacity(.5),
              ),
            ),
            hintText: 'search',
            borderColor: AppColors.black.withOpacity(.5),
          ),
        ),
        Divider(
          color: AppColors.black,
        ),
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final List<ProductModel> listProducts = state.listProducts ?? [];
            return Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => ListTile(
                  subtitleTextStyle: AppTextStyles.body12w3,
                  titleTextStyle: AppTextStyles.body15w3,
                  leading: Image.asset(
                    Assets.images.one,
                  ),
                  title: Text(listProducts[index].name ?? "Unknowk"),
                  // subtitle: Row(
                  //   children: [
                  //     Text(listProducts[index].count.toString()),
                  //   ],
                  // ),
                  trailing: Text(
                    listProducts[index].price.toString(),
                    style: AppTextStyles.body18w7,
                  ),
                ),
                separatorBuilder: (context, index) => const Divider(
                  indent: 15,
                  endIndent: 15,
                ),
                itemCount: listProducts.length,
              ),
            );
          },
        ),
      ],
    );
  }
}
