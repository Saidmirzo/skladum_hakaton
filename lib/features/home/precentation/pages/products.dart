import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skladum/common/enums/bloc_status.dart';
import 'package:skladum/features/home/data/model/product_model.dart';
import 'package:skladum/features/home/precentation/bloc/home_bloc.dart';
import 'package:skladum/features/home/precentation/widgets/home_product_item_widget.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.getProductsLocaleStatus == BlocStatus.inProgress) {
          // showDialog(
          //     context: context,
          //     builder: (context) {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     });
        } else if (state.getProductsLocaleStatus == BlocStatus.completed) {}
      },
      builder: (context, state) {
        if (state.getProductsLocaleStatus == BlocStatus.completed) {
          final List<ProductModel> list = state.listProducts ?? [];
          return ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => HomeProductItemWidget(
              productModel: list[index],
              onTap: () {
                context.read<HomeBloc>().add(
                      AddToBasket(productModel: list[index]),
                    );
              },
            ),
            separatorBuilder: (context, index) => const Divider(
              indent: 15,
              endIndent: 15,
            ),
            itemCount: list.length,
          );
        } else {
          return const Center(
            child: Text('Loading...'),
          );
        }
      },
    );
  }
}
