{
  parameters: {
    api: {
      baseUrl: "https://" + Input("kbc_hostname") + "/v2/storage/"
    },
    config: {
      id: "kbc_storage_tables",
      "#token": Input("kbc_storage_token"),
      debug: false,
      incrementalOutput: false,
      http: {
        headers: {
          Accept: "application/json",
          "X-StorageApi-Token": { attr: "#token" }
        }
      },
      jobs: [
        {
          endpoint: "tables",
          dataType: "tables",
          dataField: ".",
          params: {
            include: "metadata,buckets,columns,columnMetadata"
          }
        }
      ],
      mappings: {
        tables: {
          dataSizeBytes: {
            type: "column",
            mapping: {
              destination: "data_size_bytes"
            }
          },
          isTyped: {
            type: "column",
            mapping: {
              destination: "is_typed"
            }
          },
          isAliasable: {
            type: "column",
            mapping: {
              destination: "is_aliasable"
            }
          },
          columnMetadata: {
            type: "column",
            mapping: {
              destination: "columnMetadata"
            },
            forceType: true
          },
          isAlias: {
            type: "column",
            mapping: {
              destination: "is_alias"
            }
          },
          created: {
            type: "column",
            mapping: {
              destination: "created"
            }
          },
          lastImportDate: {
            type: "column",
            mapping: {
              destination: "last_import_date"
            }
          },
          transactional: {
            type: "column",
            mapping: {
              destination: "transactional"
            }
          },
          bucket: {
            type: "table",
            destination: "table_bucket",
            parentKey: {
              primaryKey: true,
              destination: "table_id"
            },
            tableMapping: {
              dataSizeBytes: {
                type: "column",
                mapping: {
                  destination: "data_size_bytes"
                }
              },
              "sharedBy.date": {
                type: "column",
                mapping: {
                  destination: "shared_by_date"
                }
              },
              tables: {
                type: "column",
                mapping: {
                  destination: "tables"
                }
              },
              hasExternalSchema: {
                type: "column",
                mapping: {
                  destination: "has_external_schema"
                }
              },
              databaseName: {
                type: "column",
                mapping: {
                  destination: "database_name"
                }
              },
              sharingParameters: {
                type: "column",
                mapping: {
                  destination: "sharing_parameters"
                },
                forceType: true
              },
              created: {
                type: "column",
                mapping: {
                  destination: "created"
                }
              },
              isMaintenance: {
                type: "column",
                mapping: {
                  destination: "is_maintenance"
                }
              },
              name: {
                type: "column",
                mapping: {
                  destination: "bucket_name"
                }
              },
              uri: {
                type: "column",
                mapping: {
                  destination: "uri"
                }
              },
              isReadOnly: {
                type: "column",
                mapping: {
                  destination: "is_read_only"
                }
              },
              "sharedBy.id": {
                type: "column",
                mapping: {
                  destination: "shared_by_id"
                }
              },
              displayName: {
                type: "column",
                mapping: {
                  destination: "display_name"
                }
              },
              backend: {
                type: "column",
                mapping: {
                  destination: "backend"
                }
              },
              lastChangeDate: {
                type: "column",
                mapping: {
                  destination: "last_change_date"
                }
              },
              rowsCount: {
                type: "column",
                mapping: {
                  destination: "rows_count"
                }
              },
              id: {
                type: "column",
                mapping: {
                  destination: "bucket_id",
                  primaryKey: true
                }
              },
              sharing: {
                type: "column",
                mapping: {
                  destination: "sharing"
                }
              },
              description: {
                type: "column",
                mapping: {
                  destination: "description"
                }
              },
              "sharedBy.name": {
                type: "column",
                mapping: {
                  destination: "shared_by_name"
                }
              },
              stage: {
                type: "column",
                mapping: {
                  destination: "stage"
                }
              }
            }
          },
          "sourceTable.project.id": {
            type: "column",
            mapping: {
              destination: "source_project_id"
            }
          },
          name: {
            type: "column",
            mapping: {
              destination: "table_name"
            }
          },
          uri: {
            type: "column",
            mapping: {
              destination: "uri"
            }
          },
          indexType: {
            type: "column",
            mapping: {
              destination: "index_type"
            }
          },
          indexKey: {
            type: "column",
            mapping: {
              destination: "index_keys"
            },
            forceType: true
          },
          displayName: {
            type: "column",
            mapping: {
              destination: "display_name"
            }
          },
          metadata: {
            type: "column",
            mapping: {
              destination: "metadata"
            },
            forceType: true
          },
          "sourceTable.uri": {
            type: "column",
            mapping: {
              destination: "source_uri"
            }
          },
          lastChangeDate: {
            type: "column",
            mapping: {
              destination: "last_change_date"
            }
          },
          "sourceTable.id": {
            type: "column",
            mapping: {
              destination: "source_id"
            }
          },
          rowsCount: {
            type: "column",
            mapping: {
              destination: "rows_count"
            }
          },
          id: {
            type: "column",
            mapping: {
              destination: "table_id",
              primaryKey: true
            }
          },
          distributionKey: {
            type: "column",
            mapping: {
              destination: "distribution_keys"
            },
            forceType: true
          },
          "sourceTable.project.name": {
            type: "column",
            mapping: {
              destination: "source_project_name"
            }
          },
          primaryKey: {
            type: "column",
            mapping: {
              destination: "primary_keys"
            },
            forceType: true
          },
          columns: {
            type: "column",
            mapping: {
              destination: "columns"
            },
            forceType: true
          },
          distributionType: {
            type: "column",
            mapping: {
              destination: "distribution_type"
            }
          },
          syntheticPrimaryKeyEnabled: {
            type: "column",
            mapping: {
              destination: "synthetic_pk_enabled"
            }
          }
        }
      }
    }
  }
}
