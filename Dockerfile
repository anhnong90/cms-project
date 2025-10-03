FROM ghost:latest

WORKDIR /var/lib/ghost

COPY ./content ./content

EXPOSE 2368

CMD ["node", "current/index.js"]
