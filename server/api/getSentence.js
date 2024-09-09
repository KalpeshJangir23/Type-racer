const axios = require("axios");

const getSentence = async () => {
  const dataVal = await axios.get("https://api.quotable.io/random");
  return dataVal.data.content.split(" ");
};
module.exports = getSentence;
 