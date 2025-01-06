{
  stepsGroups: [
    {
      description: "GitLab",
      required: "all",
      steps: [
        {
          icon: "component:ex-generic-V2",
          name: "GitLab - Pipelines",
          description: "The data source retrieves pipeline data from your GitHub.",
          inputs: [
            {
              id: "api_token",
              name: "API Token",
              description: "Provide your GitLab API Token.",
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
