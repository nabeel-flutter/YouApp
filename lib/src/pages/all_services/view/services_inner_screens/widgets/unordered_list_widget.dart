import 'package:new_beginnings/src/app/app_export.dart';

class UnorderedList extends StatelessWidget {
  const UnorderedList(this.texts, {super.key});
  final List<PsychiatristEvaluationTextList> texts;

  @override
  Widget build(BuildContext context) {
    

    return Column(children:texts.asMap().entries.map((e) {
      if(e.value.innerList.isEmpty){
        return OrderedListItem(e.value.text,
        index: e.key,
        );
      }else{
        return 
        Column(
          children: 
        e.value.innerList.asMap().entries.map((unOrderItem) =>  UnorderedListItem( unOrderItem.value  )).toList());
      }
    }   
    ).toList() );
  }
}

class UnorderedListItem extends StatelessWidget {
  const UnorderedListItem(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "• ",
          style: TextStyle(fontSize: 20),
        ),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ],
    );
  }
}
class OrderedListItem extends StatelessWidget {
  const OrderedListItem(this.text, {super.key, required this.index});
  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         Text(
          "${index+1} ",
          style: TextStyle(fontSize: 16),
        ),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ],
    );
  }
}
