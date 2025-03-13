{
  parameters: {
    outputTable: "events_engagement",
    query: {
      dimensions: [
        {
          name: "date",
        },
        {
          name: "eventName",
        },
        {
          name: "isKeyEvent",
        },
      ],
      metrics: [
        {
          name: "eventCount",
        },
        {
          name: "eventCountPerUser",
        },
        {
          name: "activeUsers",
        },
        {
          name: "eventValue",
        },
        {
          name: "totalRevenue",
        },
        {
          name: "totalUsers",
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
