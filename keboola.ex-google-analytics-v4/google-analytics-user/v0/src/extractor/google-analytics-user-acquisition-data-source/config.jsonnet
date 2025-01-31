{
  parameters: Input('oauth-google-analytics-accounts') + {
    outputBucket: 'in.c-keboola-ex-google-analytics-v4-' + ConfigId('google-analytics-user-acquisition-data-source'),
  },
  authorization: {
    oauth_api: Input('oauth-google-analytics'),
  },
}
