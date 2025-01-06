{
  stepsGroups: [
    {
      description: "Rootly",
      required: "all",
      steps: [
        {
          icon: "component:ex-generic-v2",
          name: "Rootly Data Source",
          description: "Retrieve data about incidents.",
          inputs: [
            {
              id: "api_token",
              name: "API Token",
              description: "Provide your Rootly API Token.",
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
