import 'package:flutter/material.dart';
import 'package:flutter_chat_app/data/datasources/api/auth_api.dart';
import 'package:flutter_chat_app/data/models/user_model.dart';
import 'package:flutter_chat_app/data/repositories_impl/auth_repository_impl.dart';
import 'package:flutter_chat_app/domain/repositories/auth_repository.dart';
import 'package:flutter_chat_app/presentation/core/colors/app_colors.dart';
import 'package:flutter_chat_app/presentation/core/shared_widgets/card_person_widget.dart';

class Search extends SearchDelegate<UserModel?> {
  final AuthRepository _repository = AuthRepositoryImpl(AuthApi());
  List<UserModel> users = [];
  Search();

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = "",
        icon: const Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (query.trim().isEmpty) {
      return const Center(
        child: Text(
          'El campo de búsqueda esta vacío',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
    return FutureBuilder(
      future: _repository.getUsersByName(query),
      builder:
          (BuildContext context, AsyncSnapshot<List<UserModel?>> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text(
              "Hubo un error!",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }
        if (snapshot.hasData) {
          final users = snapshot.data;
          if (users!.isNotEmpty) {
            return showUsers(users: users, size: size);
          } else {
            return const Center(
              child: Text(
                "No se encontró ningún usuario!",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return showUsers(users: users, size: size);
  }

  Widget showUsers({required List<UserModel?> users, required Size size}) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return CardPersonWidget(
          size: size,
          user: users[index]!,
          function: () {
            close(context, users[index]);
          },
        );
      },
      padding: const EdgeInsets.all(10.0),
    );
  }
}
