FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 5000
ENV ASPNETCORE_URLS=http://*:5000

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["src/DevOpsChallenge.SalesApi/DevOpsChallenge.SalesApi.csproj", "src/DevOpsChallenge.SalesApi/"]
COPY ["src/DevOpsChallenge.SalesApi.Business/DevOpsChallenge.SalesApi.Business.csproj", "src/DevOpsChallenge.SalesApi.Business/"]
COPY ["src/DevOpsChallenge.SalesApi.Database/DevOpsChallenge.SalesApi.Database.csproj", "src/DevOpsChallenge.SalesApi.Database/"]
RUN dotnet restore "src\DevOpsChallenge.SalesApi\DevOpsChallenge.SalesApi.csproj"
COPY . .
WORKDIR "/src/src/DevOpsChallenge.SalesApi"
RUN dotnet build "DevOpsChallenge.SalesApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "DevOpsChallenge.SalesApi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "DevOpsChallenge.SalesApi.dll"]
