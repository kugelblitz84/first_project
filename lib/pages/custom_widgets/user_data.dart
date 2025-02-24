class user_data {
  static late String? name,
      email,
      username,
      phone,
      email_verified_at,
      created_at,
      updated_at,
      image,
      about,
      exp;
  //late Map<String, dynamic> user_info;
  static void set_user_vlogs(Map<String, dynamic> json) {
    final List<dynamic> data = json['data'];
    print(
        'user Vlogs data recieved: ${data},\nid: ${data[0]['id']}\n responce recieved: ${json}');
  }

  static void set_user_data(Map<String, dynamic> json) {
    Map<String, dynamic>? user = json['user'] as Map<String, dynamic>?,
        info = json['user']['user_info'] as Map<String, dynamic>?;
    print('info about the user : ${user}');
    name = user?['name'];
    email = user?['email'];
    username = user?['username'];
    phone = user?['phone'];
    image = info?['image'];
    about = info?['about'];
    exp = info?['experience'];
  }
}

// {
//   "message": "User updated successfully",
//   "user": {
//     "id": 0,
//     "name": "string",
//     "email": "string",
//     "username": "string",
//     "phone": "string",
//     "email_verified_at": "2019-08-24T14:15:22Z",
//     "created_at": "2019-08-24T14:15:22Z",
//     "updated_at": "2019-08-24T14:15:22Z",
//     "user_info": {
//       "id": 0,
//       "user_id": 0,
//       "father_name": "string",
//       "mother_name": "string",
//       "address": "string",
//       "city": "string",
//       "province": "string",
//       "postal_code": "string",
//       "country": "string",
//       "nid": "string",
//       "passport": "string",
//       "image": "string",
//       "about": "string",
//       "tourism_experience": "string",
//       "education": "string",
//       "experience": "string",
//       "skills": "string",
//       "languages": "string",
//       "hobbies": "string"
//     }
//   }
// }
