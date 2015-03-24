require 'bundler'
Bundler.require

Dinosaurus.configure do |config|
  config.api_key = '5a1a600f9a6f0b10db54a35563956fca'
end

word1 = Dinosaurus.synonyms_of('word')
word2 = Dinosaurus.antonyms_of('word')
word3 = Dinosaurus.related_to('word')
word4 = Dinosaurus.similar_to('word')
$word = word1.concat(word2.concat(word3.concat(word4)))

def randWord
    @ranWord = $word.sample
end

def randSent
  sentArray = []
  amount = rand(7..10)
  amount.times do
    sentArray.push(randWord.to_s)
  end
  sent = sentArray.join(' ')
  sent = sent.to_s + "."
end

def randPara
  paraArray = []
  amount = rand(7..15)
  amount.times do
    paraArray.push(randSent.to_s)
  end
  para = paraArray.join(' ')
end

def randPage
  pageArray = []
  5.times do
    pageArray.push(randPara.to_s)
  end
  page = pageArray.join("\n\n")
end

get '/' do
  @data = []
  erb :home
end

post '/' do
  @type, @num, @start = params["type"], params["unit"], params["start"]
  @data = [@num]
  erb :home
end
