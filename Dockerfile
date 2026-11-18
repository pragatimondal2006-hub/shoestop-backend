# ShopStop backend (Node.js + Express + Mongoose)
FROM node:20-slim

WORKDIR /app

# Install dependencies first so Docker can cache this layer.
COPY package.json package-lock.json ./
RUN npm ci --omit=dev || npm install --omit=dev

# Copy the rest of the source code.
COPY . .

ENV NODE_ENV=production
# The app reads a lowercase "port" variable (see server.js).
ENV port=5000
EXPOSE 5000

# Run node directly. "npm start" uses nodemon, which is a dev tool.
CMD ["node", "server.js"]
