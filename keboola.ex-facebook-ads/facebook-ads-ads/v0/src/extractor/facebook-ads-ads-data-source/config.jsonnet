{
  authorization: {
    oauth_api: Input("oauth-facebookads"),
  },
  parameters: Input("oauth-facebookads-accounts") + {
    queries: [
      {
        id: 70382,
        type: "nested-query",
        name: "campaigns",
        query: {
          path: "campaigns",
          fields: "id,name,account_id,status",
          ids: "",
          limit: "100"
        },
      },
      {
        id: 75034,
        type: "nested-query",
        name: "adsets",
        query: {
          path: "adsets",
          fields: "id,name,campaign_id",
          ids: "",
          limit: "100"
        }
      },
      {
        id: 48296,
        type: "nested-query",
        name: "ads",
        query: {
          path: "ads",
          fields: "id,name,adset_id",
          ids: "",
          limit: "100"
        }
      },
      {
        id: 36478,
        type: "nested-query",
        name: "ads_insights",
        query: {
          path: "ads",
          fields: "insights.date_preset(last_month).time_increment(1){ad_id,impressions,reach,actions,clicks,spend}",
          ids: "",
          limit: "25"
        }
      }
    ],
  },
}
