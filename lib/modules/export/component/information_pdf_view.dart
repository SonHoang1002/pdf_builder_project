import 'package:cv_1/common/test_save_value.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../edit/components/infomation/bloc_information.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;

// class InformationPdfWidget extends p.StatelessWidget {
//   @override
//   p.Widget build(p.Context context) {
//     return p.Container(
//         child: BlocBuilder<InformationBloc,InformationState>(builder: ((context, state) {
//       return p.Center(
//             child: p.Column(children: []));

//     }))
//     );
//   }
// }

class InformationPdfWidget extends p.StatelessWidget {
  @override
  p.Widget build(p.Context context) {
    print(TestSaveValue().getTestValue);
    return p.Container(
        child: p.Center(child: p.Text(TestSaveValue().getTestValue)));
  }
}
