FROM mcr.microsoft.com/dotnet/sdk:10.0 as build
WORKDIR /src
COPY . .
RUN dotnet publish src/Api -c Release -o /app

FROM mcr.microsoft.com/dotnet/sdk:10.0
WORKDIR /app
COPY --from=build /app
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080
ENTRYPOINT ["dotnet", "Api.dll"]