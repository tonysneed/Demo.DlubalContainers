FROM mcr.microsoft.com/dotnet/framework/sdk:4.8 AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY DlubalContainerTest/*.csproj ./DlubalContainerTest/
RUN dotnet restore

# copy and build everything else
COPY . .
WORKDIR /app/DlubalContainerTest
RUN dotnet publish -c Release -o out


FROM mcr.microsoft.com/dotnet/framework/runtime:4.8-windowsservercore-ltsc2019 AS runtime
WORKDIR /app
COPY --from=build /app/DlubalContainerTest/out ./
ENTRYPOINT ["DlubalContainerTest.exe"]

# docker build -t dlubal-test .
# docker run dlubal-test
