import 'package:expense_tracker/cubit/statement_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './data/colors.dart';
import './presentation/screens/add_new_record_screen.dart';
import './presentation/screens/home_screen.dart';
import './presentation/screens/bottom_navbar_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MultiBlocProvider(
      providers: [
        BlocProvider<StatementCubit>(create: (context) => StatementCubit()),
      ],
      child: MaterialApp(
        title: 'Wechi',
        theme: ThemeData(
          colorScheme: theme.colorScheme.copyWith(
            secondary: kPrimaryGreen,
          ),
          textTheme: GoogleFonts.plusJakartaSansTextTheme(
            Theme.of(context).textTheme,
          ),
          // primarySwatch: Colors.blue,
          primaryColor: kPrimaryGreen,
        ),
        home: const BottomNavbarScreen(),
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          BottomNavbarScreen.routeName: (context) => const BottomNavbarScreen(),
          AddNewRecordScreen.routeName: (context) => const AddNewRecordScreen(),
        },
      ),
    );
  }
}
