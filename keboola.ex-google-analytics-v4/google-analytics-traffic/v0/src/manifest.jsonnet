{ mainConfig: {
    componentId: "keboola.ex-google-analytics-v4",
    id: ConfigId("google-analytics-traffic-acquisition-data-source"),
  },
  configurations: [
    {
      componentId: "keboola.ex-google-analytics-v4",
      id: ConfigId("google-analytics-traffic-acquisition-data-source"),
      path: "extractor/google-analytics-traffic-acquisition-data-source",
      rows: [
        {
          id: ConfigRowId("traffic-acquisition"),
          path: "rows/traffic-acquisition",
        },
      ],
    },
  ],
}
