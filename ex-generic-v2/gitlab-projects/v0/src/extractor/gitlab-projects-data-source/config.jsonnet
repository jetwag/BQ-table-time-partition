{
  parameters: {
    api: {
      baseUrl: "https://gitlab.com/api/v4/",
      pagination: {
        method: "pagenum",
        limit: 100,
        limitParam: "per_page"
      },
      http: {
        ignoreErrors: [
          404
        ],
        headers: {
          Authorization: {
            "function": "concat",
            args: [
              "Bearer ",
              {
                attr: "#token"
              }
            ]
          },
          Accept: "application/json"
        }
      }
    },
    config: {
      debug: true,
      outputBucket: "gitlab",
      "#token": Input("api_token"),
      incrementalOutput: false,
      jobs: [
        {
          endpoint: "projects/" + Input("project_id"),
          dataType: "projects",
          dataField: ".",
          params: {
            visibility: "private"
          },
          children: [
            {
              endpoint: "projects/"+ Input("project_id")+"/merge_requests",
              recursionFilter: "id>20",
              dataType: "merge_requests",
              dataField: ".",
              placeholders: {
                project_id: "id"
              },
              params: {
                updated_after: {
                  "function": "date",
                  args: [
                    "Y-m-d H:i:s",
                    {
                      time: "previousStart"
                    }
                  ]
                }
              }
            }
          ]
        }
      ]
    }
  }
}