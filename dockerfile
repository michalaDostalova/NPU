# Use the official Node.js image as the base
FROM mcr.microsoft.com/playwright:v1.37.0-focal

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

RUN npx playwright install-deps


RUN apt-get update && apt-get install -y \
    libgstreamer1.0-0 \
    libgtk-4-1 \
    libgraphene-1.0-0 \
    libwoff1 \
    libvpx7 \
    libopus0 \
    libgstallocators-1.0-0 \
    libgstapp-1.0-0 \
    libgstbase-1.0-0 \
    libgstpbutils-1.0-0 \
    libgstaudio-1.0-0 \
    libgsttag-1.0-0 \
    libgstvideo-1.0-0 \
    libgstgl-1.0-0 \
    libgstcodecparsers-1.0-0 \
    libgstfft-1.0-0 \
    libflite1 \
    libflite-usenglish1 \
    libflite-cmu-grapheme-lang1 \
    libflite-cmu-grapheme-lex1 \
    libflite-cmu-indic-lang1 \
    libflite-cmu-indic-lex1 \
    libflite-cmulex1 \
    libflite-cmu-time-awb1 \
    libflite-cmu-us-awb1 \
    libflite-cmu-us-kal16-1 \
    libflite-cmu-us-kal1 \
    libflite-cmu-us-rms1 \
    libflite-cmu-us-slt1 \
    libavif15 \
    libharfbuzz-icu0 \
    libepoxy0 \
    libenchant-2-2 \
    libsecret-1-0 \
    libhyphen0 \
    libwayland-server0 \
    libwayland-egl1 \
    libwayland-client0 \
    libmanette-0.2-0 \
    libgbm1 \
    libdrm2 \
    libatk1.0-0 \
    libxkbcommon0 \
    libatk-bridge2.0-0 \
    libgles2-mesa \
    libx264-160 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the rest of the application code
COPY . .

# Expose the port your app runs on (if applicable)
EXPOSE 4000

# Define the default command to run your app
CMD ["npx", "playwright", "test"]