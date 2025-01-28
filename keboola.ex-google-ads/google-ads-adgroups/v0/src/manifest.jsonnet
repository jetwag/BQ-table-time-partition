{ mainConfig: {
    componentId: "keboola.ex-google-ads",
    id: ConfigId("google-ads-adgroups-data-source"),
  },
  configurations: [
    {
        componentId: "keboola.ex-google-ads",
        id: ConfigId("google-ads-adgroups-data-source"),
        path: "extractor/google-ads-adgroups-data-source",
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
