#!/bin/bash
repoUrl="https://github.com/TeamspeakAnalytics/hosting-and-backend.git"
folder="serverFiles"
csproj="TeamspeakAnalytics.hosting.csproj"
appsettings="appsettings.json"
mssqlServerIp=$(getent hosts $MSSQL_Server_Address | awk '{ print $1 }')
connstr="Server=$mssqlServerIp;Database=$MSSQL_Server_Database_Name;User Id=$MSSQL_Server_User;Password=$MSSQL_Server_Password;"
tsServerIp=$(getent hosts $TS3_Address | awk '{ print $1 }')

if [ ! -d $folder ] ; then
    echo "Downloading repo from $repoUrl"
    git clone $repoUrl $folder
    echo "Downloaded repo"
else
    cd $folder
    git reset --hard
    cd ..
fi

echo "Checking conecctivity to github"
cd $folder
wget -q --spider https://github.com
if [ $? -eq 0 ]; then
    echo "Getting latest version"
    git pull
else
    echo "No connection to github possible"
    echo "Working with cached version"
fi

cd src/TeamspeakAnalytics.hosting
sed -r ':a; s%(.*)/\*.*\*/%\1%; ta; /\/\*/ !b; N; ba' appsettings.json > _tmp.json && mv _tmp.json appsettings.json
jq ".ConnectionStrings.ServiceDatabase = \"$connstr\"" appsettings.json > _tmp.json && mv _tmp.json appsettings.json
jq ".ServiceConfiguration.Port = 80" appsettings.json > _tmp.json && mv _tmp.json appsettings.json
jq ".TeamspeakConfiguration.QueryHostname = \"$tsServerIp\"" appsettings.json > _tmp.json && mv _tmp.json appsettings.json
jq ".TeamspeakConfiguration.QueryUser = \"$TS3_User\"" appsettings.json > _tmp.json && mv _tmp.json appsettings.json
jq ".TeamspeakConfiguration.QueryPassword = \"$TS3_Password\"" appsettings.json > _tmp.json && mv _tmp.json appsettings.json
echo "MSSQL conn str = $connstr"

dotnet run $csproj
