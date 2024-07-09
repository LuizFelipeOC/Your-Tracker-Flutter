import 'package:flutter/material.dart';
import 'package:your_tracker/app/controller/packages/search_package_controller.dart';
import 'package:your_tracker/app/controller/packages/search_package_state.dart';
import 'package:your_tracker/app/shared/app_colors.dart';
import 'package:your_tracker/app/shared/custom_date_time.dart';
import 'package:your_tracker/app/shared/providers.dart';
import 'package:your_tracker/app/widgets/event_tracked_package_card.dart';
import 'package:your_tracker/app/app_widget.dart';

class SearchPackgesPage extends StatefulWidget {
  const SearchPackgesPage({super.key});

  @override
  State<SearchPackgesPage> createState() => _SearchPackgesPageState();
}

class _SearchPackgesPageState extends State<SearchPackgesPage> {
  final _searchController = getIt.get<SearchPackageController>();

  @override
  void initState() {
    _searchController.addListener(() {
      if (_searchController.value is ErrorSearchedPackageState) {
        scaffoldState.currentState?.showSnackBar(
          SnackBar(
            backgroundColor: AppColors.redWith80Opacity,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            hitTestBehavior: HitTestBehavior.opaque,
            content: const Row(
              children: [
                Flexible(child: Text('O pacote ainda não foi postado/encontrado, ou tipo de envio não é permitido o rastreio')),
              ],
            ),
          ),
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
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
                            onFieldSubmitted: (value) => _searchController.search(),
                            controller: _searchController.searchTextController,
                            onTapOutside: (e) => FocusScope.of(context).unfocus(),
                            cursorColor: AppColors.blackWith50Opacity,
                            decoration: InputDecoration(
                              hintText: 'Track code',
                              suffixIcon: InkWell(
                                onTap: () => _searchController.search(),
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
                    ),
                    ValueListenableBuilder(
                      valueListenable: _searchController,
                      builder: (_, state, __) {
                        if (state is LoadingSearchingPackageState) {
                          return SizedBox(
                            height: constraints.maxHeight * .5,
                            child: Center(
                              child: CircularProgressIndicator.adaptive(
                                backgroundColor: AppColors.blackWith50Opacity,
                                strokeWidth: 0.8,
                              ),
                            ),
                          );
                        }

                        if (state is SuccessSearchedPackageState) {
                          return Column(
                            children: [
                              const SizedBox(height: 30),
                              Container(
                                width: constraints.maxWidth,
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 0.1,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.package.code,
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                    Text(
                                      'Atualizado em ${CustomDateTime.fomatterDate(
                                        date: state.package.lastUpdate,
                                        pattern: 'dd/MM/yyyy HH:mm',
                                      )}',
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                              ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(top: 20, bottom: 20),
                                itemCount: state.package.events.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final event = state.package.events[index];

                                  return EventTrackedPackageCard(event: event);
                                },
                              ),
                            ],
                          );
                        }

                        return Container();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
