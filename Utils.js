module.exports = {
  stringToBytes32: Utils.stringToBytes32,
  stringFromBytes32: Utils.stringFromBytes32,

};
function Utils() {
}

Utils.stringToBytes32 = function(string) {
    if (string == null
        || string.length == 0) {
        return "0x00";
    }
    var result = new Buffer(string).toString('hex');
    if (result.length > 64) {
        console.log('Utils.stringToBytes32: string was cut to 32 bytes');
        return result.substring(0, 64);
    }
    return result;
};

Utils.stringFromBytes32 =

