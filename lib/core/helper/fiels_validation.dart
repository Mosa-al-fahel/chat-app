String? fieldValidation(String value, int maxLingth, int minLingth) {
  {
    if (value.isEmpty) {
      return 'this field cannot be empty';
    }
    if (value.length < minLingth) {
      return 'this field requires At least $minLingth element';
    }
    if (value.length > maxLingth) {
      return 'this field cannot be more the $maxLingth letter';
    }
    return null;
  }
}
