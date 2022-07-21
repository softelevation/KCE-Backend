
exports.isNumber = (n) => {
  return /^-?[\d.]+(?:e-?\d+)?$/.test(n);
};

exports.check = (obj) => {
  // 👈 check string is valid or not
  if (obj && obj !== null && obj !== undefined && obj !== '' && obj !== false) {
    return true;
  } else {
    return false;
  }
};

exports.check_val_in_array = (myArray, key, value) => {
  return myArray.some((e) => e[key] == value) ? true : false;
};

exports.check_and_return_value = (value) => {
  return this.check(value) ? value : 0;
};

exports.check_array_length = (array, num = false) => {
  // 👈 check array lenth and min length of array
  if (Array.isArray(array)) {
    if (!num) {
      return array.length ? true : false;
    } else {
      return array.length && array.length >= num ? true : false;
    }
  } else {
    return false;
  }
};

exports.check_obj = (myObj, key = null) => {
  // 👈 check object is valid and check key is exit in object
  try {
    if (
      (myObj &&
        Object.keys(myObj).length === 0 &&
        Object.getPrototypeOf(myObj) === Object.prototype) ||
      Array.isArray(myObj)
    ) {
      return false;
    } else {
      if (key) {
        return myObj[key] && myObj[key] !== undefined ? true : false;
      } else {
        return myObj === null || typeof myObj !== 'object' ? false : true;
      }
    }
  } catch (err) {
    return false;
  }
};

exports.check_isString = (value) => {
  if (this.check(value) && typeof value === 'string') {
    return true;
  } else {
    return false;
  }
};

exports.check_isNumber = (value) => {
  if (this.check(value) && typeof value === 'number') {
    return true;
  } else {
    return false;
  }
};

exports.obj_multi_select = (obj, keys = null, status = true) => {
  let return_obj = {};
  if (this.check_array_length(keys)) {
    for (let k = 0; k < keys.length; k++) {
      if (status) {
        if (this.check(obj[keys[k]])) {
          return_obj[keys[k]] = obj[keys[k]];
        }
      } else {
        if (this.check(obj[keys[k]])) {
          return_obj[keys[k]] = obj[keys[k]];
        } else {
          return_obj[keys[k]] = '';
        }
      }
    }
  } else {
    return_obj = obj;
  }
  return return_obj;
};


