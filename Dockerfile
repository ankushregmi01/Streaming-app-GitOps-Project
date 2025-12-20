FROM node:alpine

# Create a non-root user and group
RUN addgroup -S nodejs && adduser -S nodejs -G nodejs 

WORKDIR /app 

COPY package*.json .

RUN npm install

COPY . .
# Give ownership of the working directory to the non-root user
RUN chown -R nodejs:nodejs /app

USER nodejs

EXPOSE 3000

CMD ["npm", "start"]