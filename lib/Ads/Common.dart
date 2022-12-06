import 'package:flutter/foundation.dart';

const Map<String, String> UNIT_ID = kReleaseMode
    ? {
        // 실제 사용 ID
        'ios': 'ca-app-pub-7134346559226034~4054349011',
        'android': 'ca-app-pub-7134346559226034~4054349011',
      }
    : {
        // 테스트용 ID
        'ios': 'ca-app-pub-3940256099942544/2934735716',
        'android': 'ca-app-pub-3940256099942544/6300978111',
      };
