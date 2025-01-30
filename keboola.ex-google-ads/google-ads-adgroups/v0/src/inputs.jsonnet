{
  stepsGroups: [
    {
      description: "Google Ads",
      required: "all",
      steps: [
        {
          icon: "component:keboola.ex-google-ads",
          name: "Google Ads",
          description: "Google Ads - AdGroups",
          dialogName: "Google Ads - AdGroups", 
          dialogDescription: "To export your Google Ads ad-groups data and insights authorize the Google Ads component.",
          inputs: [
            {
                id:          "oauth-googleads",
                name:        "Open Authentication",
                description: "Authorization for Google Ads",
                type:        "object",
                kind:        "oauth",
                componentId: "keboola.ex-google-ads",
            },
            {
                id:           "oauth-googleads-accounts",
                name:         "Google Ads Accounts",
                description:  "Accounts for Google Ads",
                type:         "object",
                kind:         "oauthAccounts",
                oauthInputId: "oauth-googleads",
            },
            {
                id: "ex-google-ads-since",
                name: "Since",
                description: "",
                type: "string",
                kind: "select",
                default: "-1 week",
                options: [
                {
                    value: "-1 week",
                    label: "last week"
                },
                {
                    value: "-1 month",
                    label: "last month"
                },
                {
                    value: "-3 months",
                    label: "last 3 months"
                },
                {
                    value: "-6 months",
                    label: "last 6 months"
                },
                ],
            },
            {
                id: "ex-google-ads-until",
                name: "Until",
                description: "",
                type: "string",
                kind: "select",
                default: "now",
                options: [
                {
                    value: 'now',
                    label: 'now',
                },
                {
                    value: '-1 day',
                    label: '1 day ago',
                },
                {
                    value: '-1 week',
                    label: '1 week ago',
                },
                ],
            }
        ]
    }
      ]
    }
  ]
}
  
