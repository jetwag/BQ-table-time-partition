{
  parameters: {
    query: "SELECT segments.date, ad_group.id, ad_group.name, ad_group.status, ad_group.type, ad_group.campaign, metrics.clicks, metrics.conversions, metrics.engagement_rate, metrics.cost_per_conversion, metrics.cost_micros, metrics.ctr FROM ad_group",
    since: Input("ex-google-ads-since"),
    until: Input("ex-google-ads-until"),
    name: "ad_groups",
    primary: [],
  },
}
