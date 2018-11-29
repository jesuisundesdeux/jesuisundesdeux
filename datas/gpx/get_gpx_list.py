import scrapy
from datetime import datetime

class GpxSpider(scrapy.Spider):
    name = 'gpxspider'
    start_urls = ['https://www.openstreetmap.org/traces/tag/JeSuisUnDesDeux']


    def parse(self, response):
        
        maxdate = 0

        # Update link
        format = '%Y-%m-%d %H:%M:%S %Z'
        for trace in response.xpath('//*[@id="trace_list"]/tbody/tr[*]'):
            print (trace)
            
            trace_id = trace.xpath('td[2]/a[3]/@href').extract_first().replace('/edit?gpx=','')
            trace_date = trace.xpath('td[2]/span[1]/@title').extract_first()
            trace_timestamp = int(datetime.strptime(trace_date, format).timestamp())
            trace_author = trace.xpath('td[2]/a[4]/text()').extract_first()

            if trace_timestamp>maxdate:
                maxdate=trace_timestamp

            yield {
                'id': trace_id,
                'author':trace_author,
                'date': trace_date,
                'timestamp': trace_timestamp,
            }