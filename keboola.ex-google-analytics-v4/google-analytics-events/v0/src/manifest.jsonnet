{ mainConfig: {
    componentId: "keboola.ex-google-analytics-v4",
    id: ConfigId("google-analytics-events-engagement-data-source"),
  },
  configurations: [
    {
      componentId: "keboola.ex-google-analytics-v4",
      id: ConfigId("google-analytics-events-engagement-data-source"),
      path: "extractor/google-analytics-events-engagement-data-source",
      rows: [
        {
          id: ConfigRowId("events-engagement"),
          path: "rows/events-engagement",
        },
      ],
    },
  ],
}
