import 'package:flutter/material.dart';

import 'User.dart';
import 'fetchUserProfile.dart';

class UserProfileScreen extends StatefulWidget {
  final String mobile;

  UserProfileScreen({required this.mobile});

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  ApiProvider apiProvider = ApiProvider();
  UserProfile? userProfile;

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  void fetchUserProfile() async {
    try {
      UserProfile? user = await apiProvider.fetchUserProfile(widget.mobile);
      setState(() {
        userProfile = user;
      });
    } catch (e) {
      // Handle error here
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Center(
        child: userProfile == null
            ? CircularProgressIndicator()
            : UserProfileWidget(userProfile: userProfile!),
      ),
    );
  }
}
class UserProfileWidget extends StatelessWidget {
  final UserProfile userProfile;

  UserProfileWidget({required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('First Name: ${userProfile.fName}'),
        Text('Middle Name: ${userProfile.mName ?? "N/A"}'), // Use "N/A" if middle name is null
        Text('Last Name: ${userProfile.lName}'),
        Text('DOB: ${userProfile.dob ?? "N/A"}'), // Use "N/A" if date of birth is null
        Text('Address: ${userProfile.address}'),
        Text('District: ${userProfile.district}'),
        Text('City: ${userProfile.city}'),
        Text('Pincode: ${userProfile.pincode}'),
        Text('State: ${userProfile.state}'),
      ],
    );
  }
}
