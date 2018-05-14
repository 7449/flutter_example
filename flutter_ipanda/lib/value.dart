import 'package:flutter/material.dart';

const title = "iPanda";
const tabs = ["首页", "熊猫直播", "滚滚视频", "熊猫播报", "直播中国"];
const tabUrl = [
  "http://www.ipanda.com/kehuduan/shouye/index.json",
  "http://www.ipanda.com/kehuduan/PAGE14501772263221982/index.json",
  "http://www.ipanda.com/kehuduan/video/index.json",
  "http://www.ipanda.com/kehuduan/news/index.json",
  "http://www.ipanda.com/kehuduan/PAGE14501775094142282/index.json"
];

IconData bottomIcon(int index) {
  switch (index) {
    case 0:
      return Icons.home;
    case 1:
      return Icons.video_call;
    case 2:
      return Icons.video_library;
    case 3:
      return Icons.text_format;
    case 4:
      return Icons.closed_caption;
  }
  return Icons.home;
}
