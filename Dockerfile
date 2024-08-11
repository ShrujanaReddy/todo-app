# Dockerfile
FROM node:14

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Set environment variables
ENV DB_HOST=127.0.0.1
ENV DB_USERNAME=postgres
ENV DB_PASSWORD=shrujana
ENV DB_DATABASE=wd-todo-test
ENV DB_DIALECT=postgres

# Command to run tests
CMD ["npm", "test"]
