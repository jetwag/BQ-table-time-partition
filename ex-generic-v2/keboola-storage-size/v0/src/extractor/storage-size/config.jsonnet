{
  parameters: {
    api: {
      baseUrl: "https://" + Input("kbc_hostname") + "/v2/storage/tables",
    },
    config: {
      id: "kbc_storage",
      "#token": Input("kbc_storage_token"),
      debug: 1,
      incrementalOutput: true,
      userData: {
        extracted: {
          "function": "date",
          args: [
            "Y-m-d H:i:s",
            {
              "function": "strtotime",
              args: ["now"],
            },
          ],
        },
      },
      http: {
        headers: {
          Accept: "application/json",
          "X-StorageApi-Token": { attr: "#token" },
        },
      },
      jobs: [
        {
          endpoint: "tables",
          dataType: "tables",
          dataField: ".",
        },
      ],
      mapping: {
        dataSizeBytes: {
          mapping: {
            destination: "dataSizeBytes",
          },
        },
        created: {
          mapping: {
            destination: "created",
          },
        },
        lastImportDate: {
          mapping: {
            destination: "lastImportDate",
          },
        },
        name: {
          mapping: {
            destination: "name",
          },
        },
        uri: {
          mapping: {
            destination: "uri",
          },
        },
        "bucket.backend": {
          mapping: {
            destination: "bucket_backend",
          },
        },
        lastChangeDate: {
          mapping: {
            destination: "lastChangeDate",
          },
        },
        rowsCount: {
          mapping: {
            destination: "rowsCount",
          },
        },
        id: {
          mapping: {
            destination: "id",
          },
        },
      },
    },
  },
}
