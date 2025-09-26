FROM ghost:latest

# Set the working directory
WORKDIR /var/lib/ghost

# Copy custom content (e.g. themes or config, if any)
COPY ./content ./content

# Force Ghost to use SQLite
ENV database__client=sqlite3
ENV database__connection__filename=/var/lib/ghost/content/data/ghost-local.db

# Set the site URL (replace with your Render domain)
ENV url=https://cms-project-1.onrender.com

# Expose the Ghost port
EXPOSE 2368

# Start Ghost
CMD ["node", "current/index.js"]
