const fs = require("fs");
const _content = fs.readFileSync("./test.js", "utf8");

const content = _content.match(/(?<=\/\*\*@md\s)[\s\S]+?(?=\*\/)/gm);
if (!content) {
  return;
}
/**
 * 选中后去除注释中所有开头的*号
 */
const string = content
  .map((item) =>
    item.replace(/\* \*/g, "-").replace(/ \* /g, "").replace(/\*\n/g, "\n")
  )
  .join("");
console.log(string);
