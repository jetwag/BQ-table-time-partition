local params = {
  api: {
    baseUrl: 'https://api.rootly.com/v1/',
    pagination: {
      method: 'response.url',
      urlKey: 'links.next',
    },
    http: {
      ignoreErrors: [404],
      headers: {
        Authorization: {
          "function": 'concat',
          args: [
            'Bearer ',
            { attr: '#token' },
          ],
        },
      },
    },
  },
  config: {
    debug: true,
    outputBucket: 'ex-rootly',
    '#token': Input("api_token"),
    jobs: [
      {
        endpoint: 'incidents',
        dataType: 'incidents',
      },
      {
        endpoint: 'teams',
        dataType: 'teams',
      },
    ],
    mappings: {
      incidents: {
        'attributes.mitigated_at': {
          type: 'column',
          mapping: { destination: 'mitigated_at' },
        },
        'attributes.title': {
          type: 'column',
          mapping: { destination: 'title' },
        },
        'attributes.slug': {
          type: 'column',
          mapping: { destination: 'slug' },
        },
        'attributes.resolved_at': {
          type: 'column',
          mapping: { destination: 'resolved_at' },
        },
        'attributes.started_at': {
          type: 'column',
          mapping: { destination: 'started_at' },
        },
        'attributes.status': {
          type: 'column',
          mapping: { destination: 'status' },
        },
        'attributes.started_by_user.email': {
          type: 'column',
          mapping: { destination: 'started_by_user_email' },
        },
        'relationships.groups.data.0.id': {
          type: 'column',
          mapping: { destination: 'team_id' },
        },
        'attributes.severity.data.attributes.name': {
          type: 'column',
          mapping: { destination: 'severity' },
        },
        id: {
          type: 'column',
          mapping: { destination: 'id', primaryKey: true },
        },
        'attributes.jira_issue_id': {
          type: 'column',
          mapping: { destination: 'jira_issue_id' },
        },
      },
      teams: {
        id: {
          type: 'column',
          mapping: { destination: 'id', primaryKey: true },
        },
        'attributes.name': {
          type: 'column',
          mapping: { destination: 'name' },
        },
        'attributes.description': {
          type: 'column',
          mapping: { destination: 'description' },
        },
      },
    },
  },
};

{
  parameters: params
}
