{ mainConfig: {
    componentId: "keboola.ex-google-analytics-v4",
    id: ConfigId("google-analytics-landing-page-data-source"),
  },
  configurations: [
    {
      componentId: "keboola.ex-google-analytics-v4",
      id: ConfigId("google-analytics-landing-page-data-source"),
      path: "extractor/google-analytics-landing-page-data-source",
      rows: [
        {
          id: ConfigRowId("landing-page-engagement"),
          path: "rows/landing-page-engagement",
        },
      ],
    },
  ],
}
