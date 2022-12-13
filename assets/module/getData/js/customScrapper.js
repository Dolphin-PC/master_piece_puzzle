import { Scrapper } from './util/scrapper.js'

export async function customScrapper(url) {
    const $ = await Scrapper(url);

    // TODO : change html parsing logic
    let result = [];

    let productList = $('div.products')
        .find('div.product-grid-item');

    productList.each((i, el) => {
        let src = $(el)
            .find('div.product-element-top')
            .find('img')
            .attr('data-wood-src');

        let title = $(el)
            .find('div.product-element-bottom')
            .find('div.pbm')
            .find('div.linko')
            .find('h3.product-title')
            .find('a')
            .text();

        result.push({
            src: src,
            title: title
        });
    });
    console.log(result);
    // TODO : change html parsing logic

    return result;
}