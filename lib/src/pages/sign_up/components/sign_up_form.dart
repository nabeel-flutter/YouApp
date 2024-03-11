import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/sign_up/cubit/sign_up_cubit.dart';

part 'sign_up_form.freezed.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  var selectedCountry =
      const Country(name: "Pakistan", code: "+92", flag: "assets/icon/pk.svg");
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 30),
          TextFormFieldComponent(
            controller: _firstNameController,
            hintText: 'First Name',
            textInputType: TextInputType.name,
          ),
          TextFormFieldComponent(
            controller: _lastNameController,
            hintText: 'Last Name',
            textInputType: TextInputType.name,
          ),
          TextFormFieldComponent(
            controller: _emailController,
            hintText: 'Email',
            textInputType: TextInputType.emailAddress,
          ),
          TextFormFieldComponent(
            controller: _phoneController,
            hintText: 'Phone Number',
            textInputType: TextInputType.phone,
          ),
          TextFormFieldComponent(
            controller: _passwordController,
            hintText: 'Password',
            isPassword: true,
            textInputType: TextInputType.visiblePassword,
          ),
          TextFormFieldComponent(
            controller: _confirmPasswordController,
            hintText: 'Confirm Password',
            isPassword: true,
            textInputType: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 20),
          BlocConsumer<SignUpCubit, SignUpState>(
            builder: (context, state) => state.maybeWhen(
              orElse: () => ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_confirmPasswordController.text ==
                          _passwordController.text) {
                        context.read<SignUpCubit>().signUp(
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            password: _passwordController.text,
                            email: _emailController.text,
                            confirmPassword: _confirmPasswordController.text,
                            phone: _phoneController.text);
                      } else {
                        ToastComponent3(context)
                            .showToast(context, 'Password not match');
                      }
                    }
                  },
                  child: Text(
                    StringConstants.signUp,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                        if (_formKey.currentState!.validate()) {
                          if (_confirmPasswordController.text ==
                              _passwordController.text) {
                            context.read<SignUpCubit>().signUp(
                                firstName: _firstNameController.text,
                                lastName: _lastNameController.text,
                                password: _passwordController.text,
                                email: _emailController.text,
                                confirmPassword:
                                    _confirmPasswordController.text,
                                phone: _phoneController.text);
                          } else {
                            ToastComponent3(context)
                                .showToast(context, 'Password not match');
                          }
                        }
                      },
                      child: Text(
                        StringConstants.signUp,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                        .copyWith(color: ColorConstants.redIndicatorColor),
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
              loaded: (token) {
                ToastComponent2(context).showToast(context,
                    'User Created successfully please check your email');
                return Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(height: 20),
          const Align(
              alignment: Alignment.bottomRight, child: AlreadyAccount()),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

//   Widget _usernameField(BuildContext context) {
//     return TextFormField(
//       decoration: InputDecoration(
//         fillColor: darken(getThemeColor(context), 0.25),
//         filled: true,
//         contentPadding: const EdgeInsets.symmetric(vertical: 14),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15),
//           borderSide: BorderSide.none,
//         ),
//         prefixIcon: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15.0),
//           child: SvgPicture.asset('assets/icon/person.svg'),
//         ),
//         prefixIconConstraints: const BoxConstraints(minHeight: 20),
//         labelText: 'Name',
//         labelStyle: const TextStyle(color: ColorConstants.white),
//       ),
//     );
//   }

//   Widget _emailField(BuildContext context) {
//     return TextFormField(
//       decoration: InputDecoration(
//         fillColor: darken(getThemeColor(context), 0.25),
//         filled: true,
//         contentPadding: const EdgeInsets.symmetric(vertical: 14),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15),
//           borderSide: BorderSide.none,
//         ),
//         prefixIcon: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15.0),
//           child: SvgPicture.asset('assets/icon/email.svg'),
//         ),
//         prefixIconConstraints: const BoxConstraints(minHeight: 20),
//         labelText: 'Email',
//         labelStyle: const TextStyle(color: ColorConstants.white),
//       ),
//     );
//   }

//   Widget _mobileNumberField(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           decoration: BoxDecoration(
//             color: darken(getThemeColor(context), 0.25),
//             border: Border.all(color: ColorConstants.white),
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(15),
//               bottomLeft: Radius.circular(15),
//             ),
//           ),
//           child: DropdownButton<Country>(
//             value: selectedCountry,
//             underline: Container(),
//             dropdownColor: darken(getThemeColor(context), 0.25),
//             onChanged: (Country? newValue) {
//               setState(() {
//                 selectedCountry = newValue!;
//               });
//             },
//             items: countries
//                 .map<DropdownMenuItem<Country>>(
//                   (Country country) => DropdownMenuItem<Country>(
//                     value: country,
//                     child: Row(
//                       children: [
//                         SvgPicture.asset(
//                           country.flag,
//                           height: 25,
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//                 .toList(),
//           ),
//         ),
//         Expanded(
//           child: TextFormField(
//             decoration: InputDecoration(
//               fillColor: darken(getThemeColor(context), 0.25),
//               filled: true,
//               contentPadding:
//                   const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
//               border: const OutlineInputBorder(
//                 // borderRadius: BorderRadius.circular(15),

//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(15),
//                   bottomRight: Radius.circular(15),
//                 ),
//                 borderSide: BorderSide.none,
//               ),
//               labelText: 'Contact No',
//               labelStyle: const TextStyle(color: ColorConstants.white),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _locationField(BuildContext context) {
//     return TextFormField(
//       decoration: InputDecoration(
//         fillColor: darken(getThemeColor(context), 0.25),
//         filled: true,
//         contentPadding: const EdgeInsets.symmetric(vertical: 14),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15),
//           borderSide: BorderSide.none,
//         ),
//         prefixIcon: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15.0),
//           child: SvgPicture.asset('assets/icon/location.svg'),
//         ),
//         prefixIconConstraints: const BoxConstraints(minHeight: 20),
//         labelText: 'Location',
//         labelStyle: const TextStyle(color: ColorConstants.white),
//       ),
//     );
//   }

//   Widget _passwordField(BuildContext context) {
//     return TextFormField(
//       decoration: InputDecoration(
//         fillColor: darken(getThemeColor(context), 0.25),
//         filled: true,
//         contentPadding: const EdgeInsets.symmetric(vertical: 14),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15),
//           borderSide: BorderSide.none,
//         ),
//         prefixIcon: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15.0),
//           child: SvgPicture.asset('assets/icon/password.svg'),
//         ),
//         prefixIconConstraints: const BoxConstraints(minHeight: 20),
//         labelText: 'Password',
//         labelStyle: const TextStyle(color: ColorConstants.white),
//       ),
//     );
//   }

//   Widget _confirmPasswordField(BuildContext context) {
//     return TextFormField(
//       decoration: InputDecoration(
//         fillColor: darken(getThemeColor(context), 0.25),
//         filled: true,
//         contentPadding: const EdgeInsets.symmetric(vertical: 14),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15),
//           borderSide: BorderSide.none,
//         ),
//         prefixIcon: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15.0),
//           child: SvgPicture.asset('assets/icon/password.svg'),
//         ),
//         prefixIconConstraints: const BoxConstraints(minHeight: 20),
//         labelText: 'Confirm Password',
//         labelStyle: const TextStyle(color: ColorConstants.white),
//       ),
//     );
//   }

//   Widget _signUpButton(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 56,
//       child: ElevatedButton(
//         onPressed: () {
//           NavigationUtil.push(
//             context,
//             RouteConstants.homeRoute,
//           );
//         },
//         style: ElevatedButton.styleFrom(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//         ),
//         child: Text(
//           'Sign Up',
//           style: Theme.of(context).textTheme.bodyMedium,
//         ),
//       ),
//     );
//   }
}

@freezed
class Country with _$Country {
  const factory Country({
    required String name,
    required String code,
    required String flag,
  }) = _Country;
}

List<Country> countries = [
  const Country(name: "Pakistan", code: "+92", flag: "assets/icon/pk.svg"),
  const Country(name: "USA", code: "+1", flag: "assets/icon/us.svg"),
  const Country(name: "UAE", code: "+971", flag: "assets/icon/ae.svg"),
];
