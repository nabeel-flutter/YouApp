import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/sign_in/cubit/sign_in_cubit.dart';
import 'package:new_beginnings/src/route/app_router.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController =
        TextEditingController(text: 'mor_2314');
    TextEditingController passwordController =
        TextEditingController(text: "83r5^_");

    return Column(
      children: [
        // Text(StringConstants.account),
        const SizedBox(height: 25),
        TextFormFieldComponent(
            controller: userNameController, label: 'User Name'),
        const SizedBox(height: 20),
        TextFormFieldComponent(
            controller: passwordController, label: 'Password'),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            context.router.pushNamed(RouteConstants.forgotPasswordRoute);
          },
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(StringConstants.forgot,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
                  loaded: (token) async {
                    getIt.get<SharedPreferencesUtil>().setString(
                        SharedPreferenceConstants.apiAuthToken, token.token);
                    return await context.router.pushAndPopUntil(
                        predicate: (route) => false, const HomeRoute());
                  },
                ),
            builder: (context, state) => state.maybeWhen(
                loading: () => ElevatedButton(
                    onPressed: () {
                      context.read<SignInCubit>().signIn(
                          userName: userNameController.text,
                          password: passwordController.text);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Loading...'),
                        SizedBox(width: 10),
                        SizedBox(
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
                          userName: userNameController.text,
                          password: passwordController.text);
                    },
                    child: const Text('Success Sign In')),
                error: (message) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            context.read<SignInCubit>().signIn(
                                userName: userNameController.text,
                                password: passwordController.text);
                          },
                          child: Text(
                            "Login",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                            .copyWith(color: ColorConstants.redIndicatorColor),
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
                      context.read<SignInCubit>().signIn(
                          userName: userNameController.text,
                          password: passwordController.text);
                    },
                    child: Text(
                      StringConstants.LogIn,
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
                Text('Register',
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
        const SizedBox(height: 50),
        // const SocialLogin(),
      ],
    );
  }
}
