import fs from 'fs';
import axios from 'axios';

// TODO : change path where you want
// const path = './assets';

export async function imageDownload(_url, imageName, exportPath) {
    const res = await axios.get(_url, {
        responseType: 'arraybuffer'
    });
    const imageData = res.data;
    const buffer = Buffer.from(imageData, 'base64');
    console.log(`${exportPath}/${imageName}.jpg`)
    fs.writeFile(`${exportPath}/${imageName}.jpg`, buffer, () =>
        console.log('finished downloading!'));
}
