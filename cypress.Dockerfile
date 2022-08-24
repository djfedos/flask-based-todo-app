FROM cypress/included:10.6.0

WORKDIR /e2e

COPY cypress.config.js cypress.config.js
COPY cypress cypress


