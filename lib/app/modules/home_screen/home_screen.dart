import 'bloc/home_bloc.dart';
import 'package:hive/hive.dart';
import 'components/home_body.dart';
import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../add_quotation_screen/add_quotation_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeBloc = HomeBloc();

  final bottomNavbarItems = [
    BottomNavigationBarItem(
      icon: Image.asset(AppAssets.homeIconImage),
      label: 'Home',
      backgroundColor: AppColors.containerBackgroundWhite,
    ),
    BottomNavigationBarItem(
      icon: Image.asset(AppAssets.subscriptionIconImage),
      label: 'Subcription',
    ),
    BottomNavigationBarItem(
      icon: Image.asset(AppAssets.addBillIconImage),
      label: 'Quote',
    ),
    BottomNavigationBarItem(
      icon: Image.asset(AppAssets.billDesignIconImage),
      label: 'Bill Design',
    ),
    BottomNavigationBarItem(
      icon: Image.asset(AppAssets.settingIconImage),
      label: 'Settings',
    ),
  ];

  final bottomNavbarScreens = [
    const HomeBody(),
    const Center(child: Text('Subscription')),
    const AddQuotationScreen(),
    const Center(child: Text('Bill Design')),
    const Center(child: Text('Settings')),
  ];

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: homeBloc,
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            extendBody: true,
            backgroundColor: AppColors.backgroundColor,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: AppColors.primaryBlue,
              title: const Text(
                'Nice Packers & Movers',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: [
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(Icons.notifications),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(Icons.person),
                ),
              ],
            ),
            drawer: const Drawer(),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 20,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  child: BottomNavigationBar(
                    unselectedItemColor: AppColors.textBlack,
                    selectedItemColor: AppColors.primaryBlue,
                    items: bottomNavbarItems,
                    currentIndex: state.tabIndex,
                    onTap: homeBloc.changeIndex,
                    showUnselectedLabels: true,
                    unselectedLabelStyle: const TextStyle(
                      fontSize: 10,
                    ),
                    selectedLabelStyle: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            body: bottomNavbarScreens[state.tabIndex],
          ),
        );
      },
    );
  }
}
