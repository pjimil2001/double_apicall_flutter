class book {
  bool? error;
  String? msg;
  List<ResultAllBooks>? resultAllBooks;

  book({this.error, this.msg, this.resultAllBooks});

  book.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    msg = json['msg'];
    if (json['result_all_books'] != null) {
      resultAllBooks = <ResultAllBooks>[];
      json['result_all_books'].forEach((v) {
        resultAllBooks!.add(new ResultAllBooks.fromJson(v));
      });
    }
  }

  get resultreq => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['msg'] = this.msg;
    if (this.resultAllBooks != null) {
      data['result_all_books'] =
          this.resultAllBooks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResultAllBooks {
  int? id;
  String? name;
  String? price;
  String? details;
  String? status;
  String? image;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  String? addedBy;
  String? artistId;
  Admin? admin;
  User? user;
  List<Favbook>? favbook;

  ResultAllBooks(
      {this.id,
      this.name,
      this.price,
      this.details,
      this.status,
      this.image,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.addedBy,
      this.artistId,
      this.admin,
      this.user,
      this.favbook});

  ResultAllBooks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    details = json['details'];
    status = json['status'];
    image = json['image'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    addedBy = json['added_by'];
    artistId = json['artist_id'];
    admin = json['admin'] != null ? new Admin.fromJson(json['admin']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['favbook'] != null) {
      favbook = <Favbook>[];
      json['favbook'].forEach((v) {
        favbook!.add(new Favbook.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['details'] = this.details;
    data['status'] = this.status;
    data['image'] = this.image;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['added_by'] = this.addedBy;
    data['artist_id'] = this.artistId;
    if (this.admin != null) {
      data['admin'] = this.admin!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.favbook != null) {
      data['favbook'] = this.favbook!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Admin {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? username;
  Null? mobile;
  int? role;
  String? userImage;
  Null? apiToken;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Null? zipcode;
  Null? city;
  Null? state;
  Null? address;
  Null? bankName;
  Null? bankBranch;
  Null? bankIfsc;
  Null? bankAccountNo;

  Admin(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.username,
      this.mobile,
      this.role,
      this.userImage,
      this.apiToken,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.zipcode,
      this.city,
      this.state,
      this.address,
      this.bankName,
      this.bankBranch,
      this.bankIfsc,
      this.bankAccountNo});

  Admin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    username = json['username'];
    mobile = json['mobile'];
    role = json['role'];
    userImage = json['user_image'];
    apiToken = json['api_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    zipcode = json['zipcode'];
    city = json['city'];
    state = json['state'];
    address = json['address'];
    bankName = json['bank_name'];
    bankBranch = json['bank_branch'];
    bankIfsc = json['bank_ifsc'];
    bankAccountNo = json['bank_account_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['username'] = this.username;
    data['mobile'] = this.mobile;
    data['role'] = this.role;
    data['user_image'] = this.userImage;
    data['api_token'] = this.apiToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['zipcode'] = this.zipcode;
    data['city'] = this.city;
    data['state'] = this.state;
    data['address'] = this.address;
    data['bank_name'] = this.bankName;
    data['bank_branch'] = this.bankBranch;
    data['bank_ifsc'] = this.bankIfsc;
    data['bank_account_no'] = this.bankAccountNo;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? lastName;
  String? email;
  Null? emailVerifiedAt;
  Null? username;
  String? mobile;
  String? bornYear;
  Null? role;
  String? userImage;
  Null? zipcode;
  Null? city;
  Null? state;
  Null? address;
  Null? bankName;
  Null? bankBranch;
  Null? bankIfsc;
  Null? bankAccountNo;
  Null? apiToken;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Null? packagesId;
  Null? expiredPackageDate;

  User(
      {this.id,
      this.name,
      this.lastName,
      this.email,
      this.emailVerifiedAt,
      this.username,
      this.mobile,
      this.bornYear,
      this.role,
      this.userImage,
      this.zipcode,
      this.city,
      this.state,
      this.address,
      this.bankName,
      this.bankBranch,
      this.bankIfsc,
      this.bankAccountNo,
      this.apiToken,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.packagesId,
      this.expiredPackageDate});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    username = json['username'];
    mobile = json['mobile'];
    bornYear = json['born_year'];
    role = json['role'];
    userImage = json['user_image'];
    zipcode = json['zipcode'];
    city = json['city'];
    state = json['state'];
    address = json['address'];
    bankName = json['bank_name'];
    bankBranch = json['bank_branch'];
    bankIfsc = json['bank_ifsc'];
    bankAccountNo = json['bank_account_no'];
    apiToken = json['api_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    packagesId = json['packages_id'];
    expiredPackageDate = json['expired_package_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['username'] = this.username;
    data['mobile'] = this.mobile;
    data['born_year'] = this.bornYear;
    data['role'] = this.role;
    data['user_image'] = this.userImage;
    data['zipcode'] = this.zipcode;
    data['city'] = this.city;
    data['state'] = this.state;
    data['address'] = this.address;
    data['bank_name'] = this.bankName;
    data['bank_branch'] = this.bankBranch;
    data['bank_ifsc'] = this.bankIfsc;
    data['bank_account_no'] = this.bankAccountNo;
    data['api_token'] = this.apiToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['packages_id'] = this.packagesId;
    data['expired_package_date'] = this.expiredPackageDate;
    return data;
  }
}


class Favbook {
  int? id;
  String? bookId;
  String? user;
  String? createdAt;
  String? updatedAt;

  Favbook({this.id, this.bookId, this.user, this.createdAt, this.updatedAt});

  Favbook.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookId = json['book_id'];
    user = json['user'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['book_id'] = this.bookId;
    data['user'] = this.user;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}