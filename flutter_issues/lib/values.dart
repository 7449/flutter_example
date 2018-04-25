const drawerTabs = [
  'tab1',
  'tab2',
  'tab3',
  'tab4',
];
const tab1 = [
  '一',
  '二',
  '三',
  '四',
];
const tab2 = [
  'one',
  'two',
  'three',
  'four',
];
const tab3 = [
  '五',
  '六',
  '七',
  '八',
];
const tab4 = [
  '1',
  '2',
  '3',
  '4',
];

getTabLength(index) {
  switch (index) {
    case 0:
      return tab1.length;
    case 1:
      return tab2.length;
    case 2:
      return tab3.length;
    case 3:
      return tab4.length;
  }
}

// ignore: missing_return
List getTabTitle(index) {
  switch (index) {
    case 0:
      return tab1;
    case 1:
      return tab2;
    case 2:
      return tab3;
    case 3:
      return tab4;
  }
}
