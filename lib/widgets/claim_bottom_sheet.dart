import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//'adult', 'harm', 'bully', 'spam', 'copyright', 'hate’
class ClaimBottomSheet extends StatelessWidget {

  final VoidCallback callback;

  ClaimBottomSheet(this.callback);

  @override
  Widget build(BuildContext context) {
    List<Complaint> complaints = [
      Complaint('adult'),
      Complaint('harm'),
      Complaint('bully'),
      Complaint('copyright'),
      Complaint('hate')
    ];
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(complaints.length, (index) => ComplaintWidget(complaints[index], callback)),
      ),
    );
  }
}

class ComplaintWidget extends StatelessWidget {
  final Complaint complaint;
  final VoidCallback voidCallback;

  ComplaintWidget(this.complaint, this.voidCallback);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => voidCallback.call(),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(complaint.description,
          style: Theme
              .of(context)
              .textTheme
              .headline2,)
      ),
    );
  }
}

class Complaint {

  Complaint(this.description);

  String description;
}
