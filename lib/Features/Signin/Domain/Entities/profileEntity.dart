class Profile {
  GeneralInfo generalInfo;
  Parameters parameters;
  List<UserAsEmployer> userAsEmployer;

  Profile({this.generalInfo, this.parameters, this.userAsEmployer});

  Profile.fromJson(Map<String, dynamic> json) {
    generalInfo = json['general_info'] != null
        ? new GeneralInfo.fromJson(json['general_info'])
        : null;
    if (json['user_as_employer'] != null) {
      userAsEmployer = new List<UserAsEmployer>();
      json['user_as_employer'].forEach((v) {
        userAsEmployer.add(new UserAsEmployer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.generalInfo != null) {
      data['general_info'] = this.generalInfo.toJson();
    }
    if (this.userAsEmployer != null) {
      data['user_as_employer'] =
          this.userAsEmployer.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Parameters {
  String idUser;
  String idSession;
  String message;
  int current;

  Parameters({
    this.idUser,
    this.idSession,
    this.message,
    this.current,
  });
}

class GeneralInfo {
  String about;
  int active;
  String coverPicUrl;
  String email;
  String firstName;
  int idCoverPicture;
  int idProfilePicture;
  String lastName;
  String profilePicUrl;
  List<Skills> skills;
  String zulipApiKey;
  String zulipMail;

  GeneralInfo(
      {this.about,
      this.active,
      this.coverPicUrl,
      this.email,
      this.firstName,
      this.idCoverPicture,
      this.idProfilePicture,
      this.lastName,
      this.profilePicUrl,
      this.skills,
      this.zulipApiKey,
      this.zulipMail});

  GeneralInfo.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    active = json['active'];
    coverPicUrl = json['cover_pic_url'];
    email = json['email'];
    firstName = json['first_name'];
    idCoverPicture = json['id_cover_picture'];
    idProfilePicture = json['id_profile_picture'];
    lastName = json['last_name'];
    profilePicUrl = json['profile_pic_url'];
    if (json['skills'] != null) {
      skills = new List<Skills>();
      json['skills'].forEach((v) {
        skills.add(new Skills.fromJson(v));
      });
    }
    zulipApiKey = json['zulip_api_key'];
    zulipMail = json['zulip_mail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about'] = this.about;
    data['active'] = this.active;
    data['cover_pic_url'] = this.coverPicUrl;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['id_cover_picture'] = this.idCoverPicture;
    data['id_profile_picture'] = this.idProfilePicture;
    data['last_name'] = this.lastName;
    data['profile_pic_url'] = this.profilePicUrl;
    if (this.skills != null) {
      data['skills'] = this.skills.map((v) => v.toJson()).toList();
    }
    data['zulip_api_key'] = this.zulipApiKey;
    data['zulip_mail'] = this.zulipMail;
    return data;
  }
}

class Skills {
  int active;
  String docName;
  String docUrl;
  int id;
  int public;
  int skillId;
  String skillLabel;

  Skills(
      {this.active,
      this.docName,
      this.docUrl,
      this.id,
      this.public,
      this.skillId,
      this.skillLabel});

  Skills.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    docName = json['doc_name'];
    docUrl = json['doc_url'];
    id = json['id'];
    public = json['public'];
    skillId = json['skill_id'];
    skillLabel = json['skill_label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['doc_name'] = this.docName;
    data['doc_url'] = this.docUrl;
    data['id'] = this.id;
    data['public'] = this.public;
    data['skill_id'] = this.skillId;
    data['skill_label'] = this.skillLabel;
    return data;
  }
}

class UserAsEmployer {
  String budgetRate;
  String categorieLabel;
  List<Documents> documents;
  String hourlyRate;
  int idCategorie;
  int idProject;
  String payeLabel;
  List<QuestAns> questAns;
  List<Skills> skills;
  String statusLabel;

  UserAsEmployer(
      {this.budgetRate,
      this.categorieLabel,
      this.documents,
      this.hourlyRate,
      this.idCategorie,
      this.idProject,
      this.payeLabel,
      this.questAns,
      this.skills,
      this.statusLabel});

  UserAsEmployer.fromJson(Map<String, dynamic> json) {
    budgetRate = json['budget_rate'];
    categorieLabel = json['categorie_label'];
    if (json['documents'] != null) {
      documents = new List<Documents>();
      json['documents'].forEach((v) {
        documents.add(new Documents.fromJson(v));
      });
    }
    hourlyRate = json['hourly_rate'];
    idCategorie = json['id_categorie'];
    idProject = json['id_project'];
    payeLabel = json['paye_label'];
    if (json['quest_ans'] != null) {
      questAns = new List<QuestAns>();
      json['quest_ans'].forEach((v) {
        questAns.add(new QuestAns.fromJson(v));
      });
    }
    if (json['skills'] != null) {
      skills = new List<Skills>();
      json['skills'].forEach((v) {
        skills.add(new Skills.fromJson(v));
      });
    }
    statusLabel = json['status_label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['budget_rate'] = this.budgetRate;
    data['categorie_label'] = this.categorieLabel;
    if (this.documents != null) {
      data['documents'] = this.documents.map((v) => v.toJson()).toList();
    }
    data['hourly_rate'] = this.hourlyRate;
    data['id_categorie'] = this.idCategorie;
    data['id_project'] = this.idProject;
    data['paye_label'] = this.payeLabel;
    if (this.questAns != null) {
      data['quest_ans'] = this.questAns.map((v) => v.toJson()).toList();
    }
    if (this.skills != null) {
      data['skills'] = this.skills.map((v) => v.toJson()).toList();
    }
    data['status_label'] = this.statusLabel;
    return data;
  }
}

class Documents {
  int active;
  String docName;
  String docUrl;
  int id;
  int idDocument;
  int idProject;
  int public;

  Documents(
      {this.active,
      this.docName,
      this.docUrl,
      this.id,
      this.idDocument,
      this.idProject,
      this.public});

  Documents.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    docName = json['doc_name'];
    docUrl = json['doc_url'];
    id = json['id'];
    idDocument = json['id_document'];
    idProject = json['id_project'];
    public = json['public'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['doc_name'] = this.docName;
    data['doc_url'] = this.docUrl;
    data['id'] = this.id;
    data['id_document'] = this.idDocument;
    data['id_project'] = this.idProject;
    data['public'] = this.public;
    return data;
  }
}

class QuestAns {
  String answer;
  int answerId;
  String question;
  int questionId;

  QuestAns({this.answer, this.answerId, this.question, this.questionId});

  QuestAns.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    answerId = json['answer_id'];
    question = json['question'];
    questionId = json['question_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;
    data['answer_id'] = this.answerId;
    data['question'] = this.question;
    data['question_id'] = this.questionId;
    return data;
  }
}
