{
  stepsGroups: [
    {
      description: "Keboola - Configuration Events",
      required: "all",
      steps: [
        {
          icon: "component:ex-generic-v2",
          name: "Keboola Inputs",
          description: "Configure data source by filling up required inputs.",
          inputs: [
            {
              id: "kbc_storage_token",
              name: "Keboola Token",
              description: "Insert a storage or your master token.",
              type: "string",
              kind: "hidden",
            },
            {
              id: "kbc_hostname",
              name: "Keboola Hostname",
              description: "Insert your project hostname.",
              type: "string",
              kind: "input",
              default: "connection.north-europe.azure.keboola.com",
            },
            {
              id: "kbc_component_id",
              name: "Component ID",
              description: "Insert Component ID.",
              type: "string",
              kind: "input",
              default: "keboola.snowflake-transformation"
            },
            {
              id: "kbc_configuration_id",
              name: "Configuration ID",
              description: "Insert Configuration ID.",
              type: "string",
              kind: "input",
              default: "123456789"
            },
          ],
        },
      ],
    },
  ],
}
