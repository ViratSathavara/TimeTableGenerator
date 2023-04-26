
// ################################ IMP CODE ################################
var utils = function () {
}

utils.safeValue = function (val, safeVal) {
    if (val === undefined) {
        return safeVal;
    }
    if (val === `undefined`) {
        return safeVal;
    }
    if (val === `null`) {
        return safeVal;
    }
    if (val === null) {
        return safeVal;
    }
    return val;
}

utils.safeValueStr = function (val, safeVal) {
    let _val = utils.safeValue(val, safeVal);
    if (val === '') {
        return safeVal;
    }
    if (val.trim() === '') {
        return safeVal;
    }
    return (_val).trim();
}

utils.safeValueInt = function (val, safeVal) {
    let _val = utils.safeValue(val, safeVal);
    try {
        _val = parseInt(_val);
        if (_val == NaN) {
            return safeVal;
        }
        return _val;
    } catch (e) {
        return safeVal;
    }
}
utils.safeValueFloat = function (val, safeVal) {
    let _val = utils.safeValue(val, safeVal);
    try {
        _val = parseFloat(_val);
        if (_val == NaN) {
            return safeVal;
        }
        return _val;
    } catch (e) {
        return safeVal;
    }
}
// ################################ IMP CODE ################################
