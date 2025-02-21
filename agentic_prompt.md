# Keboola Template Management Guide

## Overview
This guide describes the process of creating, testing, and deploying a Keboola template. Follow these steps to manage templates effectively.
Always create a template and test the template.

## 1. Create Template
### Important Notes
1. ALWAYS preserve existing content in repository.json. Never overwrite the entire file:
   - The main repository.json is located in `.keboola/repository.json`
   - Make a backup copy first
   - Add new template to the existing templates array
   - Keep all existing templates and their configurations
   - Only append your new template at the end of the templates array

2. Templates must be created in a directory structure that matches their component ID. For example:
   - For a Google Analytics 4 template: `keboola.ex-google-analytics-v4/`
   - For a Google Ads template: `keboola.ex-google-ads/`
   This ensures proper organization and maintainability of templates.

3. The `template create` command may create directories in both the component directory and root directory. Always use the one in the component directory and remove any duplicate from the root.

### Initial Setup
1. Create the component directory if it doesn't exist:
```bash
mkdir -p keboola.ex-google-analytics-v4
```

2. Handle repository.json backup and restore:
```bash
# Make a backup of the existing repository.json
cp .keboola/repository.json .keboola/repository.json.bak

# After running template create command, restore the original repository.json
cp .keboola/repository.json.bak .keboola/repository.json

# Then manually add your new template to the end of the templates array in repository.json
# DO NOT overwrite the entire file - only append your new template
```

3. Structure for new template to append to repository.json:
```json
{
  "id": "google-analytics-landing-page-engagement",
  "name": "Google Analytics Landing Page Engagement",
  "description": "Template for Google Analytics Landing Page Engagement configuration",
  "requirements": {
    "backends": ["snowflake", "bigquery"],
    "components": ["keboola.ex-google-analytics-v4"]
  },
  "path": "keboola.ex-google-analytics-v4/google-analytics-landing-page-engagement",
  "deprecated": false,
  "categories": ["Marketing", "Analytics"],
  "versions": [
    {
      "version": "0.0.1",
      "description": "Initial version",
      "stable": false,
      "components": ["keboola.ex-google-analytics-v4"],
      "path": "v0"
    }
  ]
}
```

### Command
```bash
kbc template create
```

### Required Parameters
- `--name`: Template name
- `--description`: Template description
- `--storage-api-host`: Keboola Storage API host (taken from KBC_STORAGE_API_HOST in .env.local)
- `--storage-api-token`: Keboola Storage API token (taken from KBC_STORAGE_API_TOKEN in .env.local)
- `--configs`: Configuration IDs to include
- `--branch`: Branch ID or name (required)

### Example Usage
```bash
# First ensure your .env.local contains:
# KBC_STORAGE_API_HOST=connection.north-europe.azure.keboola.com
# KBC_STORAGE_API_TOKEN=your-token

cd keboola-as-code-templates-components-2/keboola.ex-google-analytics-v4
kbc template create \
  --name "google-analytics-landing-page-engagement" \
  --description "Template for Google Analytics Landing Page Engagement configuration" \
  --storage-api-host "${KBC_STORAGE_API_HOST}" \
  --storage-api-token "${KBC_STORAGE_API_TOKEN}" \
  --configs "keboola.ex-google-analytics-v4:CONFIG_ID" \
  --branch main
```

### Post-Creation Cleanup
1. Check for and remove any duplicate directories in the root
2. Verify the template was created in the component directory
3. Review generated files (manifest.jsonnet, inputs.jsonnet, etc.)
4. Restore the original repository.json from backup and manually add your new template
5. Verify the template entry was added correctly to repository.json

## 2. Test Template
### Command
```bash
kbc local template use <repository>/<template>/<version>
```

### Required Parameters
- `--branch`: Target branch name
- `--instance-name`: Name for the new instance
- `--storage-api-host`: Keboola Storage API host
- `--storage-api-token`: Keboola Storage API token

### Example Usage
```bash
# Ensure your .env.local contains:
# KBC_STORAGE_API_HOST=connection.north-europe.azure.keboola.com
# KBC_STORAGE_API_TOKEN=your-token

cd kbc_dft_azure_dev
kbc local template use fork/google-analytics-landing-page-engagement/v0 \
  --branch main \
  --instance-name "ga4-landing-page-test" \
  --storage-api-host "${KBC_STORAGE_API_HOST}" \
  --storage-api-token "${KBC_STORAGE_API_TOKEN}"
```

## 3. Deploy Template
After successful testing, deploy the template to your Keboola project:

### Commands
1. Persist local changes:
```bash
  kbc persist
```

2. Push to Keboola project:
```bash
  kbc push
```

## Notes
- Store sensitive information like API tokens in `.env.local` file
- Check manifest.json for correct repository and template configuration
- Verify template creation and testing before deployment
- Always test templates in a development environment first
- Create templates in their respective component directories
- Add new template definitions at the end of repository.json
- ALWAYS restore repository.json from backup after template creation
- Manually append new template to existing repository.json file