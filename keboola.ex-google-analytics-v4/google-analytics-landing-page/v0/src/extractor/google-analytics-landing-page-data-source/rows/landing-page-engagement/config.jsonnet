{
  parameters: {
    outputTable: "landing_page_enagagement",
    query: {
      dimensions: [
        {
          name: "date",
        },
        {
          name: "hostName",
        },
        {
          name: "landingPage",
        },
        {
          name: "landingPagePlusQueryString",
        },
        {
          name: "deviceCategory",
        },
      ],
      metrics: [
        {
          name: "activeUsers",
        },
        {
          name: "newUsers",
        },
        {
          name: "totalUsers",
        },
        {
          name: "sessions",
        },
        {
          name: "engagedSessions",
        },
        {
          name: "screenPageViews",
        },
        {
          name: "averageSessionDuration",
        },
        {
          name: "userEngagementDuration",
        },
        {
          name: "eventCount",
        },
      ],
      dateRanges: [
        {
          startDate: Input("ga-from"),
          endDate: Input("ga-to"),
        },
      ],
    },
    endpoint: "data-api",
  },
}
