{
  parameters: {
    api: {
      baseUrl: 'https://api.opsgenie.com/v2/',
      pagination: {
        method: 'offset',
        limit: '100',
      },
      http: {
        headers: {
          Authorization: {
            "function": 'concat',
            args: [
              'GenieKey ',
              { attr: '#token' }
            ],
          },
        },
      },
    },
    config: {
      id: 'opsgenie',
      debug: 'true',
      incrementalOutput: true,
      outputBucket: 'ex-opsgenie',
      userData: {
        extractionDate: {
          "function": 'date',
          args: ['Y-m-d H:i:s'],
        },
      },
      '#token': Input("api_token"),
      jobs: [
        {
          endpoint: 'alerts',
          dataField: 'data',
          dataType: 'alerts',
          params: {
            query: {
              "function": 'concat',
              args: [
                '=updatedAt',
                '>=',
                {
                  "function": 'date',
                  args: [
                    'd-m-Y',
                    {
                      "function": 'strtotime',
                      args: [
                        '-3 day',
                        { time: 'previousStart' },
                      ],
                    },
                  ],
                },
              ],
            },
          },
        },
        {
          endpoint: 'teams',
          dataField: 'data',
          dataType: 'teams',
        },
        {
          endpoint: 'users',
          dataField: 'data',
          dataType: 'users',
        },
        {
          endpoint: 'schedules',
          dataField: 'data',
          dataType: 'schedules',
          children: [
            {
              endpoint: 'schedules/{schedule-id}/timeline',
              dataType: 'schedule_timeline',
              dataField: 'data',
              placeholders: {
                'schedule-id': 'id',
              },
              params: {
                intervalUnit: 'months',
                interval: 12,
                date: {
                  "function": 'date',
                  args: [
                    'c',
                    {
                      "function": 'strtotime',
                      args: ['-1 month'],
                    },
                  ],
                },
              },
            },
          ],
        },
      ],
      mappings: {
        teams: {
          id: {
            type: 'column',
            mapping: { destination: 'id', primaryKey: true },
          },
          description: {
            type: 'column',
            mapping: { destination: 'description' },
          },
          'links.api': {
            type: 'column',
            mapping: { destination: 'links_api' },
          },
          'links.web': {
            type: 'column',
            mapping: { destination: 'links_web' },
          },
          name: {
            type: 'column',
            mapping: { destination: 'name' },
          },
        },
        users: {
          id: {
            type: 'column',
            mapping: { destination: 'id', primaryKey: true },
          },
          username: {
            type: 'column',
            mapping: { destination: 'username' },
          },
          fullName: {
            type: 'column',
            mapping: { destination: 'full_name' },
          },
          createdAt: {
            type: 'column',
            mapping: { destination: 'created_at' },
          },
          'role.id': {
            type: 'column',
            mapping: { destination: 'role_id' },
          },
          'role.name': {
            type: 'column',
            mapping: { destination: 'role_name' },
          },
          timeZone: {
            type: 'column',
            mapping: { destination: 'timezone' },
          },
          blocked: {
            type: 'column',
            mapping: { destination: 'blocked' },
          },
          verified: {
            type: 'column',
            mapping: { destination: 'verified' },
          },
        },
        alerts: {
          id: {
            type: 'column',
            mapping: { destination: 'id', primaryKey: true },
          },
          acknowledged: {
            type: 'column',
            mapping: { destination: 'acknowledged' },
          },
          count: {
            type: 'column',
            mapping: { destination: 'count' },
          },
          createdAt: {
            type: 'column',
            mapping: { destination: 'created_at' },
          },
          updatedAt: {
            type: 'column',
            mapping: { destination: 'updated_at' },
          },
          lastOccurredAt: {
            type: 'column',
            mapping: { destination: 'last_occurred_at' },
          },
          alias: {
            type: 'column',
            mapping: { destination: 'alias' },
          },
          'integration.id': {
            type: 'column',
            mapping: { destination: 'integration_id' },
          },
          'integration.name': {
            type: 'column',
            mapping: { destination: 'integration_name' },
          },
          'integration.type': {
            type: 'column',
            mapping: { destination: 'integration_type' },
          },
          isSeen: {
            type: 'column',
            mapping: { destination: 'is_seen' },
          },
          seen: {
            type: 'column',
            mapping: { destination: 'seen' },
          },
          snoozed: {
            type: 'column',
            mapping: { destination: 'snoozed' },
          },
          source: {
            type: 'column',
            mapping: { destination: 'source' },
          },
          priority: {
            type: 'column',
            mapping: { destination: 'priority' },
          },
          status: {
            type: 'column',
            mapping: { destination: 'status' },
          },
          message: {
            type: 'column',
            mapping: { destination: 'message' },
          },
          owner: {
            type: 'column',
            mapping: { destination: 'owner' },
          },
          ownerTeamId: {
            type: 'column',
            mapping: { destination: 'owner_team_id' },
          },
          tinyId: {
            type: 'column',
            mapping: { destination: 'tiny_id' },
          },
        },
      },
    },
  },
}
