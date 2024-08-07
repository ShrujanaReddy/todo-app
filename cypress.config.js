const { defineConfig } = require('cypress');

module.exports = defineConfig({
  e2e: {
    setupNodeEvents(on, config) {
      // Implement node event listeners here
      // Comment out or remove the following lines if not needed
      // require("cypress-json-results")({
      //   on,
      //   filename: "results.json",
      // });
    },
    supportFile: "cypress/support/e2e.js", // Ensure this path is correct
  },
});
