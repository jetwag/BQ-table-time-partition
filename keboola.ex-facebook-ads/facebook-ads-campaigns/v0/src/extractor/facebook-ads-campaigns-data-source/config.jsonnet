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
        id: 13833,
        type: "nested-query",
        name: "campaigns_insights",
        query: {
          path: "campaigns",
          fields: "insights.date_preset(last_month).time_increment(1){campaign_id,impressions,reach,actions,clicks,spend}",
          ids: "",
          limit: "100"
        }
      }
    ],
  },
}
