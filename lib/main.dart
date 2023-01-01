import 'package:cv_1/modules/edit/components/additional/blocs/additional_bloc.dart';
import 'package:cv_1/modules/edit/components/all_view.dart';
import 'package:cv_1/modules/edit/components/contact/blocs/contact_bloc.dart';
import 'package:cv_1/modules/edit/components/education/blocs/education_bloc.dart';
import 'package:cv_1/modules/edit/components/experience/blocs/experience_bloc.dart';
import 'package:cv_1/modules/edit/components/infomation/blocs/infomation_bloc.dart';
import 'package:cv_1/modules/edit/components/skill/blocs/skill_bloc.dart';
import 'package:cv_1/modules/edit/components/summary/blocs/summary_bloc.dart';
import 'package:cv_1/modules/edit/edit.dart';
import 'package:cv_1/observer/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);
// final c= Color(#F1F1F1);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InformationBloc>(create: ((context) => InformationBloc())),
        BlocProvider<ContactBloc>(create: ((context) => ContactBloc())),
        BlocProvider<EducationBloc>(create: ((context) => EducationBloc())),
        BlocProvider<ExperienceBloc>(create: ((context) => ExperienceBloc())),
        BlocProvider<SkillBloc>(create: ((context) => SkillBloc())),
        BlocProvider<SummaryBloc>(create: ((context) => SummaryBloc())),
        BlocProvider<AdditionalBloc>(create: ((context) => AdditionalBloc())),
        BlocProvider<ImageAvatarCubit>(
            create: ((context) => ImageAvatarCubit())),
        //title
        BlocProvider<InfoTitleBloc>(create: ((context) => InfoTitleBloc())),
        BlocProvider<ContactPhoneTitleCubit>(
            create: ((context) => ContactPhoneTitleCubit())),
        BlocProvider<ContactEmailTitleCubit>(
            create: ((context) => ContactEmailTitleCubit())),
        BlocProvider<ContactAddressTitleCubit>(
            create: ((context) => ContactAddressTitleCubit())),

        BlocProvider<EducationSchoolTitleCubit>(
            create: ((context) => EducationSchoolTitleCubit())),
        BlocProvider<EducationGraduationTitleCubit>(
            create: ((context) => EducationGraduationTitleCubit())),
        BlocProvider<EducationAchivementTitleCubit>(
            create: ((context) => EducationAchivementTitleCubit())),

// ContactAddressTitleCubit
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: white,
          // primaryColor: Colors.white
        ),
        // home: TestInformation(),
        // home: Test1(),
        home: Edit(),
      ),
      // https://api.flutter.dev/flutter/widgets/Focus-class.html
    );
  }
}
