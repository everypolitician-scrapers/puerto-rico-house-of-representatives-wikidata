#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

members29 = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://en.wikipedia.org/wiki/29th_House_of_Representatives_of_Puerto_Rico',
  after: '//span[@id="Composition"]',
  before: '//span[@id="Commissions"]',
  xpath: './/table//tr[td]//td[2]//a[not(@class="new")][1]/@title',
)

# Some members who resign and aren't in the members table are still
# listed in the Commissions table
commission29 = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://en.wikipedia.org/wiki/29th_House_of_Representatives_of_Puerto_Rico',
  after: '//span[@id="Commissions"]',
  before: '//span[@id="Notable_legislations"]',
  xpath: './/table//tr[td]//td//a[not(@class="new")]/@title',
)

names30 = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://en.wikipedia.org/wiki/30th_House_of_Representatives_of_Puerto_Rico',
  after: '//span[@id="Composition"]',
  before: '//span[@id="External_links"]',
  xpath: './/table//tr[td]//td[2]//a[not(@class="new")][1]/@title',
)

EveryPolitician::Wikidata.scrape_wikidata(names: { en: members29 | commission29 | names30 })
