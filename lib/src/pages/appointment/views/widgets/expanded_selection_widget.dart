import 'package:your_app_test/src/app/app_export.dart';

class ExpandedSelectionWidget extends StatefulWidget {
  final String label;
  final List<String> textList;
  final String title;
  final Function(String) onTapped;
  final bool hasOtherOption;

  const ExpandedSelectionWidget({
    super.key,
    required this.label,
    required this.textList,
    required this.onTapped,
    required this.title,
    this.hasOtherOption = false,
  });

  @override
  State<ExpandedSelectionWidget> createState() =>
      _ExpandedSelectionWidgetState();
}

class _ExpandedSelectionWidgetState extends State<ExpandedSelectionWidget> {
  late String currentTitle;

  bool expanded = false;
  ExpansionTileController expandedController = ExpansionTileController();

  late TextEditingController otherOptionController;

  @override
  void initState() {
    super.initState();
    currentTitle = widget.title;
    otherOptionController = TextEditingController();
  }

  @override
  void dispose() {
    otherOptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: ColorConstants.primaryTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff80BCBD).withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: ColorConstants.primaryColor,
              ),
            ),
            child: ExpansionTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: ColorConstants.white,
              title: Text(
                currentTitle,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: const Color(0xff656567),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              initiallyExpanded: false,
              controller: expandedController,
              onExpansionChanged: (expanded) {},
              children: [
                ...widget.textList.map(
                  (location) => ListTile(
                    onTap: () {
                      setState(() {
                        currentTitle = location;
                      });
                      widget.onTapped(location);
                      expandedController.collapse();
                    },
                    title: Text(
                      location,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: ColorConstants.greenish,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                if (widget.hasOtherOption)
                  ListTile(
                    title: TextField(
                      controller: otherOptionController,
                      decoration: const InputDecoration(
                        hintText: 'Other (Please specify)',
                        hintStyle: TextStyle(
                          color: ColorConstants.primaryTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          widget.onTapped(value);
                        });
                      },
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
