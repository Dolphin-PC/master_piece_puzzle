import axios from 'axios';
import cheerio from 'cheerio';

/**
 * @param url string
 * @returns $ cheerio
 */
export async function Scrapper(url) {
    if (!url) return;

    console.log(`##### START 웹 스크래핑[${url}] #####`);

    return new Promise((resolve, reject) => {
        axios.get(url)
            .then(html => {
                const $ = cheerio.load(html.data);

                resolve($);

            })
            .catch(error => {
                console.error(error);
                reject(error);
            });
    })
}