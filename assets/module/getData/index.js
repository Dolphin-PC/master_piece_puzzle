import { imageDownload } from './js/util/imageDownload.js'
import { addExportJson, exportJson } from './js/util/exportJson.js';
import { customScrapper } from './js/customScrapper.js';

let url = "https://artvee.com/page/2";

exec(url);



async function exec(_url) {
    const res = await customScrapper(_url);

    let jsonData = [];

    console.log("##### START IMAGE DOWNLOAD #####");
    for await (const item of res) {
        let imgName = item.title.replace(/[^A-Za-z0-9]/gi, '');
        await imageDownload(item.src, imgName, '../../images');
        jsonData.push({
            imgResourceName: imgName,
            imgDisplayName: item.title
        });
    }
    console.log("##### END IMAGE DOWNLOAD #####");

//    exportJson(jsonData, '../../data.json');
    addExportJson('../../data.json', jsonData, '../../add_data.json');

}



