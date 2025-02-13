import 'package:dicoding_flutter_fundamental/features/restaurant_details/bloc/restaurant_bloc.dart';
import 'package:dicoding_flutter_fundamental/features/restaurant_details/contents/detail_body_content.dart';
import 'package:dicoding_flutter_fundamental/features/restaurant_details/contents/detail_head_content.dart';
import 'package:dicoding_flutter_fundamental/remoting/repository/restaurant_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  const RestaurantDetailsScreen({super.key, this.id});

  final String? id;

  @override
  State<RestaurantDetailsScreen> createState() =>
      _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  late RestaurantBloc bloc;

  @override
  void initState() {
    bloc = RestaurantBloc(repository: GetIt.I.get<RestaurantRepository>())
      ..add(RestaurantInitEvent())
      ..add(RestaurantShowEvent(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestaurantBloc, RestaurantState>(
      bloc: bloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(size: 30, color: Colors.white),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          extendBodyBehindAppBar: true,
          body: Stack(
            children: [
              showHeaderData(state),
            ],
          ),
        );
      },
    );
  }

  Widget showHeaderData(RestaurantState state) {
    switch (state) {
      case RestaurantInitialState():
        return SizedBox();
      case RestaurantLoadingState():
        return SizedBox();
      case RestaurantSuccessState():
        final result = state.data.restaurant;
        final name = result.name;
        final idPicture = result.pictureId;
        final city = result.city;
        final address = result.address;
        final rating = result.rating;
        final description = result.description;
        final category = result.categories;
        final menus = result.menus;
        final review = result.customerReviews;
        return ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            DetailHeadContent(
              idPicture: idPicture,
              name: name,
              address: address,
              rating: rating,
              city: city,
              categories: category,
            ),
            DetailBodyContent(
              menu: menus,
              review: review,
              description: description,
            ),
          ],
        );
      case RestaurantFailedState():
        return SizedBox();
    }
  }
}
