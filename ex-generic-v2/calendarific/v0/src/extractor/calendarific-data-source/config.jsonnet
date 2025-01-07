local params = {
  api: {
    authentication: {
      type: 'query',
      query: {
        api_key: {
          attr: '#api_key',
        },
      },
    },
    baseUrl: 'https://calendarific.com/api/v2/',
    http: {
      defaultOptions: {
        params: {
          year: Input("year"),
          type: 'national',
        },
      },
    },
  },
  config: {
    debug: false,
    id: 'calendarific',
    incrementalOutput: true,
    '#api_key': Input("api_token"),
    jobs: [
      {
        endpoint: 'holidays?country=CZ',
        dataType: 'holidays_cz',
        dataField: 'response.holidays',
      },
      {
        endpoint: 'holidays?country=CA',
        dataType: 'holidays_ca',
        dataField: 'response.holidays',
      },
      {
        endpoint: 'holidays?country=US',
        dataType: 'holidays_us',
        dataField: 'response.holidays',
      },
      {
        endpoint: 'holidays?country=GB',
        dataType: 'holidays_gb',
        dataField: 'response.holidays',
      },
    ],
    mappings: {
      holidays_cz: {
        'date.iso': {
          mapping: {
            destination: 'date',
            primaryKey: true,
          },
        },
        name: 'name',
      },
      holidays_ca: {
        'date.iso': {
          mapping: {
            destination: 'date',
            primaryKey: true,
          },
        },
        name: 'name',
      },
      holidays_us: {
        'date.iso': {
          mapping: {
            destination: 'date',
            primaryKey: true,
          },
        },
        name: 'name',
      },
      holidays_gb: {
        'date.iso': {
          mapping: {
            destination: 'date',
            primaryKey: true,
          },
        },
        name: 'name',
      },
    },
  },
};

{
  parameters: params
}
