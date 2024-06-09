class ApiConstant {
  // static const rootUrl = 'http://192.168.1.16:8000';
  static const rootUrl = 'https://doctor.emcindore.in';
  static const baseUrl = '$rootUrl/api/patient';
  static const login = '$baseUrl/login/';
  static const moodReport = '$baseUrl/mood-report/';
  static const weekMoodReport = '$baseUrl/mood-report/lastweek/';
  static const audioList = '$baseUrl/list-sounds/';
  static const profileinfo = '$baseUrl/profile-info/';
  static const listCalender = '$baseUrl/list-calendar/';
  static const listNote = '$baseUrl/list-notes/';
  static const createNote = '$baseUrl/create-notes/';
  static const listMood = '$baseUrl/list-moods/';
  static const createMood = '$baseUrl/create-moods/';
  static const prescriptionAnalytics = '$baseUrl/prescription-analytics/';
  static const addPatient = '$baseUrl/create-patient/';
  static const getPower = '$baseUrl/list-create-power/';
  static const getfrequnecy = '$baseUrl/list-create-frequency/';
  static const getInstruction = '$baseUrl/list-create-instruction/';
  static const createPrescription = '$baseUrl/create-prescription/';
  static const markTakenOrNot = '$baseUrl/calendar/update/';
  static const bookAppointment = '$baseUrl/book-appointment/';
  static const listAppointment = '$baseUrl/list-appointment/';
  static const bookedDatesAndTime = '$baseUrl/list-booked-appointment/';
  static const docAvailableDate = '$rootUrl/api/doctor/toggle-availability/';
}
