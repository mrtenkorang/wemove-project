class TicketModel {
  final String id;
  final String passengerName;
  final String passengerTelephone;
  final String referencePersonName;
  final String referencePersonTelephone;
  final String destination;
  final String departureDate;

  TicketModel({
    required this.passengerName,
    required this.passengerTelephone,
    required this.referencePersonName,
    required this.referencePersonTelephone,
    required this.destination,
    required this.departureDate,
    required this.id,
  });
}
