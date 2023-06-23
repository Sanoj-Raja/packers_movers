import '../../widgets/gapper.dart';
import 'package:flutter/material.dart';
import 'components/quotation_card.dart';
import '../../constants/app_colors.dart';
import '../../utils/get_screen_size.dart';
import '../../models/quotation_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class QuotationsScreen extends StatelessWidget {
  const QuotationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: SizedBox(
          width: AppUtils.getScreenWidth(context),
          child: ValueListenableBuilder<Box<QuotationModel>>(
            valueListenable:
                Hive.box<QuotationModel>('quotations').listenable(),
            builder: (context, box, _) {
              final quotations = box.values.toList().cast<QuotationModel>();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const VerticalGap(),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.containerBackgroundWhite,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryTextGray.withOpacity(0.5),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.search,
                          color: AppColors.quotationContainerGray,
                        ),
                      ),
                    ),
                  ),
                  const VerticalGap(),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'TOTAL QUOTATIONS ',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.textOrange,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const TextSpan(
                          text: ':',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.textBlack,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: ' ${quotations.length}',
                          style: const TextStyle(
                            color: AppColors.primaryBlue,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VerticalGap(),
                  Expanded(
                    child: quotations.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: quotations.length,
                            itemBuilder: (context, index) {
                              return QuotationCard(
                                quotation: quotations[index],
                              );
                            },
                          )
                        : const SizedBox(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
