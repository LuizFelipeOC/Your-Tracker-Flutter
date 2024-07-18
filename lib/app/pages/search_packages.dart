import 'package:flutter/material.dart';
import 'package:uicons/uicons.dart';
import 'package:your_tracker/app/controller/packages/search_package_controller.dart';
import 'package:your_tracker/app/controller/packages/search_package_state.dart';
import 'package:your_tracker/app/shared/app_colors.dart';
import 'package:your_tracker/app/shared/custom_date_time.dart';
import 'package:your_tracker/app/shared/providers.dart';
import 'package:your_tracker/app/widgets/event_tracked_package_card.dart';
import 'package:your_tracker/app/app_widget.dart';
import 'package:your_tracker/app/widgets/modal_sheet_save_package.dart';
import 'package:your_tracker/app/widgets/package_dialog.dart';
import 'package:your_tracker/app/widgets/package_snack_bar.dart';

class SearchPackgesPage extends StatefulWidget {
  const SearchPackgesPage({super.key});

  @override
  State<SearchPackgesPage> createState() => _SearchPackgesPageState();
}

class _SearchPackgesPageState extends State<SearchPackgesPage> {
  final _searchController = getIt.get<SearchPackageController>();

  @override
  void initState() {
    _searchController.addListener(
      () {
        if (_searchController.value is ErrorSearchedPackageState) {
          scaffoldState.currentState?.showSnackBar(
            PackageSnackBar(
              type: PackageSnackBarType.error,
              content: Row(
                children: [
                  Icon(
                    UIcons.boldRounded.exclamation,
                    size: 26,
                    color: AppColors.white,
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      'Seu pacote ainda não está disponível para rastreio. Tente novamente mais tarde.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );

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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Bem-Vindo\nYour Tracker',
                                style: Theme.of(context).textTheme.headlineLarge,
                              ),
                              ValueListenableBuilder(
                                valueListenable: _searchController,
                                builder: (_, state, __) {
                                  if (state is! SuccessSearchedPackageState) {
                                    return const SizedBox();
                                  }

                                  return GestureDetector(
                                    onTap: () async {
                                      final result = await showDialog<bool?>(
                                        context: context,
                                        builder: (ctx) {
                                          return PackageDialog(
                                            title: 'Salvar pacote',
                                            onTap: () => Navigator.pop(ctx),
                                            content: Text(
                                              'Você tem certeza que deseja salvar essa encomenda ?',
                                              style: Theme.of(context).textTheme.bodySmall,
                                            ),
                                            actions: Container(
                                              alignment: Alignment.bottomRight,
                                              child: ElevatedButton(
                                                child: const Text('Salvar'),
                                                onPressed: () {
                                                  Navigator.pop(context, true);
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );

                                      if (result != null && result) {
                                        if (context.mounted) {
                                          showModalBottomSheet(
                                            useSafeArea: true,
                                            isDismissible: false,
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (_) {
                                              return ModalSheetSavePackage(package: state.package);
                                            },
                                          );
                                        }
                                      }
                                    },
                                    child: Icon(
                                      UIcons.boldStraight.heart,
                                      size: 30,
                                      color: AppColors.redWith80Opacity,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            style: Theme.of(context).textTheme.bodyMedium,
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
