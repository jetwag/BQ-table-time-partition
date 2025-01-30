{
  stepsGroups: [
    {
      description: "Opsgenie",
      required: "all",
      steps: [
        {
          icon: "component:ex-generic-v2",
          name: "Opsgenie Data Source",
          description: "Retrieve teams, users, alerts, and schedules from Opsgenie.",
          inputs: [
            {
              id: "api_token",
              name: "API Token",
              description: "Provide your Opsgenie API Token.",
              type: "string",
              kind: "hidden",
            },
          ],
        },
      ],
    },
  ],
}
