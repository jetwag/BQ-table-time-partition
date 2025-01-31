{
  parameters: {
    query: {
      dimensions: [
        {
          name: "date",
        },
        {
          name: "sessionSource",
        },
        {
          name: "sessionMedium",
        },
        {
          name: "sessionCampaignName",
        },
        {
          name: "newVsReturning",
        },
      ],
      metrics: [
        {
          name: "activeUsers",
        },
        {
          name: "sessions",
        },
        {
          name: "engagedSessions",
        },
        {
          name: "averageSessionDuration",
        },
        {
          name: "sessionsPerUser",
        },
        {
          name: "eventsPerSession",
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
    outputTable: "traffic_acquisition",
  },
}
