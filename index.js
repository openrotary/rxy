const fs = require("fs");
const _content = fs.readFileSync("./test.js", "utf8");

const content = _content.match(/(?<=\/\*\*\s)[\s\S]+?(?=\*\/)/gm);
if (!content) {
  return;
}
/**
 * 选中后去除注释中所有开头的*号
 */
const string = content
  .map((item) => {
    const md = item.match(/(?<=@md)[\s\S]+?(?=@emd)/gm);
    if (!md) {
      return "";
    }
    return md
      .map((it) =>
        it
          .replace(/\r\n/g, "\n")
          .replace(/\r/g, "\n")
          .replace(/\s\*\s/g, "")
      )
      .join("");
  })
  .join("");
// console.log(JSON.stringify(string));
console.log(string);
