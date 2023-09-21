from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
    max_age=3600,
    expose_headers=["X-Custom-Server-Header"],
)

@app.get("/trip")
async def main():
    return [
        {
            "id": "0154a5fc-bf09-4e9a-92a3-0f410f7a46bf",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:28:18.383832",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "0177d7ef-ff30-4936-9adc-94f201c5b848",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:31:53.207720",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "0412b5fb-f21c-4325-8920-7b291db2c60f",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:22:18.371324",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "0849a613-38ed-4939-9a43-2f1bdde1ad93",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:40:33.228004",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "0d6375ad-8d37-44f3-89fe-1b9804d92ba8",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:25:58.375682",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "0f8714fe-102e-4116-a69f-e56eb537afe2",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:23:08.372599",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "1355f126-6c10-4d3f-89fa-14de540a5c89",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:42:34.130003",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "15cffda7-45c4-452b-9b8a-1aa4c756207f",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:34:53.212530",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "163da60c-2c16-4776-9310-a683ab37484a",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:27:28.380527",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "164cdf72-9e6e-4f65-b6ae-27ac1e83f6d6",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:40:53.224269",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "1693201f-3a2b-44ea-a457-28a0b39b540b",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:23:38.372128",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "1845ecfc-21b0-4526-8298-8e7d489cc595",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:35:53.210188",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "1943784f-1a88-4d3c-a88d-53c1e6e2af0c",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:36:13.217741",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "1d460a36-2db6-40ea-9983-eba00f57b5e2",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:40:23.222423",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "20e88fae-f3fd-4a17-8187-d9b1610d0fb9",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:34:13.213268",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "2100991c-38d6-4f44-b546-967a1d2a5a7f",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:36:53.214878",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "23e98e55-1d07-41f1-bcff-cfdb61b53467",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:34:33.218084",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "24ac1b88-9e5a-4509-aade-d58a1bcd9802",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:36:33.219882",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "24befcf9-63c7-4add-820b-052be7474fd9",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:39:53.217887",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "26f01594-ce4b-4e86-a5b9-0db6066c8402",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:43:04.116847",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "29b3a776-563a-40be-aa2f-0b0364f8bf54",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:39:03.224769",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "2b59f92b-12d8-4b70-8ddd-28fca9869c3b",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:36:23.215115",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "2d1ea6a3-b60f-4d07-b637-fd0690729096",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:30:43.207023",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "2d6c196c-67ff-4897-aa32-34c5fc0dfde3",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:30:23.208164",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "2d7deed3-2d4b-4ad4-ae42-690a9530a52b",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:37:23.218637",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "315f3546-65a1-4bd7-a590-d93a5d772498",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:41:53.225481",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "3357a025-8567-4c21-b5d2-d4befbbca729",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:32:33.208514",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "335fe1a5-a8af-4c91-8c7e-0bfe3b6ef9f7",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:32:03.211038",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "338c1d90-6f8f-4674-8f30-50a5a31221a0",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:33:03.208735",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "384a7407-5744-4be6-9e20-68e8c1da1970",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": None,
            "progressData": [
            {
                "progressTime": "2023-08-27T22:22:18.371324",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "38a9138e-d701-4e63-85ad-caf407cbf6f2",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:38:43.247241",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "3d6caa96-24f8-435b-a5dc-ac54e56ae48b",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:27:48.386263",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "3f57cf22-65b7-4aa3-9c8f-14778cb0b2c0",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:40:03.229432",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "4166556b-afc9-4068-a229-4a924771fcef",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:28:48.382693",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "42ac6339-a3ee-4231-bb03-cd7a49e6151d",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:36:43.212868",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "47c6aa90-4da5-4cdc-982d-7719015f3fff",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:38:23.221611",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "4b23b647-cbad-4c41-bfa7-86f281d06053",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:34:23.214296",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "4b9af2a5-b7da-4365-b883-052817566a3b",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:29:53.200831",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "4c025a0a-0177-42c2-be80-0b307d99a103",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:37:03.213921",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "4ca82652-893e-4096-9408-0eb7f62f9d01",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:28:28.379197",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "4e56a1cf-35fc-416c-bf54-34a0ff2f1808",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:30:53.209920",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "5232a897-04bb-4df5-8c5c-789ae3743480",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:38:53.225238",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "526be2e9-e7c6-4681-9f96-d165a8f3ee78",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:29:08.381475",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "5474747c-7b69-4187-a9d0-8ccfc324a162",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:34:43.210555",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "54d9e350-0510-494b-8ebd-98deb56eff61",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:24:48.375941",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "55925015-a5ea-4ec0-a3df-430b60425222",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:32:13.207293",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "5691a227-61bf-4df2-8ce4-10a1876e9c58",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:33:53.206655",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "57f5770b-b694-471f-86d8-e6607779f084",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:27:58.381372",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "5aa93306-f363-4f62-9476-a66473014bab",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T23:11:06.784984",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "5cb31f38-f5b9-4e7b-8118-2c44450c493c",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:31:03.205312",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "646e8724-ae01-4d2c-b53f-33ccc7db0041",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:39:33.243905",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "65c8770c-bf4a-4c1c-97fc-728d804cfd55",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:40:13.241487",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "6c17774b-b8e5-4d18-aa9d-3686f854c1e2",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:27:18.378360",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "6e739ae1-1d43-4a81-ae2b-b05b69d40db7",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:35:03.212851",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "6ef71c5d-7f3f-4648-b4aa-0da4a8243a64",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:24:38.377542",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "703e20d5-4cf9-4e16-8c51-dcc1224bb72b",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:31:13.209280",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "705bb985-caa1-4858-a606-5cdcb405dc50",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:32:53.214712",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "7346bff0-47de-41b1-a06a-9dbad67af481",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:26:18.384092",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "779a4247-7299-4cc2-bc2d-b0d5f08bf717",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:35:33.211472",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "7b20d55c-f956-4d87-b31b-eefad62c6c43",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:25:18.380241",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "835cfd00-6dd6-4256-9edf-62f7a3cffee4",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:39:43.220103",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "86dae552-b237-4cd8-9bb7-9c10951a42e4",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:42:44.122553",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "8c888bbb-b71c-4861-8e58-a0f2d7d4e6d8",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:35:43.213969",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "9081493d-b012-4f8b-afe7-d6b39186d1cc",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:24:18.380810",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "90c82207-ab76-4a26-9703-91bd14dceccd",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:28:08.381762",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "91a9fe9a-6f15-4a75-878d-cd52ef1d5b31",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:33:13.207289",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "91f491e5-63a7-4ae6-adff-536a31a60adf",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:39:23.231318",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "94510157-3d6d-4fb0-9534-4f24a3253fe6",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:33:43.211410",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "96706711-cc23-4b58-b006-ea0fb7132012",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:35:13.211946",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "98e6f563-60bd-4dfc-8adc-475f1ce04ce2",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:38:13.223163",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "9c23744f-a231-4c72-a9b9-3a0cb952a92c",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": None,
            "progressData": [
            {
                "progressTime": "2023-08-27T22:22:18.371324",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "9c9846e8-7fc8-465f-85b8-5d0561d8a94a",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:22:38.370421",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "9e3a139f-aeb9-4b05-af30-b970897a1e6b",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:40:43.224616",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "9ebcb8d4-41e1-4657-ab80-2429661f5ad0",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:37:33.217189",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "9f9d9495-0ab7-46ee-90f8-c348ec47aa62",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:33:23.208702",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "a27ec4a1-191e-436c-a985-43e88d2694eb",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:38:03.218250",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "a3098c45-7424-46e9-b661-8620e5a1eb98",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:24:08.373704",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "a35525e8-b289-493a-9cf2-7502e173d04d",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:31:43.205290",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "a6f39559-4a4b-45fd-9116-c4e615985e9f",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:31:33.208115",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "acdba5d2-e2d9-410f-b1fa-85fcd3cc5995",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:37:43.221603",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "ae142daa-8cbe-44d3-8ecc-3dfc31e45b07",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:25:28.378502",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "aee98a86-cc52-4408-ad8b-1a2fa8840dc7",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:30:13.203486",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "af8386a9-8232-49b6-a1f8-c839a26af9a1",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:32:43.206138",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "b185900e-c35e-4dff-b51e-46e573611ff2",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:42:54.118224",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "b8a5ae87-9468-4a68-9b51-5a86ba1214ae",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:22:58.373369",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "b9153d08-b114-40b9-ad77-9cc6f428b664",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:37:13.216950",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "bbb91ba8-84e5-482d-8986-c6d125912062",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:27:38.383193",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "beb2a536-aaa1-472d-8462-9b6e0ad0651c",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:41:23.222680",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "c0786cb8-289c-40b3-9a8e-0c95296ce61e",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:31:23.205543",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "c195be93-381f-44f2-9b67-a8815037dda4",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:41:13.229606",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "c2e0887b-4d54-4659-ab09-966ee75419bf",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:23:48.371977",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "c392e26f-9da1-4563-8b22-18bf6804890d",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:28:38.398717",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "c5500880-8f9c-4d81-87b7-0b5e7876da96",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:32:23.203595",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "c5ca5611-d052-40bf-ba37-20df59b51a4a",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:34:03.208528",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "c705eb13-b634-4f0b-8873-ff892d653635",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:26:48.385483",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "c76315e3-9556-43ec-9b42-0210fb607ce9",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:26:08.375909",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "c8aafba3-57b9-4be3-b4f0-01340ac76f26",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:23:58.376403",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "c8dedb0d-4de9-4fdd-b207-1c4c9d1921b2",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:25:48.384821",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "c9f78493-d554-4f3a-a268-b6fcdc7c9bfa",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:26:28.382561",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "cb4f9c61-b503-4a1d-8ee3-446917695c5b",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:37:53.215769",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "cf5f17ee-db53-4029-ae3a-d08ebc05e5a6",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:29:43.211475",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "cfed7cf4-233b-4970-865c-37f1a429ba25",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:22:28.380012",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "d0d5aa81-2468-44b8-bf52-9fe91771f75f",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:41:03.223688",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "d25d89a4-89f9-4429-8fce-bb8dd43bcc3b",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:38:33.220067",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "d4ee53fc-1af1-4e56-bbdd-739b04af887e",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:30:03.201287",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "d7013939-72e3-4a98-8702-715b17b23760",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:28:58.383684",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "d7ba3e90-e5dd-42ff-a36f-4ef49b71d313",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:23:28.373459",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "d88ac3c6-93cd-4faf-92d7-f535c8768a28",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:26:58.392207",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "da09fd03-3c2f-47e5-b08a-ead1644ef9e8",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:22:48.373647",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "dabc28e8-346d-495e-8d95-ddb9466d86d7",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:26:38.381821",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "e25770df-262b-44ee-b6ab-9cfa4c100ee3",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:35:23.213726",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "e95e2822-5cec-4941-8ea8-38119c13703a",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:41:43.219274",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "eecf7f7d-7fb2-4ef0-8493-091dfd6a1777",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:41:33.224047",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "f02c2a1f-40f8-4e92-86b5-8f5efaa3e019",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:25:08.377749",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "f29f1afa-9a73-4602-b47d-e55ed6ea9641",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:24:28.373147",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "f3f1d491-8fa5-4edd-969f-01aa91bb6901",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:39:13.223183",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "f4c25477-0863-4b5f-a41b-ab9d75974f19",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:25:38.377773",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "f6341d48-062a-44ed-a7fe-aa7802634c2f",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:24:58.377588",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "f767ea17-6f5a-4f9c-87cb-d2f7c15639ed",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:33:33.208381",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "f804fb64-c328-4c92-81a6-ecb38a13716e",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:16.757530",
            "progressData": [
            {
                "progressTime": "2023-08-27T23:11:16.745283",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "f9136f93-bc3c-4861-984c-074ddb570a7f",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:27:08.384723",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "f9474763-0872-4c5a-b918-d2503ce50f21",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:30:33.206624",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "f9ea1342-8588-4b75-ae6e-2d0c576ae201",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:23:18.373111",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        },
        {
            "id": "fb79cc8f-e19a-4aaf-a8dd-72ea4623cb5e",
            "tripId": "52ecddb0-a128-423e-aa54-390e85adf83e",
            "progressReportedTime": "2023-08-27T23:11:06.802406",
            "progressData": [
            {
                "progressTime": "2023-08-27T22:36:03.221623",
                "location": {
                "latitude": 37.785835,
                "longitude": -122.40642
                }
            }
            ],
            "matchedPoiId": None,
            "userId": "rajan123"
        }
]