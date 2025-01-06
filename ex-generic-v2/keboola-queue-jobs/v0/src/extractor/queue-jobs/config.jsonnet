{
  parameters: {
    api: {
      baseUrl: "https://queue." + Input("kbc_hostname") + "/",
      pagination: {
        method: "offset",
        limit: "100",
        forceStop: true,
        limitStop: {
          count: 10000
        }
      }
    },
    config: {
      id: "kbc_jobs",
      "#token": Input("kbc_storage_token"),
      debug: false,
      incrementalOutput: true,
      http: {
        headers: {
          Accept: "application/json",
          "X-StorageApi-Token": { attr: "#token" }
        }
      },
      jobs: [
        {
          endpoint: "jobs",
          dataType: "jobs_union",
          dataField: ".",
          params: {
            endTimeFrom: {
              "function": "concat",
              args: [
                {
                  "function": "date",
                  args: [
                    "Y-m-d",
                    {
                      "function": "strtotime",
                      args: [
                        "-1 days",
                        { time: "previousStart" }
                      ]
                    }
                  ]
                },
                "T",
                {
                  "function": "date",
                  args: [
                    "H:i:s",
                    { time: "previousStart" }
                  ]
                },
                "+00:00"
              ]
            }
          }
        }
      ],
      mappings: {
        jobs_union: {
          "project.name": {
            type: "column",
            mapping: { destination: "project_name" }
          },
          configRowIds: {
            type: "column",
            mapping: { destination: "config_row_ids" },
            forceType: true
          },
          "result.output.tables": {
            type: "column",
            mapping: { destination: "output" },
            forceType: true
          },
          config: {
            type: "column",
            mapping: { destination: "config" }
          },
          mode: {
            type: "column",
            mapping: { destination: "mode" }
          },
          "metrics.storage.outputTablesBytesSum": {
            type: "column",
            mapping: { destination: "metrics_storage_output_tables_bytes_sum" }
          },
          "result.configVersion": {
            type: "column",
            mapping: { destination: "result_config_version" }
          },
          "result.artifacts.downloaded": {
            type: "column",
            mapping: { destination: "result_artifacts_downloaded" },
            forceType: true
          },
          extraction_date: {
            type: "user",
            mapping: { destination: "extraction_date" }
          },
          runId: {
            type: "column",
            mapping: { destination: "run_id", primaryKey: true }
          },
          "metrics.backend.size": {
            type: "column",
            mapping: { destination: "metrics_backend_size" }
          },
          "token.description": {
            type: "column",
            mapping: { destination: "token_description" }
          },
          "variableValuesData.values": {
            type: "column",
            mapping: { destination: "variable_values_data" },
            forceType: true
          },
          endTime: {
            type: "column",
            mapping: { destination: "end_time" }
          },
          "result.images": {
            type: "column",
            mapping: { destination: "result_images" },
            forceType: true
          },
          "metrics.backend.context": {
            type: "column",
            mapping: { destination: "metrics_backend_context" }
          },
          usageData: {
            type: "column",
            mapping: { destination: "usage_data" },
            forceType: true
          },
          durationSeconds: {
            type: "column",
            mapping: { destination: "duration_seconds" }
          },
          configData: {
            type: "column",
            mapping: { destination: "config_data" },
            forceType: true
          },
          desiredStatus: {
            type: "column",
            mapping: { destination: "desired_status" }
          },
          "behavior.onError": {
            type: "column",
            mapping: { destination: "behavior_on_error" },
            forceType: true
          },
          url: {
            type: "column",
            mapping: { destination: "url" }
          },
          startTime: {
            type: "column",
            mapping: { destination: "start_time" }
          },
          "project.id": {
            type: "column",
            mapping: { destination: "project_id" }
          },
          "token.id": {
            type: "column",
            mapping: { destination: "token_id" }
          },
          "metrics.storage.inputTablesBytesSum": {
            type: "column",
            mapping: { destination: "metrics_storage_input_tables_bytes_sum" }
          },
          status: {
            type: "column",
            mapping: { destination: "status" }
          },
          "backend.context": {
            type: "column",
            mapping: { destination: "backend_context" },
            forceType: true
          },
          createdTime: {
            type: "column",
            mapping: { destination: "created_time" }
          },
          useLegacyRunId: {
            type: "column",
            mapping: { destination: "legacy_run_id" }
          },
          "result.message": {
            type: "column",
            mapping: { destination: "result_message" }
          },
          orchestrationJobId: {
            type: "column",
            mapping: { destination: "orchestration_job_id" }
          },
          variableValuesId: {
            type: "column",
            mapping: { destination: "variable_values_id" },
            forceType: true
          },
          type: {
            type: "column",
            mapping: { destination: "type" }
          },
          "result.input.tables": {
            type: "column",
            mapping: { destination: "input" },
            forceType: true
          },
          tag: {
            type: "column",
            mapping: { destination: "tag" }
          },
          id: {
            type: "column",
            mapping: { destination: "job_id" }
          },
          parallelism: {
            type: "column",
            mapping: { destination: "parallelism" }
          },
          parentRunId: {
            type: "column",
            mapping: { destination: "parent_run_id" }
          },
          isFinished: {
            type: "column",
            mapping: { destination: "isFinished" }
          },
          component: {
            type: "column",
            mapping: { destination: "component" }
          },
          branchId: {
            type: "column",
            mapping: { destination: "branchId" }
          },
          "metrics.backend.containerSize": {
            type: "column",
            mapping: { destination: "metrics_backend_container_size" }
          },
          "result.artifacts.uploaded": {
            type: "column",
            mapping: { destination: "result_artifacts_uploaded" },
            forceType: true
          }
        }
      },
      userData: {
        extraction_date: {
          "function": "concat",
          args: [
            {
              "function": "date",
              args: [
                "Y-m-d",
                { "function": "strtotime", args: [ "-0 days" ] }
              ]
            },
            "T",
            { "function": "date", args: [ "H:i:s" ] },
            "+00:00"
          ]
        }
      },
      outputBucket: "ex-queue-jobs"
    }
  }
}
