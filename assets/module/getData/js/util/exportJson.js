import fs from 'fs';

export function exportJson(data, exportPathFileName) {
    console.log("##### START JSON_DATA DOWNLOAD #####");
    fs.writeFileSync(exportPathFileName, JSON.stringify(data));
    console.log("##### END JSON_DATA DOWNLOAD #####");
}


export function addExportJson(org_data, add_data, exportPathFileName) {
    console.log("##### START ADD JSON_DATA DOWNLOAD #####");
    let org_str = fs.readFileSync(org_data);
    let org_json = JSON.parse(org_str);

    let result_json = [...org_json, ...add_data];
    fs.writeFileSync(exportPathFileName, JSON.stringify(result_json));
    console.log("##### END   ADD JSON_DATA DOWNLOAD #####");
}