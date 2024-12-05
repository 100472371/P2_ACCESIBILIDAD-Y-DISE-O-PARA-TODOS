import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? calendarfunction(DateTime? fechaActual) {
  // If the selected date, and therefore the one saved in that variable, is earlier than today, a message should appear on the screen indicating that this date cannot be selected because it is before today.
  if (fechaActual != null) {
    if (fechaActual.isBefore(DateTime.now())) {
      return 'Selected date cannot be before today';
    } else {
      return 'Date null';
    }
  }
}
