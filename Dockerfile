# Use the official Node.js 18 image as the base image
FROM node:alpine

# Define a build-time variable for the port
ARG PORT

# Set an environment variable inside the container
ENV CONTAINER_PORT=${PORT}

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port the app runs on
EXPOSE ${CONTAINER_PORT}

# Start the Express app
CMD ["npm", "start"]
