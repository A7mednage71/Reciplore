import 'package:looqma/core/common/models/address_model.dart';

extension AddressFormatter on AddressModel {
  String get fullAddress {
    final List<String> parts = [];

    if (buildingNumber.isNotEmpty) parts.add('Bldg. $buildingNumber');
    if (streetName.isNotEmpty) parts.add(streetName);
    if (floorNumber != null) parts.add('Floor $floorNumber');

    return parts.join(', ');
  }
}
