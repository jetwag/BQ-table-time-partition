{
  stepsGroups: [
    {
      description: "AWS S3 Extractor",
      required: "all",
      steps: [
        {
          icon: "component:keboola.ex-aws-s3",
          name: "AWS S3 Extractor",
          description: "Authorize S3 and map your file",
          inputs: [
            {
              id: "ex-aws-s3-secret-access-key",
              name: "SecretAccessKey",
              description: "Provide secrets access key to you aws account",
              type: "string",
              kind: "hidden",
            },
            {
              id: "ex-aws-s3-access-key-id",
              name: "AccessKeyId",
              description: "",
              type: "string",
              kind: "input",
              default: "RDFUZG57689",
            },
            {
              id: "ex-aws-s3-bucket",
              name: "Bucket",
              description: "",
              type: "string",
              kind: "input",
              default: "source-bucket.cz",
            },
            {
              id: "ex-aws-s3-key",
              name: "Key",
              description: "",
              type: "string",
              kind: "input",
              default: "data_folder/data.json",
            },
          ],
        },
      ],
    },
  ],
}
