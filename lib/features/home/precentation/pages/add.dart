import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skladum/common/all_contants.dart';
import 'package:skladum/common/components/gradient_button.dart';
import 'package:skladum/common/custom_textfield.dart';
import 'package:skladum/features/home/data/model/product_model.dart';
import 'package:skladum/features/home/precentation/bloc/home_bloc.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key, required this.goHome});
  final Function() goHome;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController productName = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController productBarcode = TextEditingController();
  TextEditingController productCount = TextEditingController();
  int countIndex = 1;
  @override
  void initState() {
    productCount.text = countIndex.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CustomTextField(
            labelText: 'Наименование',
            hintText: 'Наименование',
            radius: 8,
            controller: productName,
            borderColor: AppColors.background,
          ),
        ),
        // Text('Цена',
        //     style: AppTextStyles.body18w5.copyWith(color: AppColors.grey)),
        CustomTextField(
          hintText: 'Цена',
          labelText: 'Цена',
          radius: 8,
          textInputType: TextInputType.number,
          maxLines: 1,
          borderColor: AppColors.background,
          controller: productPrice,
        ),
        // Text('Штрихкод',
        //     style: AppTextStyles.body18w5.copyWith(color: AppColors.grey)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CustomTextField(
            hintText: 'Штрихкод',
            labelText: 'Штрихкод',
            radius: 8,
            controller: productBarcode,
            borderColor: AppColors.background,
            trailing: GradientButton(
              width: 50,
              onPressed: () {},
              text: '',
              icon: SvgPicture.asset(
                Assets.icons.camera,
                color: AppColors.white,
              ),
              color: AppColors.background,
            ),
          ),
        ),
        // Text('Количество',
        //     style: AppTextStyles.body18w5.copyWith(color: AppColors.grey)),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 20),
          child: Row(
            children: [
              GradientButton(
                width: 100,
                onPressed: () {
                  if (countIndex > 1) {
                    setState(() {
                      countIndex = countIndex - 1;
                      productCount.text = countIndex.toString();
                    });
                  }
                },
                text: '',
                color: AppColors.background,
                icon: Icon(
                  Icons.remove,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: CustomTextField(
                  hintText: 'Количество',
                  labelText: 'Количество',
                  radius: 8,
                  borderColor: AppColors.background,
                  textInputType: TextInputType.number,
                  contentPadding: const EdgeInsets.all(12),
                  controller: productCount,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 5),
              GradientButton(
                width: 100,
                color: AppColors.background,
                onPressed: () {
                  setState(() {
                    countIndex = countIndex + 1;
                    productCount.text = countIndex.toString();
                  });
                },
                text: '',
                icon: Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
        GradientButton(
          onPressed: () {
            if (productBarcode.text.isNotEmpty) {
              context.read<HomeBloc>().add(
                    AddNewProducEvent(
                      productModel: ProductModel(
                        barcode: productBarcode.text,
                        description: "",
                        name: productName.text,
                        price: int.parse(productPrice.text),
                      ),
                    ),
                  );
            }
            productBarcode.clear();
            productCount.clear();
            productName.clear();
            productPrice.clear();
            widget.goHome();
          },
          text: 'Добавить',
          color: AppColors.black,
        )
      ],
    );
  }
}
