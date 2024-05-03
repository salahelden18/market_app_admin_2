import 'package:equatable/equatable.dart';

class BranchRequestModel extends Equatable {
  final String enName;
  final String? arName;
  final String? trName;
  final double lat;
  final double lng;
  final String? enDetailedAddress;
  final String? arDetailedAddress;
  final String? trDetailedAddress;
  final double deliveryTime;
  final double deliveryFees;
  final double minimumOurderValue;
  final double maximumCoverAreaInkM;
  final String currency;
  final String currencySymbol;

  const BranchRequestModel({
    this.arDetailedAddress,
    this.arName,
    required this.currency,
    required this.currencySymbol,
    required this.deliveryFees,
    required this.deliveryTime,
    this.enDetailedAddress,
    required this.enName,
    required this.lat,
    required this.lng,
    required this.maximumCoverAreaInkM,
    required this.minimumOurderValue,
    this.trDetailedAddress,
    this.trName,
  });

  Map<String, dynamic> toJson() {
    return {
      'arDetailedAddress': arDetailedAddress,
      'arName': arName,
      'currency': currency,
      'currencySymbol': currencySymbol,
      'deliveryFees': deliveryFees,
      'deliveryTime': deliveryTime,
      'enDetailedAddress': enDetailedAddress,
      'enName': enName,
      'lat': lat,
      'lng': lng,
      'maximumCoverAreaInKM': maximumCoverAreaInkM,
      'minimumOrderValue': minimumOurderValue,
      'trDetailedAddress': trDetailedAddress,
      'trName': trName,
    };
  }

  @override
  List<Object?> get props => [
        enName,
        arName,
        trName,
        lat,
        lng,
        enDetailedAddress,
        arDetailedAddress,
        trDetailedAddress,
        deliveryTime,
        deliveryFees,
        minimumOurderValue,
        maximumCoverAreaInkM,
        currency,
        currencySymbol,
      ];
}
