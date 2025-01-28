{
  parameters: {
    query: "SELECT segments.date, ad_group_ad.ad.id, ad_group_ad.ad.name, ad_group_ad.ad.type, ad_group_ad.status, ad_group_ad.ad_group,metrics.clicks, metrics.conversions, metrics.cost_micros, metrics.cost_per_conversion, metrics.engagement_rate, metrics.impressions FROM ad_group_ad",
    since: Input("ex-google-ads-since"),
    until: Input("ex-google-ads-until"),
    name: "ads",
    primary: [],
  },
}
