import 'package:image_picker/image_picker.dart';
import 'package:new_beginnings/src/app/app_export.dart'; // Ensure your app_export.dart file exports the required dependencies

class UserProfileComponent extends StatefulWidget {
  final bool? profile;
  final String userName;
  final String userEmail;
  final String? image;
  final bool isEditable;

  final Function(File)? onImageSelected; // Callback function
  const UserProfileComponent({
    Key? key,
    this.profile = false,
    required this.userName,
    required this.userEmail,
    this.isEditable = true,
    this.onImageSelected,
    this.image, // Initialize the callback
  }) : super(key: key);

  @override
  State<UserProfileComponent> createState() => _UserProfileComponentState();
}

class _UserProfileComponentState extends State<UserProfileComponent> {
  File? _image; // This will hold the image file

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // Update the state to display the new image
      setState(() {
        _image = File(image.path);
      });
      // Call the callback function and pass the selected image file
      if (widget.onImageSelected != null) {
        widget.onImageSelected!(_image!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border:
                        Border.all(width: 5, color: const Color(0xff80BCBD)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    // Display the selected image or a placeholder
                    child: _image == null
                        ? Image.network(
                            widget.image ??
                                'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
                            fit: BoxFit.fill,
                          )
                        : Image.file(
                            _image!,
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
                // Button to pick an image
                if (widget.isEditable)
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: GestureDetector(
                      onTap: _pickImage, // Call the image picker function
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: ColorConstants.greenish,
                              border: Border.all(
                                  width: 4,
                                  color: darken(getThemeColor(context), 0.2))),
                          child: widget.profile!
                              ? Image.asset(
                                  "assets/images/cameraicon.png",
                                )
                              : Image.asset(
                                  "assets/images/upload_gallery.png",
                                )),
                    ),
                  )
              ],
            ),
            // User name and email
            SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.userName,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.userEmail,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: const Color(0xff0A7E80)),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserProfileBottomComponent extends StatelessWidget {
  final VoidCallback onPressed;
  const UserProfileBottomComponent({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18), topRight: Radius.circular(18)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff0A7E80), Color(0xff023E3F)])),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Column(
          children: [
            Button(
              label: StringConstants.editprofile,
              onPressed: () {
                onPressed();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const LogoutButton()
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  const Button({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstants.greenish,
        ),
        onPressed: () {
          onPressed();
        },
        child: Text(label,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: ColorConstants.white,
                )));
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffD80404),
        ),
        onPressed: () {
          getIt
              .get<SharedPreferencesUtil>()
              .removeValue(SharedPreferenceConstants.apiAuthToken)
              .then((value) async => await context.router.pushAndPopUntil(
                  predicate: (route) => false, const SignInRoute()));
        },
        child: Text(
          'Logout',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: ColorConstants.white,
              ),
        ));
  }
}
