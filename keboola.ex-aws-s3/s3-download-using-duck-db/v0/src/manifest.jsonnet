{
  configurations: [
    {
      componentId: "keboola.ex-aws-s3",
      id: ConfigId("aws-s3-download-data-using-duck-db-processor"),
      path: "extractor/keboola.ex-aws-s3/aws-s3-download-data-using-duck-db-processor",
      rows: [
        {
          id: ConfigRowId("big-data-download"),
          path: "rows/big-data-download",
        },
      ],
    },
  ],
}
