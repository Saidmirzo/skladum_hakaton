import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skladum/common/app_color.dart';
import 'package:skladum/common/app_text_style.dart';
import 'package:skladum/common/assets.dart';
import 'package:skladum/common/components/gradient_button.dart';
import 'package:skladum/common/components/univer_dialog.dart';
import 'package:skladum/common/constants.dart';
import 'package:skladum/common/crystal_navigation_bar/lib/crystal_navigation_bar.dart';
import 'package:skladum/common/enums/bloc_status.dart';
import 'package:skladum/common/routes.dart';
import 'package:skladum/features/home/data/model/product_model.dart';
import 'package:skladum/features/home/precentation/bloc/home_bloc.dart';
import 'package:skladum/features/home/precentation/pages/add.dart';
import 'package:skladum/features/home/precentation/pages/products.dart';
import 'package:skladum/features/home/precentation/pages/search.dart';
import 'package:skladum/features/home/precentation/widgets/scaner_widget.dart';
import 'package:skladum/features/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selDrawer = 0;
  PageController pageController = PageController();
  PageController homePageController = PageController();
  goToPage(int index) {
    pageController.jumpToPage(index);
    setState(() {
      selDrawer = index;
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetProductsLocaleEvent());
    context.read<HomeBloc>().add(GetBasketProducts());
  }

  var _selectedTab = 0;

  void _handleIndexChanged(int i) {
    homePageController.jumpToPage(i);
    setState(() {
      _selectedTab = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.backGradient),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
            backgroundColor: AppColors.transparent,
            centerTitle: true,
            // elevation: 0,
            title: Text(appbarTitles[selDrawer]),
            actions: [
              selDrawer == 0
                  ? IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.basket);
                      },
                      icon: SvgPicture.asset(
                        Assets.icons.basket,
                        width: 25,
                      ),
                    )
                  : const SizedBox.shrink(),
              // selDrawer == 1
              //     ? IconButton(
              //         onPressed: () {},
              //         icon: SvgPicture.asset(
              //           Assets.icons.search,
              //           width: 25,
              //         ),
              //       )
              //     : const SizedBox.shrink(),
            ],
            bottom: selDrawer == 0
                ? PreferredSize(
                    preferredSize: const Size(double.infinity, 50),
                    child: BlocConsumer<HomeBloc, HomeState>(
                      listener: (context, state) {
                        if (state.getBasketProductsStatus ==
                            BlocStatus.completed) {}
                        if (state.createSaleStatus == BlocStatus.completed) {}
                      },
                      builder: (context, state) {
                        final List<ProductModel> list =
                            state.listBasketProducts ?? [];
                        int allPrice = 0;
                        for (var element in list) {
                          allPrice +=
                              (element.price ?? 0) * (element.count ?? 1);
                        }
                        return Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: GradientButton(
                                color: AppColors.black,
                                onPressed: () {
                                  if (allPrice != 0) {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.payment,
                                      arguments: {"allPrice": allPrice},
                                    );
                                  }
                                },
                                text: 'Итого: $allPrice',
                              ),
                            ),
                            // const TabBarWidget()
                          ],
                        );
                      },
                    ),
                  )
                : null),
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Stack(
              children: [
                PageView(controller: homePageController, children: [
                  const ProductsPage(),
                  const ScanerWidget(),
                  SearchPage(),
                  AddPage(goHome: () {
                    goToPage(0);
                  })
                ]),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CrystalNavigationBar(
                    currentIndex: _selectedTab,
                    height: 10,
                    marginR: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 25),
                    indicatorColor: Colors.black,
                    unselectedItemColor: Colors.white70,
                    backgroundColor: Colors.black.withOpacity(0.1),
                    onTap: _handleIndexChanged,
                    items: [
                      CrystalNavigationBarItem(
                        icon: SvgPicture.asset(
                          Assets.icons.list,
                          width: 25,
                        ),
                      ),
                      CrystalNavigationBarItem(
                        icon: SvgPicture.asset(
                          Assets.icons.barcode,
                          width: 25,
                        ),
                      ),
                      CrystalNavigationBarItem(
                        icon: SvgPicture.asset(
                          Assets.icons.search,
                          width: 25,
                        ),
                      ),
                      CrystalNavigationBarItem(
                        icon: SvgPicture.asset(
                          Assets.icons.add,
                          width: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Center(
              child: Text('History page'),
            ),
            const Center(
              child: Text('Shift page'),
            ),
            const SettingsPage(),
            const Center(
              child: Text('Help page'),
            ),
          ],
        ),
        drawer: Drawer(
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(gradient: AppColors.backGradient),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(Assets.images.one),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              'Ботиралиев Бахтиер Баходиров',
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.body16wb,
                            ),
                          ),
                          const Text('точка продаж'),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        if (index == 5) {
                          showDialog(
                            context: context,
                            builder: (context) => UniverDialog(
                              gcontext: context,
                              title: 'Exit?',
                              yes: () {
                                // Navigator.pushReplacementNamed(
                                //     context, Routes.login);
                              },
                            ),
                          );
                        } else {
                          goToPage(index);
                        }
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: selDrawer == index ? AppColors.black : null),
                        alignment: Alignment.center,
                        child: Text(
                          drewerMenu[index],
                          style: AppTextStyles.body17w5.copyWith(
                              color:
                                  selDrawer == index ? AppColors.white : null),
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => index == 2
                        ? const Divider(
                            height: 2,
                            thickness: 2,
                          )
                        : const SizedBox(),
                    itemCount: drewerMenu.length,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
