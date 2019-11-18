require "open-uri"
require "pdf-reader"

def fetchSyllabusUrl
 url="https://klis.tsukuba.ac.jp/syllabus.html"
 source=URI.open(url).read.scan(/assets\/files\/syllabus.*pdf/)
 return source.map{|i|"https://klis.tsukuba.ac.jp/"+i}
end

def parse(url)
 file=PDF::Reader.new(URI.open(url))
      .pages[200,100].map{|i|i.text.split}
      .select{|i|i[0,3]==["氏名", "職位", "研究室"]}
return file
end

#main
fetchSyllabusUrl.each{|url|
`wget #{url}`
}
