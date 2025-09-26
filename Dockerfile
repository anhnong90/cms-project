FROM ghost:latest

# Set the working directory
WORKDIR /var/lib/ghost

# Copy custom content (e.g. themes or config, if any)
COPY ./content ./content

# Set the site URL (replace with your Render domain)
ENV url=https://cms-project.onrender.com


# Expose the Ghost port
EXPOSE 2368

# Start Ghost
CMD ["node", "current/index.js"]
