{
  parameters: {
    api: {
      baseUrl: "https://sandboxes." + Input("kbc_hostname") + "/sandboxes"
    },
    config: {
      id: "kbc_sandboxes",
      "#token": Input("kbc_storage_token"),
      debug: 1,
      incrementalOutput: false,
      userData: {
        extracted: {
          "function": "date",
          args: [
            "Y-m-d H:i:s",
            {
              "function": "strtotime",
              args: ["now"]
            }
          ]
        }
      },
      http: {
        headers: {
          Accept: "application/json",
          "X-StorageApi-Token": { attr: "#token" }
        }
      },
      jobs: [
        {
          endpoint: "sandboxes",
          dataType: "sandboxes",
          dataField: "."
        }
      ]
    }
  }
}
