local params = {
  api: {
    baseUrl: 'https://api.eu.smartlook.cloud/api/v1/',
    retryConfig: {
      http: {
        retryHeader: 'X-RetryAfter',
        codes: [500, 502, 503, 504, 408, 420, 429, 202],
      },
      maxRetries: 15,
    },
    http: {
      headers: {
        accept: 'application/json',
        'content-type': 'application/json',
        Authorization: {
          "function": 'concat',
          args: [
            'Bearer ',
            { attr: '#api_token' },
          ],
        },
      },
    },
    pagination: {
      method: 'response.url',
      urlKey: '_links.nextPage',
      includeParams: true,
    },
  },
  config: {
    debug: 'true',
    '#api_token': Input("api_token"),
    outputBucket: 'ex-smartlook',
    jobs: [
      {
        endpoint: 'sessions/search?limit=100',
        method: 'post',
        responseFilter: [
          'session_search',
          'session_search.limit_100',
          'session_search.limit_100.identification',
          'session_search.limit_100.pageUrl',
          'sessions',
          'sessions.limit_100',
          '.',
          'limit_100',
          'identification',
          'pageUrl',
        ],
        params: {
          filters: {
            "function": 'ifempty',
            args: [
              '',
              [
                {
                  name: 'recording_date',
                  operator: 'after',
                  value: {
                    "function": 'date',
                    args: [
                      'Y-m-d',
                      {
                        "function": 'strtotime',
                        args: [
                          '-1 day',
                          { time: 'currentStart' },
                        ],
                      },
                    ],
                  },
                },
              ],
            ],
          },
          sort: {
            timeStart: 'asc',
          },
        },
        children: [
          {
            endpoint: 'sessions/{session-id}',
            dataField: '.',
            dataType: 'session-detail',
            placeholders: {
              'session-id': 'id',
            },
          },
        ],
      },
    ],
    mappings: {
      'session-detail': {
        id: {
          type: 'column',
          mapping: {
            destination: 'session_id',
            primaryKey: true,
          },
        },
        dashboardURL: {
          type: 'column',
          mapping: {
            destination: 'dashboardURL',
          },
        },
        pageUrl: {
          type: 'column',
          mapping: {
            destination: 'pageUrl',
          },
          forceType: true,
        },
        'identification.properties': {
          type: 'column',
          mapping: {
            destination: 'properties',
          },
          forceType: true,
        },
        duration: {
          type: 'column',
          mapping: {
            destination: 'duration',
          },
        },
        startedAt: {
          type: 'column',
          mapping: {
            destination: 'startedAt',
          },
        },
        endedAt: {
          type: 'column',
          mapping: {
            destination: 'endedAt',
          },
        },
      },
    },
  },
};

{
  parameters: params
}
