{
  parameters: {
    query: "SELECT segments.date,campaign.id, campaign.name, campaign.status, campaign.advertising_channel_type,campaign.start_date, campaign.end_date, metrics.clicks, metrics.impressions, metrics.cost_per_conversion, metrics.engagement_rate  FROM campaign",
    since: Input("ex-google-ads-since"),
    until: Input("ex-google-ads-until"),
    name: "campaigns",
    primary: [],
  },
}
