class ExperienceModel {
  String work;
  String job;
  String period;
  String desc;
  bool isOpen;

  ExperienceModel(
      {required this.work,
      required this.job,
      required this.period,
      required this.desc,
      required this.isOpen});
  @override
  String toString() {
    return "work: $work, job: $job, period: $period, dec: $desc,isOpen:$isOpen";
    // print("work: $work, job: $job, period: $period, dec: $desc,isOpen:$isOpen");
  }
}
