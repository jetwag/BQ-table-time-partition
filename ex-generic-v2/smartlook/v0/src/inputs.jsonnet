{
  stepsGroups: [
    {
      description: "Smartlook",
      required: "all",
      steps: [
        {
          icon: "component:ex-generic-v2",
          name: "Smartlook Data Source",
          description: "Retrieve data about sessions.",
          inputs: [
            {
              id: "api_token",
              name: "API Token",
              description: "Provide your Smartlook API Token.",
              type: "string",
              kind: "hidden",
              rules: "required",
            },
          ],
        },
      ],
    },
  ],
}
