FROM --platform=$BUILDPLATFORM node:lts-alpine as base

WORKDIR /app
COPY package.json /
EXPOSE 5000

FROM base as production  
ENV NODE_ENV=production  
RUN npm install  
COPY . /app  
CMD node index.js  
  
FROM base as dev  
ENV NODE_ENV=development  
RUN npm install -g nodemon && npm install  
COPY . /app  
CMD npm run start
# # Download dependencies as a separate step to take advantage of Docker's caching.
# # Leverage a cache mount to /root/.npm to speed up subsequent builds.
# # Leverage a bind mounts to package.json and package-lock.json to avoid having to copy them into
# # into this layer.
# RUN --mount=type=bind,source=package.json,target=package.json \
#     --mount=type=bind,source=package-lock.json,target=package-lock.json \
#     --mount=type=cache,target=/root/.npm \
#     npm ci --omit=dev

# # Run the application as a non-root user.
# USER node

# # Copy the rest of the source files into the image.
# COPY . .

# # Expose the port that the application listens on.
# EXPOSE 5000

# # Run the application.
# CMD npm start
