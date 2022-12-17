class ConstantVariable {
  static const pathImg = "assets/images/";
  static const listOfImage = [
    "${pathImg}cv_img_1.jpg",
    "${pathImg}cv_img_2.png",
    "${pathImg}cv_img_3.jpg",
    "${pathImg}cv_img_4.jpg",
    "${pathImg}cv_img_5.png",
    "${pathImg}cv_img_2.png",
  ];

  static const topics = [
    "Info",
    "Contact",
    "Education",
    "Experience",
    "Skill",
    "Summary"
  ];

  static RegExp regExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

}