# Combine data files into one
mv ./questList.csv ../../questList.csv
# Wait for the SQL Server to come up
sleep 20s
# Run the setup script to create the DB, schema, and import data
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Password1!" -i setup.sql