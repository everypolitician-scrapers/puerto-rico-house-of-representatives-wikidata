#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/puerto-rico-house-of-representatives-29', column: 'wikiname')
EveryPolitician::Wikidata.scrape_wikidata(names: { en: names }, output: false)
