{ mainConfig: {
    componentId: "keboola.ex-google-ads",
    id: ConfigId("google-ads-campaigns-data-source"),
  },
  configurations: [
    {
        componentId: "keboola.ex-google-ads",
        id: ConfigId("google-ads-campaigns-data-source"),
        path: "extractor/google-ads-campaigns-data-source",
        rows: [
        {
            id: ConfigRowId("campaigns"),
            path: "rows/campaigns",
        },
      ],
    },
  ],
}
