{
  parameters: {
    api: {
      baseUrl: "https://" + Input("kbc_hostname") + "/v2/storage/",
      pagination: {
        method: "offset",
        limit: "100",
        forceStop: true,
        limitStop: {
          count: 10000,
        },
      },
    },
    config: {
      project_id: "",
      mappings: {
        events: {
          "token.name": {
            type: "column",
            mapping: {
              destination: "tokenName",
            },
            forceType: true,
          },
          project_id: {
            type: "user",
            mapping: {
              destination: "projectId",
              primaryKey: true,
            },
          },
          "params.id": {
            type: "column",
            mapping: {
              destination: "paramsId",
            },
            forceType: true,
          },
          "params.stateTo": {
            type: "column",
            mapping: {
              destination: "paramsStateTo",
            },
            forceType: true,
          },
          extraction_date: {
            type: "user",
            mapping: {
              destination: "extractionDate",
            },
          },
          runId: {
            type: "column",
            mapping: {
              destination: "runId",
              primaryKey: true,
            },
          },
          message: {
            type: "column",
            mapping: {
              destination: "message",
            },
          },
          created: {
            type: "column",
            mapping: {
              destination: "created",
            },
          },
          objectName: {
            type: "column",
            mapping: {
              destination: "objectName",
            },
            forceType: true,
          },
          uri: {
            type: "column",
            mapping: {
              destination: "uri",
            },
            forceType: true,
          },
          "token.id": {
            type: "column",
            mapping: {
              destination: "tokenId",
            },
            forceType: true,
          },
          "params.stateFrom": {
            type: "column",
            mapping: {
              destination: "paramsStateFrom",
            },
            forceType: true,
          },
          objectType: {
            type: "column",
            mapping: {
              destination: "objectType",
            },
            forceType: true,
          },
          "params.mergeRequestId": {
            type: "column",
            mapping: {
              destination: "paramsMergeRequestId",
            },
            forceType: true,
          },
          objectId: {
            type: "column",
            mapping: {
              destination: "objectId",
            },
            forceType: true,
          },
          event: {
            type: "column",
            mapping: {
              destination: "event",
            },
          },
          "params.devBranchName": {
            type: "column",
            mapping: {
              destination: "paramsDevBranchName",
            },
            forceType: true,
          },
          type: {
            type: "column",
            mapping: {
              destination: "type",
            },
          },
          id: {
            type: "column",
            mapping: {
              destination: "id",
              primaryKey: true,
            },
          },
          description: {
            type: "column",
            mapping: {
              destination: "description",
            },
          },
          component: {
            type: "column",
            mapping: {
              destination: "component",
            },
          },
          idBranch: {
            type: "column",
            mapping: {
              destination: "idBranch",
            },
            forceType: true,
          },
          "params.operation": {
            type: "column",
            mapping: {
              destination: "paramsOperation",
            },
            forceType: true,
          },
        },
      },
      http: {
        headers: {
          Accept: "application/json",
          "X-StorageApi-Token": {
            attr: "#token",
          },
        },
      },
      debug: true,
      userData: {
        extraction_date: {
          "function": "concat",
          args: [
            {
              "function": "date",
              args: [
                "Y-m-d",
                {
                  "function": "strtotime",
                  args: [
                    "-0 days",
                  ],
                },
              ],
            },
            "T",
            {
              args: [
                "H:i:s",
              ],
              "function": "date",
            },
            "+00:00",
          ],
        },
        project_id: {
          attr: "project_id",
        },
      },
      jobs: [
        {
          endpoint: "events",
          dataType: "events",
          dataField: ".",
          params: {
            q: {
              attr: "var_q",
            },
          },
        },
      ],
      var_q: "event:storage.tableDeleted",
      id: "table_delete_events",
      incrementalOutput: true,
    },
    iterations: [
      {
        "#token": Input("kbc_storage_token"),
        project_id: Input("kbc_project_id"),
      },
    ],
  },
}
