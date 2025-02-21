{
  parameters: {
    bucket: Input("ex-aws-s3-bucket"),
    key: Input("ex-aws-s3-key"),
    includeSubfolders: false,
    newFilesOnly: false,
  },
  processors: {
    after: [
      {
        definition: {
          component: "keboola.processor-duckdb",
        },
        parameters: {
          mode: "advanced",
          queries: [
            "SET threads TO 1",
            "SET memory_limit = '1GB'",
            "CREATE view output AS SELECT * FROM read_json_auto('/data/in/files/*.json', columns={estate_id: 'VARCHAR', first_seen: 'VARCHAR', last_seen: 'VARCHAR', spider: 'VARCHAR', offer_type: 'VARCHAR', type: 'VARCHAR', subtype: 'VARCHAR', locality: 'VARCHAR', gps_lat: 'VARCHAR', gps_lon: 'VARCHAR', address_country: 'VARCHAR', address_region: 'VARCHAR', address_district: 'VARCHAR', address_city: 'VARCHAR', address_neighborhood: 'VARCHAR', address_cadastral_area: 'VARCHAR', address_borough: 'VARCHAR', address_prague_district: 'VARCHAR', address_prague_admin_district: 'VARCHAR', address_postal_code: 'VARCHAR', address_street: 'VARCHAR', address_house_number: 'VARCHAR', address_address_point: 'VARCHAR', address_street_addres: 'VARCHAR', detail_url: 'VARCHAR', title: 'VARCHAR', description: 'VARCHAR', number: 'VARCHAR', seller: 'VARCHAR', state: 'VARCHAR', price: 'VARCHAR', price_excluding_vat: 'VARCHAR', currency: 'VARCHAR', price_type: 'VARCHAR', construction: 'VARCHAR', condition: 'VARCHAR', floor: 'VARCHAR', floor_count: 'VARCHAR', ownership: 'VARCHAR', energy_class: 'VARCHAR', orientation: 'VARCHAR', house_type: 'VARCHAR', disposition: 'VARCHAR', room_count: 'VARCHAR', disposition_kk: 'VARCHAR', disposition_plus1: 'VARCHAR', floor_area: 'VARCHAR', usable_area: 'VARCHAR', living_area: 'VARCHAR', total_area: 'VARCHAR', builtup_area: 'VARCHAR', land: 'VARCHAR', room: 'VARCHAR', balcony: 'VARCHAR', loggia: 'VARCHAR', terrace: 'VARCHAR', garden: 'VARCHAR', cellar: 'VARCHAR', attic: 'VARCHAR', storeroom: 'VARCHAR', parking: 'VARCHAR', garage: 'VARCHAR', equipment: 'VARCHAR', barrier_free: 'VARCHAR', lift: 'VARCHAR', pool: 'VARCHAR', move_in_date: 'VARCHAR', final_inspection_date: 'VARCHAR', built_date: 'VARCHAR', renovation_date: 'VARCHAR', project: 'VARCHAR', developer: 'VARCHAR', duplicity_index: 'VARCHAR'})",
          ],
          output: [
            "output",
          ],
        },
      },
    ],
  },
}
