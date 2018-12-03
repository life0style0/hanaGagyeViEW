/**
 * 유효성 검증을 위한 자바스크립트 파일
 */

/**
 * 숫자 형식 체크
 * @param {*} value 체크할 숫자 값
 * @param {*} minNumber 최소 숫자 길이
 * @param {*} maxNumber 최대 숫자 길이
 */
function isValidIntJjw(value, minNumber, maxNumber) { // eslint-disable-line no-unused-vars
  const replace = `^\\d{${minNumber},${maxNumber}}$`;
  const regex = new RegExp(replace, "g");
  return regex.test(value);
}

/**
 * 소수점 숫자 형식 체크
 * @param {*} value 체크할 숫자 값
 * @param {*} maxFloat 소수점 몇째 자리까지 체크할 지
 */
function isValidFloatJjw(value, maxFloat) { // eslint-disable-line no-unused-vars
  const replace = `^\\d+(?:[.]?[\\d]{1,${maxFloat}})?$`;
  const regex = new RegExp(replace, "g");
  return regex.test(value);
}
