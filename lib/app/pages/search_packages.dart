import 'package:flutter/material.dart';
import 'package:your_tracker/app/shared/app_colors.dart';

class SearchPackgesPage extends StatefulWidget {
  const SearchPackgesPage({super.key});

  @override
  State<SearchPackgesPage> createState() => _SearchPackgesPageState();
}

class _SearchPackgesPageState extends State<SearchPackgesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Welcome\nYour Tracker',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            // GestureDetector(
                            //   onTap: () {},
                            //   child: Icon(
                            //     Icons.heart_broken_outlined,
                            //     size: 40,
                            //     color: AppColors.redWith80Opacity,
                            //   ),
                            // )
                          ],
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          onTapOutside: (e) => FocusScope.of(context).unfocus(),
                          cursorColor: AppColors.blackWith50Opacity,
                          decoration: InputDecoration(
                            hintText: 'Track code',
                            suffixIcon: InkWell(
                              onTap: () {},
                              child: Icon(
                                size: 38,
                                color: AppColors.blackWith60Opacity,
                                Icons.chevron_right,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
