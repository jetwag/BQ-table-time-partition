{
  stepsGroups: [
    {
      description: "Calendarific",
      required: "all",
      steps: [
        {
          icon: "component:ex-generic-v2",
          name: "Calendarific Data Source",
          description: "The data source retrieves the holidays dates in 4 countries.",
          inputs: [
            {
              id: "api_token",
              name: "API Token",
              description: "Provide Calendarific API Token.",
              type: "string",
              kind: "hidden",
              rules: "required",
            },
            {
              id: "year",
              name: "Year",
              description: "Write the year for which you want to get data.",
              type: "string",
              kind: "input",
              rules: "required",
            },
          ],
        },
      ],
    },
  ],
}
