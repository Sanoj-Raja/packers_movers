import 'package:hive/hive.dart';
import '../../widgets/gapper.dart';
import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import 'package:bot_toast/bot_toast.dart';
import '../../models/quotation_model.dart';
import '../../widgets/custom_text_field.dart';

class AddQuotationScreen extends StatefulWidget {
  const AddQuotationScreen({super.key});

  @override
  State<AddQuotationScreen> createState() => _AddQuotationScreenState();
}

class _AddQuotationScreenState extends State<AddQuotationScreen> {
  final addQuotationFormKey = GlobalKey<FormState>();

  late TextEditingController nameTextController;
  late TextEditingController quotationNumberTextController;
  late TextEditingController quotationPriceTextController;
  late TextEditingController originTextController;
  late TextEditingController destinationTextController;
  late TextEditingController phoneNumberTextController;

  @override
  void initState() {
    nameTextController = TextEditingController();
    quotationNumberTextController = TextEditingController();
    quotationPriceTextController = TextEditingController();
    originTextController = TextEditingController();
    destinationTextController = TextEditingController();
    phoneNumberTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameTextController.dispose();
    quotationNumberTextController.dispose();
    quotationPriceTextController.dispose();
    originTextController.dispose();
    destinationTextController.dispose();
    phoneNumberTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: addQuotationFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            const VerticalGap(gap: 30),
            CustomTextField(
              controller: nameTextController,
              hintText: 'Enter Name',
              keyboardType: TextInputType.text,
              validator: (value) {
                return (value ?? '').isEmpty ? 'Name is mandatory!' : null;
              },
            ),
            const VerticalGap(),
            CustomTextField(
              controller: quotationNumberTextController,
              hintText: 'Quotation Number 4 Digits',
              keyboardType: TextInputType.number,
              validator: (value) {
                return (value ?? '').length < 4
                    ? 'Enter a valid 4 digit quotation number!'
                    : null;
              },
            ),
            const VerticalGap(),
            CustomTextField(
              controller: quotationPriceTextController,
              hintText: 'Quotation Price',
              keyboardType: TextInputType.number,
              validator: (value) {
                return (value ?? '').isEmpty
                    ? 'Quotation Price is mandatory!'
                    : null;
              },
            ),
            const VerticalGap(),
            CustomTextField(
              controller: originTextController,
              hintText: 'Origin',
              keyboardType: TextInputType.text,
              validator: (value) {
                return (value ?? '').isEmpty ? 'Origin is mandatory!' : null;
              },
            ),
            const VerticalGap(),
            CustomTextField(
              controller: destinationTextController,
              hintText: 'Destination',
              keyboardType: TextInputType.text,
              validator: (value) {
                return (value ?? '').isEmpty
                    ? 'Destination is mandatory!'
                    : null;
              },
            ),
            const VerticalGap(),
            CustomTextField(
              controller: phoneNumberTextController,
              hintText: 'Mobile Number',
              keyboardType: TextInputType.number,
              validator: (value) {
                return (value ?? '').isEmpty
                    ? 'Enter mobile number!'
                    : value!.length == 10
                        ? null
                        : 'Mobile number should only have 10 digits!';
              },
            ),
            const VerticalGap(gap: 15),
            TextButton(
              onPressed: () async {
                FocusManager.instance.primaryFocus?.unfocus();
                if (addQuotationFormKey.currentState!.validate()) {
                  await Hive.box<QuotationModel>('quotations').add(
                    QuotationModel(
                      name: nameTextController.text,
                      quotationNumber: int.parse(
                        quotationNumberTextController.text,
                      ),
                      quotationPrice: double.parse(
                        quotationPriceTextController.text,
                      ),
                      origin: originTextController.text,
                      destination: destinationTextController.text,
                      phoneNumber: phoneNumberTextController.text,
                      date: DateTime.now(),
                    ),
                  );

                  nameTextController.clear();
                  quotationNumberTextController.clear();
                  quotationPriceTextController.clear();
                  originTextController.clear();
                  destinationTextController.clear();
                  phoneNumberTextController.clear();

                  BotToast.showText(
                    text: 'Your quotation has been created successfully.',
                  );
                }
              },
              style: TextButton.styleFrom(
                minimumSize: const Size(170, 40),
                backgroundColor: AppColors.primaryBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Create Quotation',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
