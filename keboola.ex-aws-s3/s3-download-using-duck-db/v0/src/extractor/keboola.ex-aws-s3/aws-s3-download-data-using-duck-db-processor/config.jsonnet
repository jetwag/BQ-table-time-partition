{
  parameters: {
    loginType: "credentials",
    accessKeyId: Input("ex-aws-s3-access-key-id"),
    "#secretAccessKey": Input("ex-aws-s3-secret-access-key"),
  },
}
