FROM microsoft/dotnet:1.0.0-rc2-core

WORKDIR /app

# Copy the app
COPY . .

# Configure the listening port to 80
ENV ASPNETCORE_URLS http://*:80
EXPOSE 80

# Start the app
ENTRYPOINT dotnet WorksOnMyMachine.dll
