#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://en.wikipedia.org/wiki/29th_House_of_Representatives_of_Puerto_Rico',
  after: '//span[@id="Composition"]',
  before: '//span[@id="Commissions"]',
  xpath: './/table//tr[td]//td[2]//a[not(@class="new")][1]/@title',
)

EveryPolitician::Wikidata.scrape_wikidata(names: { en: names })
