{
  stepsGroups: [
    {
      description: "GitLab",
      required: "all",
      steps: [
        {
          icon: "component:ex-generic-V2",
          name: "GitLab - Projects",
          description: "The data source retrieves project data from your GitHub..",
          inputs: [
            {
              id: "api_token",
              name: "API Token",
              description: "Provide your GitLab API Token.",
              type: "string",
              kind: "hidden",
            },
            {
              id: "project_id",
              name: "Project ID",
              description: "Insert Project ID.",
              type: "string",
              kind: "input",
            },

          ],
        },
      ],
    },
  ],
}
