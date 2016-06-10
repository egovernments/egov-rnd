###Elastic Search - Google Spreadsheet - Data Uploader
Its a simple java client application which will facilitate to fetch data from configured ElasticSearch to Google Spreadsheet. 
This application require google API OAuth 2.0 client ID to access google spreadsheet and an elasticsearch instance to start working with.

###Steps to run the application
1. Clone this project
2. Create a google spreadsheet
3. Generate OAuth 2.0 client ID using https://console.developers.google.com/apis/credentials
4. Copy generated client oauth token json file and paste it to resources folder of cloned project
5. Rename the copied file to client_secret.json
6. Update `resources\application.properties` file as per your environment 
   
   ```
   es.host=localhost             \\Elastic Search host ip
   es.port=9300                  \\Elastic Search host port
   es.cluster.name=elasticsearch \\Elastic Search cluster name
   gsshid_cmc=xyz                \\Google speadsheet id
   ```
7. Go to project root directory using terminal and type `gradle run` to run the application

NB: 
   Now this application is only capable of searching from eGov ERP application collection index.
