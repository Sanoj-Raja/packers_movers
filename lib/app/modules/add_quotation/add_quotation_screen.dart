// ignore_for_file: use_build_context_synchronously
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import '../../widgets/gapper.dart';
import 'bloc/add_quotation_bloc.dart';
import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import 'package:bot_toast/bot_toast.dart';
import '../../models/quotation_model.dart';
import '../../widgets/custom_text_field.dart';
import '../quotations/quotations_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  final addQuotationBloc = AddQuotationBloc();

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
                        ? int.tryParse(value) != null
                            ? null
                            : 'Enter a valid 10 digit mobile number!'
                        : 'Mobile number should only have 10 digits!';
              },
            ),
            const VerticalGap(),
            BlocBuilder<AddQuotationBloc, AddQuotationState>(
              bloc: addQuotationBloc,
              builder: (context, state) {
                return InkWell(
                  onTap: () async {
                    final pickupDate = await showDatePicker(
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 300)),
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      helpText: "Select Pickup Date".toUpperCase(),
                      errorInvalidText: "Enter a valid Date!",
                      errorFormatText: 'Entered Date is not in Valid Format!',
                      context: context,
                    );

                    if (pickupDate != null) {
                      addQuotationBloc.updatePickupDate(
                        pickupDate: pickupDate,
                      );
                    }
                  },
                  child: Container(
                    height: kTextTabBarHeight,
                    decoration: BoxDecoration(
                      color: AppColors.containerBackgroundWhite,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        width: 1.5,
                        color: AppColors.dividerGreyColor,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          state.pickupDate != null
                              ? DateFormat('dd-MM-yyyy')
                                  .format(state.pickupDate!)
                              : 'Select Pickup Date',
                          style: state.pickupDate != null
                              ? const TextStyle(
                                  fontSize: 16,
                                )
                              : const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const VerticalGap(gap: 15),
            TextButton(
              onPressed: () async {
                FocusManager.instance.primaryFocus?.unfocus();
                if (addQuotationFormKey.currentState!.validate()) {
                  if (addQuotationBloc.state.pickupDate == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Pickup Date is Mandatory'),
                        backgroundColor: (Colors.black12),
                        action: SnackBarAction(
                          label: 'Dismiss',
                          onPressed: () {},
                        ),
                      ),
                    );
                    return;
                  }
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
                      date: addQuotationBloc.state.pickupDate!,
                    ),
                  );

                  nameTextController.clear();
                  quotationNumberTextController.clear();
                  quotationPriceTextController.clear();
                  originTextController.clear();
                  destinationTextController.clear();
                  phoneNumberTextController.clear();
                  addQuotationBloc.updatePickupDate();

                  BotToast.showText(
                    text: 'Your quotation has been created successfully.',
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuotationsScreen(),
                    ),
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
