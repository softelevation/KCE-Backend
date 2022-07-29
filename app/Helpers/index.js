
exports.obj_multi_select = (obj, keys = null, status = true) => {
  // 👈 return selected field of object in case of status false function return all given filed
  // obj = dencrypted(obj.encrypt);
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

exports.check_and_return_value = (value) => {
  return this.check(value) ? value : 0;
};

exports.check = (obj) => {
  // 👈 check string is valid or not
  if (obj && obj !== null && obj !== undefined && obj !== '' && obj !== false) {
    return true;
  } else {
    return false;
  }
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

exports.filter_by_id = (target, input) => {
  // 👈 return single value in array format from multidimensional array
  let return_object = [];
  if (this.check_array_length(target)) {
    return_object = target.map(function (key) {
      return key[input];
    });
  }
  return return_object;
};
