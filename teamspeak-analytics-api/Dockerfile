FROM microsoft/dotnet:2.1-sdk

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        git \
        jq \
        wget

COPY start.sh /opt/ts3analytics/start.sh
RUN chmod +x /opt/ts3analytics/start.sh
#variables:
#MSSQL_Server_Address
#MSSQL_Server_User
#MSSQL_Server_Password
#MSSQL_Server_Database_Name
#TS3_Address
#TS3_User
#TS3_Password
EXPOSE 80
CMD ["/opt/ts3analytics/start.sh"]