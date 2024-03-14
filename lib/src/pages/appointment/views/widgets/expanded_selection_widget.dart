import '../../../../app/app_export.dart';

class ExpandedSelectionWidget extends StatefulWidget {
  final String label;
  final List<String> textList;
  final String title; // Make title mutable by removing the `final` keyword
  final Function(String) onTapped;

  ExpandedSelectionWidget({
    super.key,
    required this.label,
    required this.textList,
    required this.onTapped,
    required this.title,
  });

  @override
  State<ExpandedSelectionWidget> createState() =>
      _ExpandedSelectionWidgetState();
}

class _ExpandedSelectionWidgetState extends State<ExpandedSelectionWidget> {
  late String currentTitle;

  bool expanded = false;
  ExpansionTileController expandedController = ExpansionTileController();

  @override
  void initState() {
    super.initState();
    currentTitle =
        widget.title; // Initialize currentTitle with the widget's initial title
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
              color: Color(0xff80BCBD).withOpacity(0.2),
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
                currentTitle, // Use currentTitle for dynamic updates
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Color(0xff656567),
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
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
                        currentTitle =
                            location; // Update the currentTitle on selection
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
