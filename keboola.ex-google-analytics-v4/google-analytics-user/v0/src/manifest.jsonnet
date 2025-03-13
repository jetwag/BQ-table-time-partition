{ mainConfig: {
    componentId: "keboola.ex-google-analytics-v4",
    id: ConfigId("google-analytics-user-acquisition-data-source"),
  },
  configurations: [
    {
      componentId: "keboola.ex-google-analytics-v4",
      id: ConfigId("google-analytics-user-acquisition-data-source"),
      path: "extractor/google-analytics-user-acquisition-data-source",
      rows: [
        {
          id: ConfigRowId("user-acquisition"),
          path: "rows/user-acquisition",
        },
      ],
    },
  ],
}
