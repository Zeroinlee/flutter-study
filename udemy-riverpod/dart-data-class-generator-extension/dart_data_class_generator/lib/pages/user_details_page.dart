import 'package:flutter/material.dart';

import '../models/user.dart';

class UserDetailsPage extends StatelessWidget {
  final User user;
  const UserDetailsPage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: CircleAvatar(
            child: Text(user.id.toString()),
          ),
          title: Text(user.username),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Text('name: ${user.name}'),
              Text('email: ${user.email}'),
              Text('phone: ${user.phone}'),
              Text('website: ${user.website}'),
            ],
          ),
          ShowAddress(address: user.address),
          ShowCompany(company: user.company),
        ],
      ),
    );
  }
}

class ShowAddress extends StatelessWidget {
  final Address address;
  const ShowAddress({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Address'),
        Text('street: ${address.street}'),
        Text('suite: ${address.suite}'),
        Text('city: ${address.city}'),
        Text('zipcode: ${address.zipcode}'),
        Text('latitude: ${address.geo.lat}'),
        Text('longitude: ${address.geo.lng}'),
      ],
    );
  }
}

class ShowCompany extends StatelessWidget {
  final Company company;
  const ShowCompany({
    super.key,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Company'),
        Text('name: ${company.name}'),
        Text('Catch Phrase: ${company.catchPhrase}'),
        Text('bs: ${company.bs}'),
      ],
    );
  }
}
