# Use the official Node.js image as the base
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Install Playwright browsers
RUN npx playwright install

# Copy the rest of the application code
COPY . .

# Expose the port your app runs on (if applicable)
EXPOSE 3000

# Define the default command to run your app
CMD ["npm","playwright", "start"]