import 'data.dart';

class PickUpHabits{
  final data = [
    Data(habit: 'brush', tag: 'wakeup', repeat: Repeating.daily, dates: [DateTime.now()]),
    Data(habit: 'drinkwater', tag: 'wakeup', repeat: Repeating.daily, dates: [DateTime.now()]),
    Data(habit: 'wakeearly', tag: 'wakeup', repeat: Repeating.daily, dates: [DateTime.now()]),
    Data(habit: 'excersize', tag: 'morning', repeat: Repeating.daily, dates: [DateTime.now()]),
    Data(habit: 'read', tag: 'morning', repeat: Repeating.daily, dates: [DateTime.now()]),
    Data(habit: 'lesscaffeine', tag: 'morning', repeat: Repeating.daily, dates: [DateTime.now()]),
    Data(habit: 'eatfruits', tag: 'noon', repeat: Repeating.daily, dates: [DateTime.now()]),
    Data(habit: 'drinkwater', tag: 'noon', repeat: Repeating.daily, dates: [DateTime.now()]),
    Data(habit: 'lesscaffeine', tag: 'noon', repeat: Repeating.daily, dates: [DateTime.now()]),
    Data(habit: 'stretch', tag: 'evening', repeat: Repeating.daily, dates: [DateTime.now()]),
    Data(habit: 'read', tag: 'evening', repeat: Repeating.daily, dates: [DateTime.now()]),
    Data(habit: 'takeashower', tag: 'evening', repeat: Repeating.daily, dates: [DateTime.now()]),
    Data(habit: 'drinkwater', tag: 'beforesleep', repeat: Repeating.daily, dates: [DateTime.now()]),
    Data(habit: 'fallasleepearly', tag: 'beforesleep', repeat: Repeating.daily, dates: [DateTime.now()]),
  ];
  final List<Data> customHabitData=[
    Data(habit: 'bed', tag: 'Bed', repeat: Repeating.daily, dates: []),
    Data(habit: 'case', tag: 'Case', repeat: Repeating.daily, dates: []),
    Data(habit: 'cook', tag: 'Cook', repeat: Repeating.daily, dates: []),
    Data(habit: 'geo', tag: 'Geolocation', repeat: Repeating.daily, dates: []),
    Data(habit: 'head', tag: 'Head', repeat: Repeating.daily, dates: []),
    Data(habit: 'megaphone', tag: 'Megaphone', repeat: Repeating.daily, dates: []),
    Data(habit: 'message', tag: 'Message', repeat: Repeating.daily, dates: []),
    Data(habit: 'mirror', tag: 'Mirror', repeat: Repeating.daily, dates: []),
    Data(habit: 'note', tag: 'Note', repeat: Repeating.daily, dates: []),
    Data(habit: 'plane', tag: 'Plane', repeat: Repeating.daily, dates: []),
    Data(habit: 'roller', tag: 'Roller', repeat: Repeating.daily, dates: []),
    Data(habit: 'scooter', tag: 'Scooter', repeat: Repeating.daily, dates: []),
    Data(habit: 'sms', tag: 'SMS', repeat: Repeating.daily, dates: []),
    Data(habit: 'stairway', tag: 'StairWay', repeat: Repeating.daily, dates: []),
    Data(habit: 'wallet', tag: 'Wallet', repeat: Repeating.daily, dates: []),
  ];
}