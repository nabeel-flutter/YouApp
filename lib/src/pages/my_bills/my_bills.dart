import 'package:flutter/material.dart';
import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/appointment/views/widgets/expanded_selection_widget.dart';
import 'package:new_beginnings/src/pages/my_bills/cubit/my_bills_cubit.dart';
import 'package:new_beginnings/src/pages/profile/widgets/custom_textfeild_widget.dart';
import 'package:new_beginnings/src/pages/profile/widgets/user_profile_component.dart';

class MyBills extends StatefulWidget {
  const MyBills({super.key});

  @override
  State<MyBills> createState() => _MyBillsState();
}

class _MyBillsState extends State<MyBills> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailIdController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _amountController = TextEditingController();

  final TextEditingController _messageController = TextEditingController();

  String? _selectedpaymentType;
  String? _price;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return PrimaryBackground(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormFieldComponent(
                    isLabel: true,
                    borderRadius: 8,
                    stroke: 1,
                    borderColor: ColorConstants.primaryColor,
                    fillColor:
                        ColorConstants.inputFeildBgColor.withOpacity(0.2),
                    label: "Name",
                    hintText: "Enter your Name",
                    controller: _nameController,
                    textInputType: TextInputType.name,
                  ),
                  TextFormFieldComponent(
                      isLabel: true,
                      borderRadius: 8,
                      stroke: 1,
                      borderColor: ColorConstants.primaryColor,
                      fillColor:
                          ColorConstants.inputFeildBgColor.withOpacity(0.2),
                      label: "Email ID",
                      hintText: "Enter your Email ID",
                      controller: _emailIdController,
                      textInputType: TextInputType.emailAddress),
                  TextFormFieldComponent(
                    isLabel: true,
                    borderRadius: 8,
                    stroke: 1,
                    borderColor: ColorConstants.primaryColor,
                    fillColor:
                        ColorConstants.inputFeildBgColor.withOpacity(0.2),
                    label: "Phone Number",
                    hintText: "Enter your Phone Number",
                    controller: _phoneController,
                    textInputType: TextInputType.phone,
                  ),
                  TextFormFieldComponent(
                      isLabel: true,
                      borderRadius: 8,
                      stroke: 1,
                      borderColor: ColorConstants.primaryColor,
                      fillColor:
                          ColorConstants.inputFeildBgColor.withOpacity(0.2),
                      label: "Amount",
                      hintText: "Enter your Initial Amount",
                      textInputType: TextInputType.number,
                      controller: _amountController),
                  ExpandedSelectionWidget(
                    onTapped: (paymentType) {
                      setState(() {
                        _selectedpaymentType = paymentType;
                      });
                    },
                    title: _selectedpaymentType ?? "Patient Payment Type",
                    label: "Patient Payment Type",
                    textList: const [
                      'Co-Pay',
                      'Co-Insurance',
                      'Deductible',
                      'Other Amount',
                    ],
                  ),
                  TextFormFieldComponent(
                    isLabel: true,
                    borderRadius: 8,
                    stroke: 1,
                    borderColor: ColorConstants.primaryColor,
                    fillColor:
                        ColorConstants.inputFeildBgColor.withOpacity(0.2),
                    label: "Message",
                    hintText: "Enter your Message",
                    controller: _messageController,
                    maxLines: 5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocConsumer<MyBillsCubit, MyBillsState>(
                    builder: (context, state) => state.maybeWhen(
                      orElse: () => ElevatedButton(
                          onPressed: () {
                            _price = _amountController.text;
                            int? price = int.tryParse(_price!);
                            if (_formKey.currentState!.validate()) {
                              if (_nameController.text.isNotEmpty &&
                                  _amountController.text.isNotEmpty &&
                                  _selectedpaymentType!.isNotEmpty &&
                                  _phoneController.text.isNotEmpty &&
                                  _messageController.text.isNotEmpty &&
                                  _emailIdController.text.isNotEmpty) {
                                context.read<MyBillsCubit>().payBill(
                                    name: _nameController.text,
                                    email: _emailIdController.text,
                                    phone: _phoneController.text,
                                    paymentType: _selectedpaymentType!,
                                    message: _messageController.text,
                                    price: price!);
                              } else {
                                ToastComponent3(context).showToast(
                                    context, 'All Feilds are required');
                              }
                            }
                          },
                          child: Text(
                            "Pay Bill",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: ColorConstants.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                          )),
                      loading: () => ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Loading...',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: ColorConstants.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      )),
                              const SizedBox(width: 10),
                              const SizedBox(
                                height: 20,
                                width: 20,
                                child: AppProgressIndicator(
                                  color: ColorConstants.white,
                                ),
                              )
                            ],
                          )),
                      error: (message) => Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                _price = _amountController.text;
                                int? price = int.tryParse(_price!);
                                if (_formKey.currentState!.validate()) {
                                  if (_nameController.text.isNotEmpty &&
                                      _amountController.text.isNotEmpty &&
                                      _selectedpaymentType!.isNotEmpty &&
                                      _phoneController.text.isNotEmpty &&
                                      _messageController.text.isNotEmpty &&
                                      _emailIdController.text.isNotEmpty) {
                                    context.read<MyBillsCubit>().payBill(
                                        name: _nameController.text,
                                        email: _emailIdController.text,
                                        phone: _phoneController.text,
                                        paymentType: _selectedpaymentType!,
                                        message: _messageController.text,
                                        price: price!);
                                  } else {
                                    ToastComponent3(context).showToast(
                                        context, 'All Feilds are required');
                                  }
                                }
                              },
                              child: Text(
                                StringConstants.signUp,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: ColorConstants.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            message,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: ColorConstants.redIndicatorColor),
                          ),
                        ],
                      ),
                    ),
                    listener: (context, state) => state.maybeWhen(
                      orElse: () {
                        return null;
                      },
                      error: (message) {
                        ToastComponent3(context).showToast(context, message);
                        return null;
                      },
                      initial: () {
                        return null;
                      },
                      loaded: (data) async {
                        await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              PaymentWebViewScreen(uri: data.paymentLink!),
                        ));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
