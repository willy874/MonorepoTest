module.exports = {
  env: {
    browser: true,
    node: true,
    "jest/globals": true,
  },
  plugins: ["prettier", "@typescript-eslint"],
  extends: ["standard", "prettier"],
  parser: "@typescript-eslint/parser",
  parserOptions: {
    ecmaVersion: "latest",
    sourceType: "module",
  },
  rules: {},
};
