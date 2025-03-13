{
  parameters: {
    outputTable: "user_acquisition",
    query: {
      dimensions: [
        {
          name: "date",
        },
        {
          name: "newVsReturning",
        },
        {
          name: "country",
        },
        {
          name: "userAgeBracket",
        },
        {
          name: "userGender",
        },
      ],
      metrics: [
        {
          name: "totalUsers",
        },
        {
          name: "activeUsers",
        },
        {
          name: "newUsers",
        },
        {
          name: "engagedSessions",
        },
        {
          name: "engagementRate",
        },
        {
          name: "userEngagementDuration",
        },
        {
          name: "eventCount",
        },
        {
          name: "averageSessionDuration",
        },
        {
          name: "sessionsPerUser",
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
