import 'package:your_app_test/src/app/app_export.dart';
import 'package:your_app_test/src/pages/sign_up/cubit/sign_up_cubit.dart';

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
          const SizedBox(height: 20),
           TextFormFieldComponent(
               borderRadius: 12,
            borderColor: ColorConstants.white.withOpacity(0.00),
            fillColor: ColorConstants.white.withOpacity(0.06),
         controller: _emailController,
            hintText: 'Enter Email',
            textInputType: TextInputType.emailAddress,
          ),
         TextFormFieldComponent(
         borderRadius: 12,
            borderColor: ColorConstants.white.withOpacity(0.00),
            fillColor: ColorConstants.white.withOpacity(0.06),
               controller: _firstNameController,
            hintText: 'Create Username',
            textInputType: TextInputType.name,
          ),
          TextFormFieldComponent(
                borderRadius: 12,
            borderColor: ColorConstants.white.withOpacity(0.00),
            fillColor: ColorConstants.white.withOpacity(0.06),
        controller: _passwordController,
            hintText: 'Password',
            isPassword: true,
            textInputType: TextInputType.visiblePassword,
          ),
          TextFormFieldComponent(
                borderRadius: 12,
            borderColor: ColorConstants.white.withOpacity(0.00),
            fillColor: ColorConstants.white.withOpacity(0.06),
        controller: _confirmPasswordController,
            hintText: 'Confirm Password',
            isPassword: true,
            textInputType: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 20),
          BlocConsumer<SignUpCubit, SignUpState>(
            builder: (context, state) => state.maybeWhen(
              orElse: () => Stack(
                alignment: Alignment.center,
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
                      )),Text(
                        StringConstants.signUp,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: ColorConstants.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                      )
                ],
              ),
              loading: () => Stack(
                alignment: Alignment.center,
                children: [
                  ElevatedButton(
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
                      )),   Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Loading...',
                                  style:
                                      Theme.of(context).textTheme.bodyLarge!.copyWith(
                                            color: ColorConstants.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          )),    const SizedBox(width: 10),
                          const SizedBox(
                            height: 20,
                            width: 20,
                            child: AppProgressIndicator(
                              color: ColorConstants.white,
                            ),
                          )
                      
                        ],
                      ),
                       
                ],
              ),
              error: (message) => Column(
                children: [

                  Stack(
                    alignment: Alignment.center ,
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
                          Text(
                            StringConstants.signUp,
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  color: ColorConstants.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ],
                  ),
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
