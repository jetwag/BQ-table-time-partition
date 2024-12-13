{ mainConfig: {
    componentId: "keboola.data-apps",
    id: ConfigId("facebook-ads-adsests-data-source"),
  },
  configurations: [
    {
      componentId: "keboola.ex-facebook-ads",
      id: ConfigId("facebook-ads-adsets-data-source"),
      path: "extractor/facebook-ads-adsets-data-source",
      rows: [],
    },
  ],
}
