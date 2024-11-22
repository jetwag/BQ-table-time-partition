{
  stepsGroups: [
    {
      description: "Facebook Ads",
      required: "all",
      steps: [
          {
          icon: "component:keboola.ex-facebook-ads",
          name: "Facebook Ads",
          description: "Facebook Ads - Campaigns",
          dialogName: "Facebook Ads - Campaigns", 
          dialogDescription: "To export your Facebook campaign data and insights authorize the Facebook Ads component.",
          inputs: [
            {
                id:          "oauth-facebookads",
                name:        "Open Authentication",
                description: "Authorization for Facebook Ads",
                type:        "object",
                kind:        "oauth",
                componentId: "keboola.ex-facebook-ads",
                rules:       "required",
            },
            {
                id:           "oauth-facebookads-accounts",
                name:         "Facebook Ads Accounts",
                description:  "Accounts for Facebook Ads",
                type:         "object",
                kind:         "oauthAccounts",
                oauthInputId: "oauth-facebookads",
                rules:        "required",
            },
          ],
        },
      ]
    },
  ],
}
