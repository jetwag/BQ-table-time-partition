{ mainConfig: {
    componentId: "keboola.ex-google-ads",
    id: ConfigId("google-ads-ads-data-source"),
  },
  configurations: [
    {
        componentId: "keboola.ex-google-ads",
        id: ConfigId("google-ads-cds-data-source"),
        path: "extractor/google-ads-ads-data-source",
        rows: [
        {
            id: ConfigRowId("campaigns"),
            path: "rows/campaigns",
        },
        {
            id: ConfigRowId("ad-groups"),
            path: "rows/ad-groups",
        },
        {
            id: ConfigRowId("ads"),
            path: "rows/ads",
        },
      ],
    },
  ],
}
