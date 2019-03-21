import 'package:flutter/material.dart';

/// Main Builder signature for `TableCalendar`. Contains `date` and list of all `events` associated with that `date`.
/// Note that most of the time, `events` param will be ommited, however it is there if needed.
/// `events` param can be null.
typedef FullBuilder = Widget Function(BuildContext context, DateTime date, List events);

/// Builder signature for a single event marker. Contains `date` and a single `event` associated with that `date`.
typedef SingleMarkerBuilder = Widget Function(BuildContext context, DateTime date, dynamic event);

/// Class containing all custom Builders for `TableCalendar`.
class CalendarBuilders {
  /// The most general custom Builder. Use to provide your own UI for every day cell.
  /// If `dayBuilder` is not specified, a default day cell will be displayed.
  /// Default day cells are customizable with `CalendarStyle`.
  final FullBuilder dayBuilder;

  /// Custom Builder for currently selected day. Will overwrite `dayBuilder` on selected day.
  final FullBuilder selectedDayBuilder;

  /// Custom Builder for today. Will overwrite `dayBuilder` on today.
  final FullBuilder todayDayBuilder;

  /// Custom Builder for weekends. Will overwrite `dayBuilder` on weekends.
  final FullBuilder weekendDayBuilder;

  /// Custom Builder for days outside of current month. Will overwrite `dayBuilder` on days outside of current month.
  final FullBuilder outsideDayBuilder;

  /// Custom Builder for weekends outside of current month. Will overwrite `dayBuilder`on weekends outside of current month.
  final FullBuilder outsideWeekendDayBuilder;

  /// Custom Builder for a whole group of event markers. Use to provide your own marker UI (eg. a number of events) for each day cell.
  /// This will be displayed above of the day cell - wrap with `Positioned` widget to gain more control over its position.
  ///
  /// If `markersBuilder` is not specified, `TableCalendar` will try to use `singleMarkerBuilder` or default markers (customizable with `CalendarStyle`).
  /// Mutually exclusive with `singleMarkerBuilder`.
  final FullBuilder markersBuilder;

  /// Custom Builder for a single event marker. Each of those will be displayed in a `Row` above of the day cell.
  /// You can adjust markers position with `CalendarStyle` properties.
  ///
  /// If `singleMarkerBuilder` is not specified, a default event marker will be displayed (customizable with `CalendarStyle`).
  /// Mutually exclusive with `markersBuilder`.
  final SingleMarkerBuilder singleMarkerBuilder;

  const CalendarBuilders({
    this.dayBuilder,
    this.selectedDayBuilder,
    this.todayDayBuilder,
    this.weekendDayBuilder,
    this.outsideDayBuilder,
    this.outsideWeekendDayBuilder,
    this.markersBuilder,
    this.singleMarkerBuilder,
  }) : assert(!(singleMarkerBuilder != null && markersBuilder != null));
}