{ mainConfig: {
    componentId: "keboola.ex-google-ads",
    id: ConfigId("google-ads-campaigns"),
  },
  configurations: [
    {
        componentId: "keboola.ex-google-ads",
        id: ConfigId("google-ads-campaigns"),
        path: "extractor/google-ads-campaigns",
        rows: [
        {
            id: ConfigRowId("campaigns"),
            path: "rows/campaigns",
        },
        {
            id: ConfigRowId("ad-groups"),
            path: "rows/ad-groups",
        },
      ],
    },
  ],
}
