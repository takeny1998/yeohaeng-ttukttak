import 'package:application_new/feature/geography/model/city_model.dart';
import 'package:application_new/shared/model/image_model.dart';
import 'package:flutter/material.dart';

class SelectedCityItem extends StatelessWidget {
  final CityModel city;
  final Function onCancel;

  const SelectedCityItem(
      {super.key, required this.city, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    final ImageModel(:path, :name, :ext) = city.insignia;

    final ThemeData(:colorScheme, :textTheme) = Theme.of(context);

    return IconButton(
        onPressed: () => onCancel(),
        style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0))
        ),
        icon: Badge(
          isLabelVisible: true,
          padding: const EdgeInsets.all(2.0),
          offset: const Offset(0, -2.0),
          label: Icon(Icons.remove, color: colorScheme.onPrimary, size: 16.0),
          child: Column(children: [
            CircleAvatar(
                radius: 24.0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child:
                      Image.network('https://host.tatine.kr$path/$name.$ext'),
                )),
            const SizedBox(height: 6.0),
            Text(city.name, style: const TextStyle(fontWeight: FontWeight.w600))
          ]),
        ));
  }
}
