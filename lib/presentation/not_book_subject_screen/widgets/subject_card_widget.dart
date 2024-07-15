import '../../../core/app_export.dart';

class SubjectCard extends StatelessWidget {
  final String name;
  final Color color;
  final String initial;

  SubjectCard({
    required this.name,
    required this.color,
    required this.initial,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: ColorConstant.greyDD),
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10.0),
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(initial,
                  style: PMT.appStyle(18,
                      fontWeight: FontWeight.w600,
                      fontColor: ColorConstant.primaryWhite)),
            ),
          ),
          Text(name, style: PMT.appStyle(15, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
