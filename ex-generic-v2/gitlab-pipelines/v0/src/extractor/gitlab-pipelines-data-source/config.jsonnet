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
   outputBucket: "ex-gitlab",
   "#token": Input("api_token"),
   incrementalOutput: false,
   jobs: [
    {
     endpoint: "projects",
     dataType: "projects",
     params: {
      visibility: "private"
     },
     children: [
      {
       endpoint: "projects/{project_id}/pipelines",
       recursionFilter: "id>20",
       dataType: "pipelines_list",
       placeholders: {
        project_id: "id"
       },
       params: {
        updated_after: {
         "function": "date",
         args: [
          "Y-m-dTH:i:s:u",
          {
           "function": "strtotime",
           args: [
            "-3 days"
           ]
          }
         ]
        }
       },
       children: [
        {
         endpoint: "projects/{2:project_id}/pipelines/{1:pipeline_id}",
         dataField: ".",
         dataType: "pipelines",
         recursionFilter: "id>20",
         placeholders: {
          "1:pipeline_id": "id",
          "2:project_id": "id"
         }
        },
        {
         endpoint: "projects/{2:project_id}/pipelines/{1:pipeline_id}/jobs",
         dataField: ".",
         dataType: "jobs",
         recursionFilter: "id>20",
         placeholders: {
          "1:pipeline_id": "id",
          "2:project_id": "id"
         },
         params: {
          include_retried: "True"
         }
        },
        {
         endpoint: "projects/{2:project_id}/pipelines/{1:pipeline_id}/bridges",
         dataField: ".",
         dataType: "bridges",
         recursionFilter: "id>20",
         placeholders: {
          "1:pipeline_id": "id",
          "2:project_id": "id"
         },
         children: [
          {
           endpoint: "projects/{3:project_id}/pipelines/{1:pipeline_id}",
           dataField: ".",
           dataType: "pipelines",
           recursionFilter: "downstream_pipeline.id>20",
           placeholders: {
            "3:project_id": "id",
            "1:pipeline_id": "downstream_pipeline.id"
           }
          },
          {
           endpoint: "projects/{3:project_id}/pipelines/{1:pipeline_id}/jobs",
           dataField: ".",
           dataType: "jobs",
           recursionFilter: "downstream_pipeline.id>20",
           placeholders: {
            "3:project_id": "id",
            "1:pipeline_id": "downstream_pipeline.id"
           },
           params: {
            include_retried: "True"
           }
          }
         ]
        }
       ]
      }
     ]
    }
   ],
   mappings: {
    pipelines: {
     id: "pipeline_id",
     parent_id: {
      type: "user",
      mapping: {
       destination: "project_id"
      }
     },
     "sha": "sha",
     "ref": "ref",
     "status": "status",
     "created_at": "created_at",
     "updated_at": "updated_at",
     "web_url": "web_url",
     "before_sha": "before_sha",
     "tag": "tag",
     "user.id": "user_id",
     "user.name": "user_name",
     "user.username": "user_username",
     "started_at": "started_at",
     "finished_at": "finished_at",
     "committed_at": "committed_at",
     "duration": "duration",
     "coverage": "coverage",
     "detailed_status.icon": "detailed_status_icon",
     "detailed_status.text": "detailed_status_text",
     "detailed_status.label": "detailed_status_label",
     "detailed_status.group": "detailed_status_group"
    },
    bridges: {
     "downstream_pipeline.id": "child_pipeline_id",
     "pipeline.id": "parent_pipeline_id",
     "id": "bridge_id",
     "status": "status",
     "name": "name",
     "ref": "ref",
     "user.name": "user_name",
     "user.username": "user_username"
    },
    jobs: {
     "id": "id",
     "status": "status",
     "stage": "stage",
     "name": "name",
     "ref": "ref",
     "tag": "tag",
     "coverage": "coverage",
     "duration": "duration",
     "allow_failure": "allow_failure",
     "created_at": "created_at",
     "started_at": "started_at",
     "finished_at": "finished_at",
     "commit.id": "commit_id",
     "pipeline.id": "pipeline_id",
     "web_url": "web_url",
     "user.name": "user_name",
     "user.username": "user_username"
    }
   }
  }
 }
}