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
      mappings: {
        events: {
          token_id: {
            type: "column",
            mapping: {
              destination: "token_id",
            },
            forceType: true,
          },
          context_httpUserAgent: {
            type: "column",
            mapping: {
              destination: "context_httpUserAgent",
            },
            forceType: true,
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
          context_remoteAddr: {
            type: "column",
            mapping: {
              destination: "context_remoteAddr",
            },
            forceType: true,
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
          context_apiVersion: {
            type: "column",
            mapping: {
              destination: "context_apiVersion",
            },
            forceType: true,
          },
          attachments: {
            type: "column",
            mapping: {
              destination: "attachments",
            },
            forceType: true,
          },
          configurationId: {
            type: "column",
            mapping: {
              destination: "configurationId",
            },
            forceType: true,
          },
          token_name: {
            type: "column",
            mapping: {
              destination: "token_name",
            },
            forceType: true,
          },
          context_httpReferer: {
            type: "column",
            mapping: {
              destination: "context_httpReferer",
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
        },
      },
      var_component: Input("kbc_component_id"),
      http: {
        headers: {
          Accept: "application/json",
          "X-StorageApi-Token": {
            attr: "#token",
          },
        },
      },
      var_runId: "",
      debug: true,
      jobs: [
        {
          endpoint: "events",
          dataType: "events",
          dataField: ".",
          params: {
            component: {
              attr: "var_component",
            },
          },
        },
      ],
      "#token": Input("kbc_storage_token"),
      var_configurationId: Input("kbc_configuration_id"),
      incremental: true,
      id: "kbc_storage",
      incrementalOutput: true,
    },
  },
}
