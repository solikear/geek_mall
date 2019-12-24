import 'dart:convert' show json;

class Root {
  String id;
  String username;
  String password;
  Object email;
  Object code;
  String mobile;
  Object lastPasswordResetDate;
  String type;
  String status;
  String certcode;
  String name;
  Object banner;
  String avatar;
  Object nickname;
  Object sex;
  Object birthday;
  String districtid;
  String address;
  Object postcode;
  String ctime;
  Object verifycode;
  Object verifysendtime;
  Object verifiedtime;
  String qqopenid;
  String wxopenid;
  Object admin;
  List<Object> roles;
  List<Object> configs;
  List<String> history;
  Object codesafe;
  List<Object> receiptList;

    Root({
this.id,
this.username,
this.password,
this.email,
this.code,
this.mobile,
this.lastPasswordResetDate,
this.type,
this.status,
this.certcode,
this.name,
this.banner,
this.avatar,
this.nickname,
this.sex,
this.birthday,
this.districtid,
this.address,
this.postcode,
this.ctime,
this.verifycode,
this.verifysendtime,
this.verifiedtime,
this.qqopenid,
this.wxopenid,
this.admin,
this.roles,
this.configs,
this.history,
this.codesafe,
this.receiptList,
    });


  factory Root.fromJson(jsonRes){ if(jsonRes == null) return null;
    List<Object> roles = jsonRes['roles'] is List ? []: null; 
    if(roles!=null) {
 for (var item in jsonRes['roles']) { if (item != null) { roles.add(item);  }
    }
    }


    List<Object> configs = jsonRes['configs'] is List ? []: null; 
    if(configs!=null) {
 for (var item in jsonRes['configs']) { if (item != null) { configs.add(item);  }
    }
    }


    List<String> history = jsonRes['history'] is List ? []: null; 
    if(history!=null) {
 for (var item in jsonRes['history']) { if (item != null) { history.add(item);  }
    }
    }


    List<Object> receiptList = jsonRes['receiptList'] is List ? []: null; 
    if(receiptList!=null) {
 for (var item in jsonRes['receiptList']) { if (item != null) { receiptList.add(item);  }
    }
    }


return Root(    id : jsonRes['id'],
    username : jsonRes['username'],
    password : jsonRes['password'],
    email : jsonRes['email'],
    code : jsonRes['code'],
    mobile : jsonRes['mobile'],
    lastPasswordResetDate : jsonRes['lastPasswordResetDate'],
    type : jsonRes['type'],
    status : jsonRes['status'],
    certcode : jsonRes['certcode'],
    name : jsonRes['name'],
    banner : jsonRes['banner'],
    avatar : jsonRes['avatar'],
    nickname : jsonRes['nickname'],
    sex : jsonRes['sex'],
    birthday : jsonRes['birthday'],
    districtid : jsonRes['districtid'],
    address : jsonRes['address'],
    postcode : jsonRes['postcode'],
    ctime : jsonRes['ctime'],
    verifycode : jsonRes['verifycode'],
    verifysendtime : jsonRes['verifysendtime'],
    verifiedtime : jsonRes['verifiedtime'],
    qqopenid : jsonRes['qqopenid'],
    wxopenid : jsonRes['wxopenid'],
    admin : jsonRes['admin'],
 roles:roles,
 configs:configs,
 history:history,
    codesafe : jsonRes['codesafe'],
 receiptList:receiptList,
);}
  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'password': password,
        'email': email,
        'code': code,
        'mobile': mobile,
        'lastPasswordResetDate': lastPasswordResetDate,
        'type': type,
        'status': status,
        'certcode': certcode,
        'name': name,
        'banner': banner,
        'avatar': avatar,
        'nickname': nickname,
        'sex': sex,
        'birthday': birthday,
        'districtid': districtid,
        'address': address,
        'postcode': postcode,
        'ctime': ctime,
        'verifycode': verifycode,
        'verifysendtime': verifysendtime,
        'verifiedtime': verifiedtime,
        'qqopenid': qqopenid,
        'wxopenid': wxopenid,
        'admin': admin,
        'roles': roles,
        'configs': configs,
        'history': history,
        'codesafe': codesafe,
        'receiptList': receiptList,
};

  @override
String  toString() {
    return json.encode(this);
  }
}

