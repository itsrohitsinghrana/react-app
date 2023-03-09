# Use an official Node runtime as a parent image
FROM node:14.17-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install the dependencies in the container
RUN npm install

# Copy the rest of the application files to the container
COPY . .

# Build the production version of the application
RUN npm run build

# Set the environment variable for the production build
ENV NODE_ENV production

# Expose port 3000 for the application
EXPOSE 3000

# Start the application when the container starts
CMD ["npm", "start"]

