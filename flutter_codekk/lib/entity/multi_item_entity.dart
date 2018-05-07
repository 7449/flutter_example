class MultiMenu {
  final SettingItem type;
  final String message;
  final String itemType;

  MultiMenu(this.type, this.message, this.itemType);
}

enum SettingItem { title, item }
