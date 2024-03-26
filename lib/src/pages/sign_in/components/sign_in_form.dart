import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/sign_in/cubit/sign_in_cubit.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(text: '');
    TextEditingController passwordController = TextEditingController(text: "");
    // TextEditingController emailController =
    //     TextEditingController(text: '');
    // TextEditingController passwordController =
    //     TextEditingController(text: "");
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        children: [
          // Text(StringConstants.account),
          const SizedBox(height: 25),
          TextFormFieldComponent(
            hintText: "Enter Email",
            controller: emailController,
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 20),
          TextFormFieldComponent(
            textInputType: TextInputType.visiblePassword,
            hintText: "Enter Password",
            isPassword: true,
            controller: passwordController,
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              context.router.pushNamed(
                RouteConstants.forgotPasswordRoute,
              );
            },
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(StringConstants.forgot,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: ColorConstants.primaryColor,
                        color: ColorConstants.primaryColor,
                      )),
            ),
          ),
          const SizedBox(height: 40),
          BlocConsumer<SignInCubit, SignInState>(
              listener: (context, state) => state.maybeWhen(
                    orElse: () {
                      return null;
                    },
                    error: (message) async {
                      ToastComponent3(context).showToast(context, message);

                      if (message == 'User not verified') {
                        await context.router.push(
                            VerifyEmailRoute(email: emailController.text));
                      }
                      return null;
                    },
                    loaded: (token) async {
                      await getIt
                          .get<SharedPreferencesUtil>()
                          .setString(SharedPreferenceConstants.apiAuthToken,
                              token.token)
                          .then((value) => context.router.pushAndPopUntil(
                              predicate: (route) => false, const HomeRoute()));
                      return null;
                    },
                  ),
              builder: (context, state) => state.maybeWhen(
                  loading: () => ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<SignInCubit>().signIn(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      },
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
                  loaded: (token) => ElevatedButton(
                      onPressed: () {
                        context.read<SignInCubit>().signIn(
                            email: emailController.text,
                            password: passwordController.text);
                      },
                      child: Text(StringConstants.login,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: ColorConstants.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ))),
                  error: (message) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<SignInCubit>().signIn(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            child: Text(
                              StringConstants.login,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: ColorConstants.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                            )),
                        const SizedBox(height: 10),
                        Text(
                          message,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: ColorConstants.redIndicatorColor),
                        ),
                      ],
                    );
                  },
                  orElse: () => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<SignInCubit>().signIn(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      },
                      child: Text(
                        StringConstants.login,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: ColorConstants.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                      )))),
          const SizedBox(height: 20),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                backgroundColor: ColorConstants.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      color: ColorConstants.primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                context.router.pushNamed(RouteConstants.signUpRoute);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(StringConstants.register,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: ColorConstants.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          )),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: ColorConstants.primaryColor,
                    size: 16,
                  )
                ],
              )),
          // const SizedBox(height: 50),
          // const SocialLogin(),
        ],
      ),
    );
  }
}
