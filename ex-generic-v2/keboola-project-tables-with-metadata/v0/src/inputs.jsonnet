{
  stepsGroups: [
    {
      description: "Keboola - Project Tables with Metadata",
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
              rules: "required",
            },
            {
              id: "kbc_hostname",
              name: "Keboola Hostname",
              description: "Insert your project hostname.",
              type: "string",
              kind: "input",
              default: "connection.north-europe.azure.keboola.com",
            }
          ],
        },
      ],
    },
  ],
}
