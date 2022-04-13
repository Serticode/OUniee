class StaffLevelController {
  static late final String currentStaffLevel;
  static late final String availablePositions;

  static final List<String> tableTitles = [
    "Staff name",
    "ID",
    "Email",
    "Department",
    "Qualification",
    "Experience",
    "Publications",
    "Applied for",
    "Cover letter",
    "Criteria met",
    "Attachment",
    "Approve\nor Decline",
  ];

  static final List<String> attainableStaffLevels = [
    "Assistant Lecturer",
    "Lecturer 1",
    "Lecturer 2",
    "Senior Lecturer",
    "Assistant Professor",
    "Professor"
  ];

  static final List<int> numberOfExpectedStaffPublications = [
    5,
    10,
    15,
    15,
    20,
    20
  ];

  static final List<int> numberOfExpectedExperienceYears = [2, 5, 5, 7, 9, 10];

  static final List<int> expectedLeadershipSkillRating = [4, 6, 7, 7, 8, 10];

  static final List<String> criteria = [
    "2 years Experience, 5 Publications",
    "5 years Experience, 10 Publications",
    "5 years Experience, 15 Publications",
    "7 years Experience, 15 Publications",
    "9 years Experience, 20 Publications",
    "10 years Experience, 20 Publications"
  ];

  static List<String> availableCriteria(
      {required String theCurrentStaffLevel}) {
    List<String> criteriaAvailable = [];

    //! FIND POSITION OF STAFF LEVEL IN AVAILABLE STAFF LEVELS
    int _levelPosition = attainableStaffLevels.indexOf(theCurrentStaffLevel);

    //! MATCH STAFF LEVEL WITH CRITERIA
    criteriaAvailable.addAll(
        criteria.getRange(++_levelPosition, attainableStaffLevels.length));

    return criteriaAvailable;
  }

  static List<String> availablePositionDecider(
      {required String theCurrentStaffLevel}) {
    List<String> remainingAvailablePositions = [];

    //! FIND POSITION OF STAFF LEVEL IN AVAILABLE STAFF LEVELS
    int _levelPosition = attainableStaffLevels.indexOf(theCurrentStaffLevel);

    remainingAvailablePositions.addAll(attainableStaffLevels.getRange(
        ++_levelPosition, attainableStaffLevels.length));

    return remainingAvailablePositions;
  }
}
