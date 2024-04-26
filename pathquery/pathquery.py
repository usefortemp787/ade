from lxml import etree

tree = etree.parse("path\\to\\ur\\directory\\file.xml")
root = tree.getroot()

#cars model names 
cars = root.xpath("//car/model/text()")
for car in cars:
    print(car)
    
    
    
#cars company names 
cars = root.xpath("//car/make/text()")
for company in cars:
    print(company)
    
    
#cars by both
cars= root.xpath("//car")
for car in cars : 
    model = car.xpath("model/text()")[0]
    make = car.xpath("make/text()")[0]
    print(model,"-->",make)
    
    
#cars by both
cars= root.xpath("//car")
for car in cars : 
    model = car.xpath("model/text()")[0]
    make = car.xpath("make/text()")[0]
    price = car.xpath("price/text()")[0]
    
    if(int(price)>25000):
        print(model,"-->",make)
    
    

